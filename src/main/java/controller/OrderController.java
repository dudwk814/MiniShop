package controller;

import domain.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import security.domain.CustomUser;
import service.CartService;
import service.ProductService;
import service.UserService;
import service.OrderService;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.text.DecimalFormat;
import java.util.*;

@Controller
@RequestMapping("/order/")
@RequiredArgsConstructor
@Log4j
public class OrderController {

    private final UserService userService;

    private final CartService cartService;

    private final OrderService orderService;

    private final ProductService productService;

    /**
     * 주문 폼으로 이동
     * @param userid
     * @param model
     * @return
     */
    @GetMapping("/orderForm")
    public String orderForm(@RequestParam("userid") String userid, Model model) {

        // 회원 정보 (주소 불러오기)
        UserVO user = userService.read(userid);

        // 장바구니 목록 불러오기
        List<CartVO> list = cartService.cartList(userid);

        // 장바구니에 있는 상품 개수 (amount x)
        int cartCount;

        for (cartCount = 0; cartCount < list.size(); cartCount++) {
            cartCount += cartCount;
        }

        int sumMoney = cartService.sumMoney(userid);


        int fee = sumMoney >= 50000 ? 0 : 3000;

        model.addAttribute("cart", list);
        model.addAttribute("cartCount", cartCount);
        model.addAttribute("sumMoney", sumMoney);
        model.addAttribute("fee", fee);
        model.addAttribute("AllSumMoney", sumMoney + fee);
        model.addAttribute("userid", userid);
        model.addAttribute("user", user);


        return "order/orderForm";
    }

    /**
     * 주문
     * @param orderVO
     * @param orderDetailsVO
     * @param model
     * @param rttr
     * @return
     */
    @Transactional
    @PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
    @PostMapping("order")
    public String order(OrderVO orderVO, OrderDetailsVO orderDetailsVO, Model model, RedirectAttributes rttr) {

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
        String subNum = "";

        for (int i = 1; i <= 6; i++) {
            subNum += (int) (Math.random() * 10);
        }

        String orderId = ymd + "_" + subNum;

        orderVO.setOrder_id(orderId);
        orderDetailsVO.setOrder_id(orderId);

        orderService.insert(orderVO);
        orderService.insertDetail(orderDetailsVO);

        cartService.deleteAfterOrder(orderVO.getUserid());

        rttr.addFlashAttribute("result", "주문이 정상적으로 완료되었습니다.");





        return "redirect:/order/order?orderId=" + orderId;
    }

    /**
     * 주문 결과 확인 창으로 이동
     * @param model
     * @param orderId
     * @param rttr
     * @return
     */
    @Transactional
    @PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
    @GetMapping("/order")
    public String orderGet(Model model, String orderId, RedirectAttributes rttr) {

        List<ProductVO> productVOList = new ArrayList<>();
        Map<Integer, Integer> amountMap = new HashMap<>();
        int totalPrice = 0;


        OrderVO getOrderVO = orderService.get(orderId);
        List<OrderDetailsVO> getOrderDetailsVO = orderService.getOrderDetails(orderId);

        for (int i = 0; i < getOrderDetailsVO.size(); i++) {
            ProductVO product = productService.getProduct(getOrderDetailsVO.get(i).getProduct_id());

            int amount = getOrderDetailsVO.get(i).getAmount();
            productVOList.add(product);
            amountMap.put(i, amount);

            totalPrice += product.getProduct_price() * amount;

        }

        if (getOrderVO == null) {
            boolean orderNotExist = true;
            model.addAttribute("orderNotExist", orderNotExist);
            model.addAttribute("result", "장바구니가 비었습니다.");
        }
        model.addAttribute("order", getOrderVO);
        model.addAttribute("orderDetails", getOrderDetailsVO);
        model.addAttribute("productVOList", productVOList);
        model.addAttribute("amountMap", amountMap);
        model.addAttribute("totalPrice", totalPrice);


        return "order/orderResult";
    }


    /**
     * 주문 내역 조회창으로 이동
     * @param userid
     * @param cri
     * @param model
     * @return
     */
    @Transactional
    @PreAuthorize("isAuthenticated() and (( #userid == principal.username ) or hasRole('ROLE_ADMIN'))")
    @GetMapping("/getOrderList")
    public String getOrder(String userid, @ModelAttribute("cri") Criteria cri, Model model) {


        List<OrderVO> orderVOList = orderService.getList(userid, cri);

        int orderTotalCount = orderService.getTotalOrderCount(userid);

        int orderCount = 0;

        if (orderVOList == null) {
            model.addAttribute("orderCount", orderCount);
        } else if (orderVOList != null) {
            orderCount = 1;
            model.addAttribute("orderCount", orderCount);
        }

        log.info(orderCount);

        model.addAttribute("orderList", orderVOList);
        model.addAttribute("pageMaker", new PageDTO(cri, orderTotalCount));


        return "order/orderList";
    }

    @Transactional
    @PostMapping("/remove")
    public String removeOrder(String order_id, String userid, RedirectAttributes rttr) {
        boolean delete = orderService.delete(order_id);

        rttr.addFlashAttribute("removeMsg", order_id + "주문을 취소했습니다.");

        return "redirect:/order/getOrderList?userid=" + userid;
    }
}

package controller;

import domain.*;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.AddressMapper;
import mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.AddressService;
import service.CartService;
import service.MemberService;
import service.OrderService;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/order/")
@RequiredArgsConstructor
@Log4j
public class OrderController {

    private final MemberService memberService;

    private final CartService cartService;

    private final OrderService orderService;

    @GetMapping("/orderForm")
    public String orderForm(@RequestParam("userid") String userid, Model model) {

        // 회원 정보 (주소 불러오기)
        MemberVO user = memberService.read(userid);

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





        return "redirect:/order/order?orderId=" + orderId;
    }

    @PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
    @GetMapping("/order")
    public String orderGet(Model model, String orderId, RedirectAttributes rttr) {

        OrderVO getOrderVO = orderService.get(orderId);
        List<OrderDetailsVO> getOrderDetailsVO = orderService.getOrderDetails(orderId);

        if (getOrderVO == null) {
            boolean orderNotExist = true;
            model.addAttribute("orderNotExist", orderNotExist);
            model.addAttribute("msg", "장바구니가 비었습니다.");
        }
        model.addAttribute("order", getOrderVO);
        model.addAttribute("orderDetails", getOrderDetailsVO);
        rttr.addFlashAttribute("result", "주문이 정상적으로 완료되었습니다.");

        return "order/orderResult";
    }



    @PreAuthorize("isAuthenticated() and ((#userid == principal.member.userid) or hasAnyRole('ROLE_ADMIN'))")
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

    @PostMapping("/remove")
    public String removeOrder(String order_id, String userid, RedirectAttributes rttr) {
        boolean delete = orderService.delete(order_id);

        rttr.addFlashAttribute("removeMsg", order_id + "주문을 취소했습니다.");

        return "redirect:/order/getOrderList?userid=" + userid;
    }
}

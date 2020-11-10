package controller;

import domain.*;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.AddressMapper;
import mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.AddressService;
import service.CartService;
import service.MemberService;
import service.OrderService;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/order/")
@Log4j
public class OrderController {

    @Setter(onMethod_ = @Autowired)
    private MemberService memberService;

    @Setter(onMethod_ = @Autowired)
    private CartService cartService;

    @Setter(onMethod_ = @Autowired)
    private OrderService orderService;

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
    @PostMapping("order")
    public String order(OrderVO orderVO, OrderDetailsVO orderDetailsVO, Model model) {

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
        String subNum = "";

        for(int i = 1; i <= 6; i ++) {
            subNum += (int)(Math.random() * 10);
        }

        String orderId = ymd + "_" + subNum;

        orderVO.setOrder_id(orderId);
        orderDetailsVO.setOrder_id(orderId);

        orderService.insert(orderVO);
        orderService.insertDetail(orderDetailsVO);

        cartService.deleteAfterOrder(orderVO.getUserid());

        OrderVO getOrderVO = orderService.get(orderId);
        List<OrderDetailsVO> getOrderDetailsVO = orderService.getOrderDetails(orderId);

        if (getOrderVO == null) {
            boolean orderNotExist = true;
            model.addAttribute("orderNotExist", orderNotExist);
            model.addAttribute("msg", "장바구니가 비었습니다.");
        }
        model.addAttribute("order", getOrderVO);
        model.addAttribute("orderDetails", getOrderDetailsVO);

        if (orderVO.getPayment_option() == 1) {
            model.addAttribute("payment_option", "계좌이체");
        } else if (orderVO.getPayment_option() == 2) {
            model.addAttribute("payment_option", "신용카드");
        }


        return "order/orderResult";
    }

    @PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
    @GetMapping("/get")
    public String getOrder(String order_id, Model model) {

        return "order/get";
    }
}

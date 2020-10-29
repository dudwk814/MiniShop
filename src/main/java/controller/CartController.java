package controller;

import domain.CartVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import service.CartService;
import service.ProductService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@RequestMapping("/cart")
@Controller
public class CartController {

    @Setter(onMethod_ = @Autowired)
    private CartService cartService;

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;

    @GetMapping("/cart")
    public String cart(String userid, Model model) {

        // 장바구니 목록 불러오기
        List<CartVO> list = cartService.cartList(userid);

        // 장바구니에 있는 상품 개수 (amount x)
        int cartCount;

        for (cartCount = 1; cartCount <= list.size(); cartCount++) {
            cartCount += cartCount;
        }

        int sumMoney = cartService.sumMoney(userid);

        int fee = sumMoney >= 50000 ? 0 : 2500;

        model.addAttribute("cart", list);
        model.addAttribute("cartCount", cartCount);
        model.addAttribute("sumMoney", sumMoney);
        model.addAttribute("fee", fee);
        model.addAttribute("AllSumMoney", sumMoney + fee);

        log.info(cartCount);
        log.info("배송비 : " + fee);
        log.info("금액 : " + sumMoney);

        log.info("CartPage");

        return "cart/cart";
    }
}

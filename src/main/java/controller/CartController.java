package controller;

import domain.CartVO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.CartService;
import service.ProductService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@RequestMapping("/cart")
@RequiredArgsConstructor
@Controller
public class CartController {

    private final CartService cartService;

    private final ProductService productService;

    /**
     * 장바구니 목록 조회
     * @param userid
     * @param model
     * @return
     */
    @PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
    @GetMapping("/cart")
    public String cart(String userid, Model model) {

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
        model.addAttribute("sumMoney", sumMoney);
        model.addAttribute("fee", fee);
        model.addAttribute("AllSumMoney", sumMoney + fee);
        model.addAttribute("userid", userid);

        log.info(cartCount);
        log.info("배송비 : " + fee);
        log.info("금액 : " + sumMoney);

        log.info("CartPage");

        return "cart/cart";
    }

    /**
     * 장바구니에 상품 등록
     * @param cartVO
     * @param rttr
     * @return
     */
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
    @PostMapping("/add")
    public String addCart(CartVO cartVO, RedirectAttributes rttr) {

        int cartCount = cartService.countCart(cartVO.getProduct_id(), cartVO.getUserid());



        if(cartCount >= 1) {

            log.info("이미 장바구니에 제품이 존재합니다.");
            cartService.updateCart(cartVO);

            rttr.addFlashAttribute("result", "장바구니에 " + cartVO.getProduct_name() + " 상품이 추가되었습니다.");

            return "redirect:/cart/cart?userid=" + cartVO.getUserid();
        }

        log.info("Add Cart : " + cartVO.getUserid());

        rttr.addFlashAttribute("result", "장바구니에 " + cartVO.getProduct_name() + " 상품이 추가되었습니다.");

        cartService.insertCart(cartVO);



        return "redirect:/cart/cart?userid=" + cartVO.getUserid();
    }

    /**
     * 장바구니에 상품 삭제
     * @param cart_id
     * @param userid
     * @param rttr
     * @return
     */
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
    @PostMapping("/remove")
    public String removeCart(@RequestParam("cart_id") int cart_id, @RequestParam("userid") String userid, RedirectAttributes rttr) {

        log.info("remo Cart : " + cart_id);

        cartService.deleteCart(cart_id);

        rttr.addFlashAttribute("userid", userid);

        rttr.addFlashAttribute("result", "장바구니에서 상품을 삭제했습니다.");

        return "redirect:/cart/cart?userid=" + userid;
    }

    /**
     * 장바구니에 상품 개수 수정
     * @param vo
     * @param rttr
     * @return
     */
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
    @PostMapping("/amountModify")
    public String amountModify(CartVO vo, RedirectAttributes rttr) {

        if (vo.getAmount() <= 0) {
            return "redirect:/cart/cart?userid=" + vo.getUserid();
        }

        log.info("Modify Amount : " + vo.getAmount());
        cartService.modifyCart(vo);

        rttr.addFlashAttribute("result", "장바구니에서 상품의 수량이 변경되었습니다.");

        return "redirect:/cart/cart?userid=" + vo.getUserid();

    }

}

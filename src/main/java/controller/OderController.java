package controller;

import domain.AddressVO;
import domain.CartVO;
import domain.OrderVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.AddressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.AddressService;
import service.CartService;

import java.util.List;

@Controller
@RequestMapping("/order/")
@Log4j
public class OderController {

    @Setter(onMethod_ = @Autowired)
    private AddressService addressService;

    @Setter(onMethod_ = @Autowired)
    private CartService cartService;

    @GetMapping("/orderForm")
    public String orderForm(@RequestParam("userid") String userid, Model model) {


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


        return "order/orderForm";
    }

    @PostMapping("order")
    public String order(OrderVO vo, Model model) {

        AddressVO addressVO = vo.getAddressVO();

        addressService.insert(addressVO);

        addressVO = addressService.get(vo.getUserid());

        vo.setAddressVO(addressVO);



        return "order/orderResult";
    }
}

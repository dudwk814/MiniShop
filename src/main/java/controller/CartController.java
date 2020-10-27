package controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@RequestMapping("/cart")
@Controller
public class CartController {

    @GetMapping("/cart")
    public String cart() {

        log.info("CartPage");

        return "cart/cart";
    }
}

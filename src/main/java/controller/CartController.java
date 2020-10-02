package controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Log4j
@Controller
public class CartController {

    @GetMapping("/cart")
    public String cart() {

        log.info("CartPage");

        return "cart/cart";
    }
}

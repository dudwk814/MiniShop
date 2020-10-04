package controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class ShopController {

    @GetMapping("/shop")
    public String shop() {

        log.info("Shop Page");

        return "shop/shop";
    }
}
package controller;

import domain.ProductVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import service.ProductService;

import java.util.List;

@Controller
@Log4j
public class ShopController {

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;

    @GetMapping("/shop")
    public String shop(Model model) {

        List<ProductVO> productList = productService.getProductList();

        log.info("go to Shop Page");

        model.addAttribute("productList", productList);


        return "shop/shop";
    }
}

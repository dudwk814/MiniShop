package controller;

import domain.ProductVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ProductService;

@Controller
@RequestMapping("/product/")
@Log4j
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    // 상품 조회
    @GetMapping("/read")
    public String read(int product_id, String userid, Model model) {

        ProductVO product = productService.getProduct(product_id);

        model.addAttribute("product", product);
        model.addAttribute("userid", userid);

        return "/product/productRead";
    }
    

}

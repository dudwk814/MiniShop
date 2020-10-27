package controller;

import domain.ProductVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ProductService;

@Controller
@RequestMapping("/product/")
@Log4j
public class ProductController {

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;

    // 상품 조회
    @GetMapping("/read")
    public String read(int product_id, Model model) {

        ProductVO product = productService.getProduct(product_id);

        model.addAttribute("product", product);

        return "product/productRead";
    }
    

}

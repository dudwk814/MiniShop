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
public class HomeController {

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;

    @GetMapping("/")
    public String home(Model model) {

        List<ProductVO> list = productService.getProductList();

        model.addAttribute("pList", list);

        log.info("Main Page");
        return "home";
    }


}

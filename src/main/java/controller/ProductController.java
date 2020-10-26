package controller;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import service.ProductService;

@Controller
@Log4j
public class ProductController {

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;

    

}

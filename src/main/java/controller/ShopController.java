package controller;

import domain.Criteria;
import domain.PageDTO;
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

    /**
     * 상품 페이지로 이동시 전체 상품 조회
     * @param cri
     * @param model
     * @return
     */
    @GetMapping("/shop")
    public String shop(Criteria cri, Model model) {

        List<ProductVO> productList = productService.getProductList(cri);

        int totalCount = productService.getTotalCount();

        log.info("go to Shop Page");

        model.addAttribute("productList", productList);

        model.addAttribute("searchMaker", new PageDTO(cri, totalCount));


        return "shop/shop";
    }
}

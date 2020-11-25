package controller;

import domain.MemberVO;
import domain.ProductVO;
import domain.authVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import service.MemberService;
import service.ProductService;

import java.util.List;

@Controller
@RequestMapping("/admin/")
@Log4j
public class AdminController {

    @Setter(onMethod_ = @Autowired)
    private MemberService memberService;

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;


    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/page")
    public String page(Model model) {

        List<MemberVO> memberList = memberService.getList();

        List<ProductVO> productList = productService.getProductList();


        model.addAttribute("memberList", memberList);
        model.addAttribute("productList", productList);

        return "/admin/page";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/member/authModify")
    public String memberAuthModify(Model model, authVO auth) {


        memberService.updateAuth(auth);

        return "redirect:/admin/page";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/product/insertProduct")
    public String insertProduct(ProductVO vo) {

        return "redirect:/admin/page";
    }
}

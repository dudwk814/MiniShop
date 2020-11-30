package controller;

import domain.MemberVO;
import domain.OrderVO;
import domain.ProductVO;
import domain.authVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.MemberService;
import service.OrderService;
import service.ProductService;

import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/admin/")
@Log4j
public class AdminController {

    @Setter(onMethod_ = @Autowired)
    private MemberService memberService;

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;

    @Setter(onMethod_ = @Autowired)
    private OrderService orderService;



    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/page")
    public String page(Model model) {

        List<MemberVO> memberList = memberService.getList();

        List<ProductVO> productList = productService.getProductList();

        /*List<OrderVO> orderList = orderService.getAllList();*/


        model.addAttribute("memberList", memberList);
        model.addAttribute("productList", productList);
        /*model.addAttribute("orderList", orderList);*/

        return "/admin/page";
    }


    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/member/authModify")
    public String memberAuthModify(Model model, authVO auth) {


        memberService.updateAuth(auth);

        return "redirect:/admin/page";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/product/insertProduct")
    public String insertProductPage() {

        return "/admin/insertProduct";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/product/insertProduct")
    public String insertProduct(ProductVO vo, MultipartFile product_photo) {

        System.out.println("제품 등록");

        // 사진 저장 경로(프로젝트 파일의 리소스 폴더)
        String uploadFolder = "C:\\Users\\PCY\\IdeaProjects\\MiniShop\\out\\artifacts\\MiniShop_war_exploded\\resources\\shop\\images";

        if(product_photo.isEmpty() != true || product_photo.getSize() != 0) {
            // 사진 이름
            String product_url = product_photo.getOriginalFilename();

            vo.setProduct_url(product_url);

            File saveImg = new File(uploadFolder, product_photo.getOriginalFilename());

            try {
                product_photo.transferTo(saveImg);

                productService.insertProduct(vo);

            } catch (Exception e) {
                log.error(e.getMessage());
            }
        }



        return "redirect:/admin/page";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/product/modify")
    public String productModifyPage(int product_id, Model model) {

        ProductVO product = productService.getProduct(product_id);

        model.addAttribute("product", product);

        return "admin/modifyProduct";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/product/remove")
    public String removeProduct(int product_id) {

        productService.deleteProduct(product_id);

        return "redirect:/admin/page";
    }
}

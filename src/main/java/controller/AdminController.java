package controller;

import domain.*;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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


    // 관리자 페이지 조회 메소드
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/page")
    public String page(Criteria cri, Model model) {

        // 멤버 리스트
        List<MemberVO> memberList = memberService.getList();

        // 상품 리스트
        List<ProductVO> productList = productService.getProductList(cri);

        // 주문 리스트
        List<OrderVO> orderList = orderService.getAllList();


        model.addAttribute("memberList", memberList);
        model.addAttribute("productList", productList);
        model.addAttribute("orderList", orderList);

        return "/admin/page";
    }

    // 멤버 권한 등급 번경 메소드
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/member/authModify")
    public String memberAuthModify(Model model, authVO auth, RedirectAttributes rttr) {


        // 회원 권한 등급 변경 성공 시 모달 창 띄우기
        if(memberService.updateAuth(auth)){
            rttr.addFlashAttribute("result", auth.getUserid());
        }

        return "redirect:/admin/page";
    }

    // 상품 등록 페이지 이동 메소드
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/product/insertProduct")
    public String insertProductPage() {

        return "/admin/insertProduct";
    }

    // 상품 등록 메소드
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/product/insertProduct")
    public String insertProduct(ProductVO vo, MultipartFile product_photo, RedirectAttributes rttr) {

        System.out.println("상품 등록");

        // 이미지 저장 경로(프로젝트 파일의 리소스 폴더)
        String uploadFolder = "C:\\Users\\PCY\\IdeaProjects\\MiniShop\\out\\artifacts\\MiniShop_war_exploded\\resources\\shop\\images";

        if(product_photo.isEmpty() != true || product_photo.getSize() != 0) {
            // 이미지 이름
            String product_url = product_photo.getOriginalFilename();

            vo.setProduct_url(product_url);

            File saveImg = new File(uploadFolder, product_photo.getOriginalFilename());

            try {
                product_photo.transferTo(saveImg);

                productService.insertProduct(vo);

                rttr.addFlashAttribute("result", vo.getProduct_name());

            } catch (Exception e) {
                log.error(e.getMessage());
            }
        }

        return "redirect:/admin/page";
    }

    // 상품 수정 페이지 이동 메소드
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/product/modify")
    public String productModifyPage(int product_id, Model model) {

        ProductVO product = productService.getProduct(product_id);

        model.addAttribute("product", product);

        return "admin/modifyProduct";
    }

    // 상품 수정 메소드
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/product/modify")
    public String productModify(ProductVO vo, MultipartFile product_photo, RedirectAttributes rttr) {

        // 이미지 저장 경로(프로젝트 파일의 리소스 폴더)
        String uploadFolder = "C:\\Users\\PCY\\IdeaProjects\\MiniShop\\out\\artifacts\\MiniShop_war_exploded\\resources\\shop\\images";

        if(product_photo.isEmpty() != true || product_photo.getSize() != 0) {
            // 이미지 이름
            String product_url = product_photo.getOriginalFilename();

            vo.setProduct_url(product_url);

            File saveImg = new File(uploadFolder, product_photo.getOriginalFilename());

            try {
                product_photo.transferTo(saveImg);

                if (productService.updateProduct(vo)) {
                    rttr.addFlashAttribute("result", vo.getProduct_id());
                }
            } catch (Exception e) {
                log.error(e.getMessage());
            }

            return "redirect:/admin/page";
        }

        if (productService.updateProduct(vo)) {
            rttr.addFlashAttribute("result", vo.getProduct_id());
        }

        return "redirect:/admin/page";


    }

    // 상품 삭제 메소드
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/product/remove")
    public String removeProduct(int product_id, RedirectAttributes rttr) {

        // 상품 삭제 성공 시 모달 창 띄우기
        if(productService.deleteProduct(product_id)) {
            rttr.addFlashAttribute("result", product_id);
        }


        return "redirect:/admin/page";
    }

    // 주문 취소 메소드
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/order/cancel")
    public String orderCancel(String order_id, RedirectAttributes rttr) {

        if(orderService.delete(order_id)){
            rttr.addFlashAttribute("result", order_id);
        }

        return "redirect:/admin/page";
    }
}

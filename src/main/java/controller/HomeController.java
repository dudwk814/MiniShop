package controller;

import domain.ProductVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import service.CartService;
import service.ProductService;
import sun.plugin.liveconnect.SecurityContextHelper;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;

@Controller
@Log4j
public class HomeController {

    @Setter(onMethod_ = @Autowired)
    private ProductService productService;

    @Setter(onMethod_ = @Autowired)
    private CartService cartService;

    @GetMapping("/")
    public String home(Model model, HttpSession session) {

        List<ProductVO> list = productService.getHomeProductList();

        model.addAttribute("pList", list);

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        String userid = auth.getName();

        int cartForMember = cartService.countCartForMember(userid);

        log.info(userid);



        model.addAttribute("userid", userid);
        model.addAttribute("cartForMember", cartForMember);

        session.setAttribute("userid", userid);

        log.info("Main Page");
        return "home";
    }


}

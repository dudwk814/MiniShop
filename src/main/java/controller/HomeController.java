package controller;

import domain.ProductVO;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class HomeController {

    private final ProductService productService;

    @GetMapping("/")
    public String home(Model model, HttpSession session) {

        List<ProductVO> list = productService.getHomeProductList();

        model.addAttribute("pList", list);


        String userid = (String) session.getAttribute("userid");


        log.info(userid);

        log.info("Main Page");
        return "home";
    }


}

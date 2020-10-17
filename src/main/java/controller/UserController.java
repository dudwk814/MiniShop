package controller;

import domain.MemberVO;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/")
@Log4j
public class UserController {

    @GetMapping("/loginForm")
    public String loginForm(String error, String logout, Model model) {

        log.info("error : " + error);
        log.info("logout : " + logout);

        if (error != null) {
            model.addAttribute("error", "Login Error Check Your Account");
        }

        if (logout != null) {
            model.addAttribute("logout", "Logout!");
        }

        log.info("Move to LoginForm");

        return "user/loginForm";
    }

    @GetMapping("/modifyForm")
    public String modifyForm() {

        log.info("modify");

        return "user/modifyForm";
    }
}

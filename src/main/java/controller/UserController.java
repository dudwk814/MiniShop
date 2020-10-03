package controller;

import domain.UserVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import service.UserService;

@Controller
@RequestMapping("/user")
@Log4j
public class UserController {

    @Setter(onMethod_ = {@Autowired})
    private UserService userService;

    @GetMapping("/joinForm")
    public String joinForm() {

        log.info("Move to JoinForm");

        return "user/joinForm";
    }

    @PostMapping("/join")
    public String join(@ModelAttribute("user") UserVO user, Model model) {

        log.info("join : " + user.toString());

        return "redirect:/";
    }

    @GetMapping("/loginForm")
    public String loginForm() {

        log.info("Move to loginForm");

        return "user/loginForm";
    }
}

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.UserService;

@Controller
@RequestMapping("/user/")
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
    public String join(UserVO user, RedirectAttributes rttr) {

        log.info("join : " + user);

        userService.register(user);

        rttr.addFlashAttribute("result", user.getUser_name());

        return "redirect:/";
    }

    @GetMapping("/loginForm")
    public String loginForm() {

        log.info("Move to loginForm");

        return "user/loginForm";
    }

    @PostMapping("/login")
    public String login(UserVO user, RedirectAttributes rttr) {

        log.info("login...." + user.getUser_id());

        return "redirect:/";
    }
}

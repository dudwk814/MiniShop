package controller;

import domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import service.MemberService;

@Controller
@RequestMapping("/user/")
@Log4j
public class UserController {

    @Setter(onMethod_ = {@Autowired})
    private MemberService memberService;

    @GetMapping("/checkMemberForm")
    public String checkMemberForm() {

        log.info("Move to checkMemberForm");

        return "user/checkMemberForm";
    }


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
    public String modifyForm(String userid, Model model) {

        log.info("modifyForm " + userid);

        MemberVO memberVO = memberService.read(userid);

        model.addAttribute("member", memberVO);

        return "/user/modifyForm";
    }
}

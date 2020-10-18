package controller;

import domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.MemberService;

@Controller
@RequestMapping("/user/")
@Log4j
public class MemberController {

    @Setter(onMethod_ = {@Autowired})
    private MemberService memberService;

    @GetMapping("/joinForm")
    public String joinForm() {

        log.info("Move to JoinForm");

        return "user/joinForm";
    }

    @PostMapping("/join")
    public String join(MemberVO vo) {

        log.info("Joined  " + vo.getUserid());
        int register = memberService.register(vo);

        return "user/loginForm";
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

    @GetMapping("/checkMemberForm")
    public String checkMemberForm() {

        log.info("Move to checkMemberForm");

        return "user/checkMemberForm";
    }

    @GetMapping("/modifyForm")
    public String modifyForm(String userid, Model model) {

        log.info("modifyForm " + userid);

        MemberVO memberVO = memberService.read(userid);

        model.addAttribute("member", memberVO);

        return "/user/modifyForm";
    }

    @PostMapping("/modify")
    public String modify(MemberVO vo) {

        int modify = memberService.modify(vo);

        return "redirect:/";
    }


}

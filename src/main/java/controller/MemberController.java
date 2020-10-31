package controller;

import domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/user/")
@Log4j
public class MemberController {

    @Setter(onMethod_ = {@Autowired})
    private MemberService memberService;

    @Setter(onMethod_ = @Autowired)
    private GoogleConnectionFactory googleConnectionFactory;

    @Setter(onMethod_ = @Autowired)
    private OAuth2Parameters googleOAuth2Parameters;

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

        // 구글 code 발행
        OAuth2Operations authOperations = googleConnectionFactory.getOAuthOperations();

        // 로그인 페이지 이동 url 생성
        String url = authOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

        model.addAttribute("google_url", url);


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

        return "/user/checkMemberForm";
    }

    @PostMapping ("/modifyForm")
    public String modifyForm() {

        log.info("Move to ModifyFrom");

        return "/user/modifyForm";
    }

    @PostMapping("/modify")
    public String modify(MemberVO vo) {

        int modify = memberService.modify(vo);

        return "user/modifyForm";
    }

    @PostMapping("/remove")
    public String remove(String userid) {

        log.info("Removed Member for " + userid);

        memberService.remove(userid);

        return "redirect:/user/logout";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/user/loginForm";
    }





}

package controller;

import domain.AddressVO;
import domain.MemberVO;
import domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

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

    // 회원 가입 폼으로 이동
    @GetMapping("/joinForm")
    public String joinForm(HttpServletResponse response, Model model, @ModelAttribute("memberVO") MemberVO memberVO, @RequestParam(value = "member", required = false) MemberVO member) {

        log.info("Move to JoinForm");

        return "user/joinForm";
    }

    // 회원 가입
    @PostMapping("/join")
    public String join(MemberVO vo, RedirectAttributes rttr) {

        log.info("Joined  " + vo.getUserid());
        int register = memberService.register(vo);

        rttr.addFlashAttribute("result", register);

        return "redirect:/";
    }


    // 로그인 폼으로 이동
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

    // 회원 정보 체크
    @PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
    @GetMapping("/checkMemberForm")
    public String checkMemberForm() {

        log.info("Move to checkMemberForm");

        return "/user/checkMemberForm";
    }

    // 회원 정보 변경 폼으로 이동
    @PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
    @PostMapping ("/modifyForm")
    public String modifyForm(String userid, Model model) {

        log.info("Move to ModifyFrom");

        MemberVO member = memberService.getMember(userid);

        model.addAttribute("member", member);

        return "/user/modifyForm";
    }

    // 회원 정보 변경
    @PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
    @PostMapping("/modify")
    public String modify(MemberVO vo, RedirectAttributes rttr) {

        int modify = memberService.modify(vo);

        rttr.addFlashAttribute("result", modify);

        return "redirect:/";
    }

    // 회원 탈퇴
    @PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
    @PostMapping("/remove")
    public String remove(String userid) {

        log.info("Removed Member for " + userid);

        memberService.remove(userid);

        return "redirect:/user/logout";
    }

    // 로그아웃
    @PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')") 
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/user/loginForm";
    }

    // 회원가입 아이디 체크
    @ResponseBody
    @RequestMapping(value = "/ID_Check", produces="text/plane")
    public String ID_Check(@RequestBody String paramData) {
        //클라이언트가 보낸 ID값
        String ID = paramData.trim();
        System.out.println(ID);

        int findUser = memberService.findUser(ID);

        if(findUser == 1) {//결과 값이 있으면 아이디 존재
            return "-1";
        } else {		//없으면 아이디 존재 X
            System.out.println("null");
            return "0";
        }
    }

    // 비밀번호 찾기 폼으로 이동
    @GetMapping("/findPasswordForm")
    public String findPasswordForm() {

        return "/user/findPasswordForm";
    }

    // 비밀번호 변경 폼으로 이동
    @PostMapping("/modifyPasswordForm")
    public String modifyPasswordForm(MemberVO vo, Model model) {

        MemberVO member = memberService.findPassword(vo);

        model.addAttribute("member", member);

        return "/user/modifyPasswordForm";
    }

    // 비밀번호 변경
    @PostMapping("/modifyPassword")
    public String modifyPassword(MemberVO vo, RedirectAttributes rttr) {

        int result = memberService.modifyPassword(vo);

        rttr.addFlashAttribute("result", result);

        return "redirect:/";
    }


}

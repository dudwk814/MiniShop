package controller;

import domain.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/user/")
@Log4j
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    private final BCryptPasswordEncoder encoder;

    /**
     * 회원 가입 폼으로 이동
     * @return
     */
    @GetMapping("/joinForm")
    public String joinForm() {

        log.info("Move to JoinForm");

        return "user/joinForm";
    }

    /**
     * 회원 가입
     * @param vo
     * @param rttr
     * @return
     */
    @PostMapping("/join")
    public String join(UserVO vo, RedirectAttributes rttr) {

        log.info("Joined  " + vo.getUserid());

        rttr.addFlashAttribute("result", vo.getUserid() + "님의 회원가입을 축하합니다!");

        return "redirect:/";
    }


    /**
     * 로그인 폼으로 이동
     * @param error
     * @param logout
     * @param model
     * @return
     */
    @PostMapping("/loginForm")
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

    /**
     * 회원 정보 체크 (비밀번호 확인)
     * @return
     */
    @PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
    @GetMapping("/checkUserForm")
    public String checkUserForm() {

        log.info("Move to checkMemberForm");

        return "/user/checkUserForm";
    }

    /**
     * 회원 정보 변경 폼으로 이동
     * @param userid
     * @param userpw
     * @param rttr
     * @param model
     * @return
     */
    @PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
    @PostMapping ("/modifyForm")
    public String modifyForm(String userid, String userpw, RedirectAttributes rttr, Model model) {

        log.info("Move to ModifyFrom");

        UserVO user = userService.getUser(userid);

        String userpw2 = user.getUserpw();

        boolean matches = encoder.matches(userpw, userpw2);


        if (matches) {  // 비밀번호가 일치한다면 회원 정보 변경 폼으로 이동
            model.addAttribute("user", user);

            return "/user/modifyForm";
        } else {    // 비밀번호가 일치하지 않는다면 회원 정보 체크 (비밀번호 확인) 폼으로 이동
            rttr.addFlashAttribute("result", "비밀번호가 틀립니다.");
            return "/user/checkUserForm";
        }


    }

    /**
     * 회원 정보 변경
     * @param vo
     * @param rttr
     * @return
     */
    @PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
    @PostMapping("/modify")
    public String modify(UserVO vo, RedirectAttributes rttr) {


        rttr.addFlashAttribute("result", vo.getUserid() + "님의 비밀번호가 성공적으로 변경되었습니다.");

        return "redirect:/";
    }

    /**
     * 회원 탈퇴
     * @param userid
     * @param rttr
     * @return
     */
    @PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
    @PostMapping("/remove")
    public String remove(String userid, RedirectAttributes rttr) {

        log.info("Removed Member for " + userid);

        userService.remove(userid);

        rttr.addFlashAttribute("result", userid + "님의 회원탈퇴가 정상적으로 처리되었습니다.");

        return "redirect:/user/logout";
    }

    /**
     * 로그아웃
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @PreAuthorize("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')")
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
    }

    /**
     * 회원가입 아이디 중복 체크
     * @param userid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ID_Check")
    public String ID_Check(@RequestBody String userid) {
        //클라이언트가 보낸 ID값
        String ID = userid.trim();
        System.out.println(ID);

        int findUser = userService.findUser(ID);

        if(findUser == 1) {//결과 값이 있으면 아이디 존재
            return "-1";
        } else {		//없으면 아이디 존재 X
            System.out.println("null");
            return "0";
        }
    }

    /**
     * 비밀번호 찾기 폼으로 이동
     * @return
     */
    @GetMapping("/findPasswordForm")
    public String findPasswordForm() {

        return "/user/findPasswordForm";
    }

    /**
     * 비밀번호 재설정 폼으로 이동
     * @param vo
     * @param model
     * @return
     */
    @PostMapping("/modifyPasswordForm")
    public String modifyPasswordForm(UserVO vo, Model model) {

        UserVO member = userService.findPassword(vo);

        model.addAttribute("member", member);

        return "/user/modifyPasswordForm";
    }

    /**
     * 비밀번호 재설정
     * @param vo
     * @param rttr
     * @return
     */
    @PostMapping("/modifyPassword")
    public String modifyPassword(UserVO vo, RedirectAttributes rttr) {

        int result = userService.modifyPassword(vo);

        rttr.addFlashAttribute("result",  "비밀번호가 성공적으로 변경 되었습니다.");

        return "redirect:/";
    }


}

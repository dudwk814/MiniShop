package controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;

@Controller
@Log4j
public class OAuthController {

    // 구글 Callback호출 메소드
    @RequestMapping(value = "/login/google/auth", method = { RequestMethod.GET, RequestMethod.POST })
    public String googleCallback(Model model, @RequestParam String code) throws IOException {

        System.out.println("Google login success");

        //저는 성공하면 메인페이지로 리다이렉트합니다.
        return "redirect:/";
    }
}

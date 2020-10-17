package controller;
/*
 *  security 관련 컨트롤러
 */


import lombok.extern.log4j.Log4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Log4j
public class CommonController {

    @GetMapping("/accessError")
    public String accessError(Authentication auth, Model model) {

        log.info("access Denied : " + auth);

        model.addAttribute("msg", "Access Denied");

        return "accessError";
    }



}

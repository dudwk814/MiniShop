package controller;

import domain.UserVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.UserService;

@Controller
@Log4j
public class CommonController {

    @Setter(onMethod_ = {@Autowired})
    private UserService userService;

    @PostMapping("/login")
    public String login(UserVO user, RedirectAttributes rttr) {

        log.info("login : " + user.getUser_name());

        UserVO userVO = userService.getUser(user);

        rttr.addFlashAttribute("user", userVO.getUser_name());

        return "redirect:/";
    }

}

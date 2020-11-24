package controller;

import domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import service.MemberService;

import java.util.List;

@Controller
@RequestMapping("/admin/")
@Log4j
public class AdminController {

    @Setter(onMethod_ = @Autowired)
    private MemberService memberService;


    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/page")
    public String page(Model model) {

        List<MemberVO> memberList = memberService.getList();

        model.addAttribute("memberList", memberList);


        return "/admin/page";
    }
}

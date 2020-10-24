package controller;

import domain.Criteria;
import domain.NoticeVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import service.NoticeService;

@Controller
@RequestMapping("/notice/")
@Log4j
public class NoticeController {

    @Setter(onMethod_ = @Autowired)
    private NoticeService noticeService;

    // 공지 조회
    @GetMapping("/read")
    public String readNotice(Long nno, @ModelAttribute("cri") Criteria cri, Model model) {

        NoticeVO noticeVO = noticeService.read(nno);

        model.addAttribute("notice", noticeVO);

        return "board/notice/read";
    }

    // 공지 작성 폼 이동
    @GetMapping("/registerFrom")
    public String registerForm() {

        log.info("Move to Notice RegisterFrom");

        return "board/notice/registerFrom";
    }

    // 공지 삭제
    @PostMapping("/remove")
    public String removeNotice(Long nno, @ModelAttribute("cri") Criteria cri) {

        log.info("removed Notice by nno :" + nno);

        int remove = noticeService.remove(nno);

        return "redirect:/";
    }
}

package controller;

import domain.Criteria;
import domain.NoticeVO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
@RequiredArgsConstructor
public class NoticeController {

    private final NoticeService noticeService;

    // 공지 조회
    @GetMapping("/read")
    public String readNotice(Long nno, @ModelAttribute("cri") Criteria cri, Model model) {

        NoticeVO noticeVO = noticeService.read(nno);

        model.addAttribute("notice", noticeVO);

        return "board/notice/read";
    }


    // 공지 작성 폼 이동
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/registerFrom")
    public String registerForm() {

        log.info("Move to Notice RegisterFrom");

        return "board/notice/registerFrom";
    }

    // 공지 작성
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/register")
    public String register(@ModelAttribute("notice") NoticeVO noticeVO) {

        log.info("Register Notice : " + noticeVO.getNno());

        noticeService.register(noticeVO);

        return "redirect:/board/list";
    }

    // 공지 수정 폼 이동
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/modifyForm")
    public String modifyForm(@ModelAttribute("cri") Criteria cri, Long nno, Model model) {

        log.info("Move to Notice ModifyForm");

        NoticeVO vo = noticeService.read(nno);

        model.addAttribute("notice", vo);

        return "board/notice/modifyForm";
    }

    // 공지 수정
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("modify")
    public String modify(@ModelAttribute("cri") Criteria cri, NoticeVO vo) {

        log.info("Modified Notice for : " + vo.getNno());

        noticeService.modify(vo);

        return "redirect:/notice/read?nno= "+ vo.getNno() + "&pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount() +
                "&type=" + cri.getType() + "&keyword=" + cri.getKeyword();
    }

    // 공지 삭제
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/remove")
    public String removeNotice(Long nno, @ModelAttribute("cri") Criteria cri) {

        log.info("removed Notice by nno :" + nno);

        int remove = noticeService.remove(nno);

        return "redirect:/board/list";
    }
}

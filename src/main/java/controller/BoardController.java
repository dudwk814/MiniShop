package controller;

import domain.BoardVO;
import domain.Criteria;
import domain.PageDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.BoardService;

import java.util.List;

@Controller
@RequestMapping("/board/")
@Log4j
public class BoardController {

    @Setter(onMethod_ = {@Autowired})
    private BoardService boardService;

    @Setter(onMethod_ = {@Autowired})
    private ReplyMapper replyMapper;

    @GetMapping("/list")
    public void list(@ModelAttribute("cri") Criteria cri, Model model) {

        log.info("Board List Page");

        List<BoardVO> list = boardService.getList(cri);
        int totalCount = boardService.getTotalCount();

        model.addAttribute("board", list);
        model.addAttribute("pageMaker", new PageDTO(cri, totalCount));

    }

    @GetMapping("/read")
    public String read(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

        log.info("Get Board......" + bno);

        BoardVO read = boardService.read(bno);

        model.addAttribute("board", read);

        return "board/read";
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
    @GetMapping("/registerForm")
    public String registerForm() {

        log.info("registerForm.....");

        return "board/registerForm";
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
    @PostMapping("/register")
    public String register(@ModelAttribute("board") BoardVO board, RedirectAttributes rttr) {

        log.info("Register Board......" + board);

        boardService.register(board);

        rttr.addFlashAttribute("writer", board.getWriter());
        rttr.addFlashAttribute("result", board.getBno());

        return "redirect:/board/list";
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
    @GetMapping("/modifyForm")
    public String modifyForm(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

        log.info("Go To ModifyForm");

        BoardVO vo = boardService.read(bno);

        model.addAttribute("board", vo);

        return "board/modifyForm";
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
    @PostMapping("/modify")
    public String modify(@ModelAttribute("board") BoardVO board, Criteria cri, RedirectAttributes rttr) {

        log.info("Modify Board....." + board.getBno());

        boardService.modify(board);

        rttr.addFlashAttribute("result", "success");
        rttr.addFlashAttribute("cri", cri);

        return "redirect:/board/list";
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {

        log.info("Remove Board......." + bno);

        boardService.remove(bno);

        rttr.addFlashAttribute("result", "success");

        rttr.addFlashAttribute("cri", cri);

        return "redirect:/board/list";
    }
}

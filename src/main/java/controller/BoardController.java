package controller;

import domain.BoardVO;
import domain.Criteria;
import domain.PageDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
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

    @GetMapping("/list")
    public void list(@ModelAttribute("cri") Criteria cri, Model model) {

        log.info("Board List Page");

        List<BoardVO> list = boardService.getList(cri);

        model.addAttribute("board", list);
        model.addAttribute("pageMaker", new PageDTO(cri, 123));

    }

    @GetMapping("/read")
    public String read(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

        log.info("Get Board......" + bno);

        BoardVO read = boardService.read(bno);

        model.addAttribute("board", read);

        return "board/read";
    }

    @GetMapping("/registerForm")
    public String registerForm() {

        log.info("registerForm.....");

        return "board/registerForm";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("board") BoardVO board, RedirectAttributes rttr) {

        log.info("Register Board......" + board);

        boardService.register(board);

        rttr.addFlashAttribute("writer", board.getWriter());
        rttr.addFlashAttribute("result", board.getBno());

        return "redirect:/board/list";
    }

    @GetMapping("/modifyForm")
    public String modifyForm(@RequestParam("bno") Long bno, Model model) {

        log.info("Go To ModifyForm");

        BoardVO vo = boardService.read(bno);

        model.addAttribute("board", vo);

        return "board/modifyForm";
    }

    @PostMapping("/modify")
    public String modify(@ModelAttribute("board") BoardVO board, RedirectAttributes rttr) {

        log.info("Modify Board....." + board.getBno());

        boardService.modify(board);

        rttr.addFlashAttribute("result", "success");

        return "redirect:/board/list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {

        log.info("Remove Board......." + bno);

        boardService.remove(bno);

        rttr.addFlashAttribute("result", "success");

        return "redirect:/board/list";
    }
}

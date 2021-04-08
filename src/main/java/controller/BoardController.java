package controller;

import domain.*;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.NoticeMapper;
import mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import security.domain.CustomUser;
import service.BoardService;
import service.NoticeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/board/")
@RequiredArgsConstructor
@Log4j
public class BoardController {

    private final BoardService boardService;

    private final ReplyMapper replyMapper;

    private final NoticeService noticeService;

    @GetMapping("/list")
    public void list(@ModelAttribute("cri") Criteria cri,  Model model) {

        log.info("Board List Page");

        List<BoardVO> list = boardService.getList(cri);
        List<NoticeVO> noticeList = noticeService.list();
        int totalCount = boardService.getTotalCount(cri);

        model.addAttribute("board", list);
        model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
        model.addAttribute("noticeList", noticeList);
    }

    @Transactional
    @GetMapping("/read")
    public String read(@RequestParam(value = "bno", required = false) Long bno,
                       @RequestParam(value = "nno", required = false) Long nno,
                       @ModelAttribute("cri") Criteria cri, Model model) {


        log.info("Get Board......" + bno);

        BoardVO read = boardService.read(bno);

        boardService.upHit(bno);

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

        return "redirect:/board/read?bno=" + board.getBno();
    }

    // ck 에디터에서 파일 업로드
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    @PostMapping("/uploadImg")
    public void postCKEditorImgUpload(HttpServletRequest req,
                                      HttpServletResponse res,
                                      @RequestParam MultipartFile upload) throws Exception {
        log.info("Image Upload");

        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        // 인코딩
        res.setCharacterEncoding("utf-8");
        res.setContentType("text/html;charset=utf-8");

        try {

            String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
            byte[] bytes = upload.getBytes();

            // 업로드 경로
            String defaultPath = req.getSession().getServletContext().getRealPath("/");

            String ckUploadPath = defaultPath + "resources" + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush();  // out에 저장된 데이터를 전송하고 초기화

            String callback = req.getParameter("CKEditorFuncNum");
            printWriter = res.getWriter();
            String fileUrl = "/resources/ckUpload/" + uid + "_" + fileName;  // 작성화면


            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");

            printWriter.flush();

        } catch (IOException e) { e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }

        return;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
    @PostMapping("/modifyForm")
    public String modifyForm(@RequestParam("bno") Long bno,
                             @ModelAttribute("cri") Criteria cri,
                             Model model) {

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

        return "redirect:/board/list?pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount() + "&type=" + cri.getType() + "&keyword=" + cri.getKeyword();
    }
}

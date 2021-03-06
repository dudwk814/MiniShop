package controller;

import domain.Criteria;
import domain.ReplyPageDTO;
import domain.ReplyVO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import service.ReplyService;

import java.util.List;

@RestController
@RequestMapping("/replies/")
@Log4j
@RequiredArgsConstructor
public class ReplyController {

    private final ReplyService service;

    /**
     * 댓글 등록
     * @param vo
     * @return
     */
    @PreAuthorize("isAuthenticated()")
    @PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody ReplyVO vo) {

        log.info("Reply VO : " + vo);

        int insertCount = service.insert(vo);

        log.info("Reply INSERT COUNT : " + insertCount);

        return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /**
     * 댓글 목록 조회
     * @param bno
     * @param page
     * @return
     */
    @GetMapping(value = "/pages/{bno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ReplyPageDTO> getList(@PathVariable("bno") Long bno, @PathVariable("page") int page) {

        log.info("getReplyList");

        Criteria cri = new Criteria(page, 10);

        return new ResponseEntity<>(service.getList(bno, cri), HttpStatus.OK);
    }

    /**
     * 댓글 조회
     * @param rno
     * @return
     */
    @GetMapping(value = "/{rno}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {

        log.info("get : " + rno);

        return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
    }

    /**
     * 댓글 수 조회
     * @param bno
     * @return
     */
    // bno당 댓글 개수
    @GetMapping(value = "/replyCnt/{bno}")
    public ResponseEntity<Integer> getReplyCnt(@PathVariable("bno") Long bno) {

        log.info("bno : " + bno);

        return new ResponseEntity<>(service.getReplyCnt(bno), HttpStatus.OK);
    }


    /**
     * 댓글 삭제
     * @param rno
     * @param vo
     * @return
     */
    @DeleteMapping(value = "/{rno}")
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno, @RequestBody ReplyVO vo) {

        log.info("rno : " + rno);

        ReplyVO vo2 = service.get(rno);

        log.info("bno : " + vo.getBno());

        return service.remove(rno, vo2.getBno()) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /**
     * 댓글 수정
     * @param vo
     * @param rno
     * @return
     */
    @RequestMapping(method = {RequestMethod.PATCH, RequestMethod.PUT}, value = "/{rno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno) {

        vo.setRno(rno);

        log.info("rno : " + rno);

        log.info("modify : " + vo);

        return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}

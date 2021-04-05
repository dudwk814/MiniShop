package controller;

import domain.Criteria;
import domain.ReviewPageDTO;
import domain.ReviewVO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.ProductService;
import service.ReviewService;

import java.util.List;

@RestController
@RequestMapping("/review/")
@Log4j
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;

    private final ProductService productService;

    /**
     * 리뷰 등록
     * @param vo
     * @return
     */
    @PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody ReviewVO vo) {

        log.info("ReviewVO : " + vo);

        int insertCount = reviewService.register(vo);


        log.info("Review INSERT COUNT : " + insertCount);

        return insertCount == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /**
     * 해당 상품 리뷰 목록 조회
     * @param product_id
     * @param page
     * @param model
     * @return
     */
    @GetMapping(value = "/pages/{product_id}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ReviewPageDTO> getList(@PathVariable("product_id") int product_id, @PathVariable("page") int page, Model model) {

        log.info("getList : " + product_id);

        Criteria cri = new Criteria(page, 5);


        log.info(cri);

        return new ResponseEntity<ReviewPageDTO>(reviewService.getList(cri, product_id), HttpStatus.OK);
    }

    /**
     * 해당 상품 리뷰 조회
     * @param review_no
     * @return
     */
    @GetMapping(value = "/{review_no}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<ReviewVO> get(@PathVariable("review_no") int review_no) {

        log.info("get Review : " + review_no);

        return new ResponseEntity<>(reviewService.get(review_no), HttpStatus.OK);
    }

    /**
     * 리뷰 삭제
     * @param review_no
     * @return
     */
    @DeleteMapping(value = "/{review_no}", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable("review_no") int review_no) {

        log.info("remove : " + review_no);

        return reviewService.remove(review_no) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /**
     * 리뷰 수정
     * @param vo
     * @param review_no
     * @return
     */
    @RequestMapping(method = {RequestMethod.PATCH, RequestMethod.PUT}, value = "/{review_no}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(@RequestBody ReviewVO vo, @PathVariable("review_no") int review_no) {

        vo.setReview_no(review_no);

        log.info("review_no : " + review_no);

        log.info("modify : " + vo);

        return reviewService.modify(vo) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}

package service;

import domain.Criteria;
import domain.ReviewAttachVO;
import domain.ReviewPageDTO;
import domain.ReviewVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.ReviewAttachMapper;
import mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Log4j
public class ReviewServiceImpl implements ReviewService{

    @Setter(onMethod_ = @Autowired)
    private ReviewMapper reviewMapper;

    @Setter(onMethod_ = @Autowired)
    private ReviewAttachMapper reviewAttachMapper;

    /**
     * 리뷰 등록
     * @param vo
     * @return
     */
    @Override
    @Transactional
    public int register(ReviewVO vo) {

        log.info("Register Review : " + vo);

        int reviewNum = reviewMapper.insert(vo);

        log.info("reviewNum : " + reviewNum);

        if (vo.getAttachList() != null && vo.getAttachList().size() > 0) {
            for (int i = 0; i < vo.getAttachList().size(); i++) {
                ReviewAttachVO reviewAttachVO = vo.getAttachList().get(i);
                reviewAttachVO.setReview_no(vo.getReview_no());
                reviewAttachMapper.insert(reviewAttachVO);
                log.info("reviewAttachVO : " + reviewAttachVO);
            }
        }

        return reviewNum;
    }

    /**
     * 단일 리뷰 조회
     * @param review_no
     * @return
     */
    @Transactional
    @Override
    public ReviewVO get(int review_no) {

        log.info("get Review : " + review_no);

        List<ReviewAttachVO> reviewAttachVOS = reviewAttachMapper.findByReviewNo(review_no);

        ReviewVO reviewVO = reviewMapper.read(review_no);

        if (reviewAttachVOS.size() > 0) {
            reviewVO.setAttachList(reviewAttachVOS);
        }
        return reviewVO;
    }

    /**
     * 리뷰 목록 조회 (페이징)
     * @param cri
     * @param product_id
     * @return
     */
    @Override
    public ReviewPageDTO getList(Criteria cri, int product_id) {

        log.info("get ReviewList : " + product_id);
        return new ReviewPageDTO(reviewMapper.countReview(product_id), reviewMapper.getListWithPaging(cri, product_id));
    }

    /**
     * 리뷰 수정
     * @param vo
     * @return
     */
    @Override
    public int modify(ReviewVO vo) {

        log.info("Modified Review : " + vo);

        return reviewMapper.modify(vo);
    }

    /**
     * 리뷰 삭제
     * @param review_no
     * @return
     */
    @Override
    @Transactional
    public int remove(int review_no) {

        log.info("Remove Review : " + review_no);

        List<ReviewAttachVO> reviewAttachVOS = reviewAttachMapper.findByReviewNo(review_no);

        if (reviewAttachVOS.size() > 0 && reviewAttachVOS != null) {
            reviewAttachMapper.delete(review_no);
        }

        
        return reviewMapper.delete(review_no);
    }

    @Override
    public int countReview(int product_id) {
        return reviewMapper.countReview(product_id);
    }
}

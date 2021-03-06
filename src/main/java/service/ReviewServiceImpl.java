package service;

import domain.Criteria;
import domain.ReviewAttachVO;
import domain.ReviewPageDTO;
import domain.ReviewVO;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService{

    private final ReviewMapper reviewMapper;

    private final ReviewAttachMapper reviewAttachMapper;

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

    @Transactional
    @Override
    public ReviewVO get(int review_no) {

        log.info("get Review : " + review_no);

        List<ReviewAttachVO> reviewAttachVOS = reviewAttachMapper.findByReviewNo(review_no);

        for (ReviewAttachVO reviewAttachVO : reviewAttachVOS) {
            System.out.println("reviewAttachVO = " + reviewAttachVO.getFileName());
        }

        ReviewVO reviewVO = reviewMapper.read(review_no);

        if (reviewAttachVOS.size() > 0) {
            reviewVO.setAttachList(reviewAttachVOS);
        }
        return reviewVO;
    }

    @Override
    public ReviewPageDTO getList(Criteria cri, int product_id) {

        log.info("get ReviewList : " + product_id);

        ReviewPageDTO reviewPageDTO = new ReviewPageDTO(reviewMapper.countReview(product_id), reviewMapper.getListWithPaging(cri, product_id));

        return reviewPageDTO;
    }

    @Transactional
    @Override
    public int modify(ReviewVO vo) {

        log.info("Modified Review : " + vo);

        if (vo.getAttachList().size() > 0) {
            reviewAttachMapper.delete(vo.getReview_no());
            for (ReviewAttachVO reviewAttachVO : vo.getAttachList()) {
                reviewAttachVO.setReview_no(vo.getReview_no());
                reviewAttachMapper.insert(reviewAttachVO);
            }
        }

        return reviewMapper.modify(vo);
    }

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

    /**
     * 특정 상품 리뷰 갯수 조회
     * @param product_id
     * @return
     */
    @Override
    public int countReview(int product_id) {
        return reviewMapper.countReview(product_id);
    }
}

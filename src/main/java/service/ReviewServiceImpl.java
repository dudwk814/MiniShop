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

    @Override
    @Transactional
    public int register(ReviewVO vo) {

        log.info("Register Review : " + vo);

        int reviewNum = reviewMapper.insert(vo);

        log.info("reviewNum : " + reviewNum);

        if (vo.getAttachList() != null && vo.getAttachList().size() > 0) {
            for (int i = 0; i < vo.getAttachList().size(); i++) {
                ReviewAttachVO reviewAttachVO = vo.getAttachList().get(i);
                reviewAttachVO.setReview_no(reviewNum);
                reviewAttachMapper.insert(reviewAttachVO);
                log.info("reviewAttachVO : " + reviewAttachVO);
            }
        }

        return reviewNum;
    }

    @Override
    public ReviewVO get(int review_no) {

        log.info("get Review : " + review_no);
        return reviewMapper.read(review_no);
    }

    @Override
    public ReviewPageDTO getList(Criteria cri, int product_id) {

        log.info("get ReviewList : " + product_id);
        return new ReviewPageDTO(reviewMapper.countReview(product_id), reviewMapper.getListWithPaging(cri, product_id));
    }

    @Override
    public int modify(ReviewVO vo) {

        log.info("Modified Review : " + vo);

        return reviewMapper.modify(vo);
    }

    @Override
    public int remove(int review_no) {

        log.info("Remove Review : " + review_no);
        
        return reviewMapper.delete(review_no);
    }

    @Override
    public int countReview(int product_id) {
        return reviewMapper.countReview(product_id);
    }
}

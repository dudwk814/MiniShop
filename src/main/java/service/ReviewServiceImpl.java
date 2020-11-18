package service;

import domain.Criteria;
import domain.ReviewPageDTO;
import domain.ReviewVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class ReviewServiceImpl implements ReviewService{

    @Setter(onMethod_ = @Autowired)
    private ReviewMapper reviewMapper;

    @Override
    public int register(ReviewVO vo) {

        log.info("Register Review : " + vo);

        return reviewMapper.insert(vo);
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

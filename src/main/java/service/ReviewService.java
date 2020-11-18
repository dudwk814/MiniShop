package service;

import domain.Criteria;
import domain.ReviewPageDTO;
import domain.ReviewVO;

import java.util.List;

public interface ReviewService {

    public int register(ReviewVO vo);

    public ReviewVO get(int review_no);

    public ReviewPageDTO getList(Criteria cri, int product_id);

    public int modify(ReviewVO vo);

    public int remove(int review_no);

    public int countReview(int product_id);
}

package mapper;

import domain.ReviewAttachVO;

import java.util.List;

public interface ReviewAttachMapper {

    public void insert(ReviewAttachVO vo);

    public void delete(int review_no);

    public List<ReviewAttachVO> findByReviewNo(int review_no);
}

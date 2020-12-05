package mapper;

import domain.ReviewAttachVO;

import java.util.List;

public interface ReviewAttachMapper {

    public void insert(ReviewAttachVO vo);

    public void delete(String uuid);

    public List<ReviewAttachVO> findByReviewNo(int review_no);
}

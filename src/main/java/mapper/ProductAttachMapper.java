package mapper;

import domain.ReviewAttachVO;

import java.util.List;

public interface ProductAttachMapper {

    public void insert(ReviewAttachVO vo);

    public void delete(String uuid);

    public List<ReviewAttachVO> findByProductId(int product_id);
}

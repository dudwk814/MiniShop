package mapper;

import domain.Criteria;
import domain.ReviewVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReviewMapper {

    public int insert(ReviewVO vo);

    public ReviewVO read(int review_no);

    public List<ReviewVO> getList(int product_id);

    public List<ReviewVO> getListWithPaging(@Param("cri")Criteria cri, @Param("product_id") int product_id);

    public int modify(ReviewVO vo);

    public int delete(int review_no);
}

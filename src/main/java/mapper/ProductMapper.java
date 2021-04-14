package mapper;

import domain.Criteria;
import domain.ProductVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {

    // 홈화면 신 상품 목록
    public List<ProductVO> getHomeProductList();

    // 상품 등록
    public void insertProduct(ProductVO vo);

    // 상품 수정
    public int updateProduct(ProductVO vo);

    // 상품 전체 개수
    public int getTotalCount();

    // 상품 삭제
    public int deleteProduct(int product_id);

    // 전체 상품 목록 조회
    public List<ProductVO> getProductList(Criteria cri);

    // 단일 상품
    public ProductVO getProduct(int product_id);

    // 상품 주문 혹은 주문 취소시 재고 수량 조정
    public void updateStock(@Param("amount") int amount, @Param("product_id") int product_id);
}

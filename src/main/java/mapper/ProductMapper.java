package mapper;

import domain.ProductVO;

import java.util.List;

public interface ProductMapper {

    // 홈화면 신 상품 목록
    public List<ProductVO> getHomeProductList();

    // 전체 상품 목록 조회
    public List<ProductVO> getProductList();

    // 단일 상품
    public ProductVO getProduct(int product_id);
}

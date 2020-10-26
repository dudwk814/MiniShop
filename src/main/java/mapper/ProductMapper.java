package mapper;

import domain.ProductVO;

import java.util.List;

public interface ProductMapper {

    // 전체 상품 목록 조회
    public List<ProductVO> getProductList();

    // 단일 상품
    public ProductVO getProduct();
}

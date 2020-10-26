package service;

import domain.ProductVO;

import java.util.List;

public interface ProductService {

    // 홈 화면 신상품 조회
    public List<ProductVO> getHomeProductList();

    // 전체 상품 조회
    public List<ProductVO> getProductList();

    // 단일 상품 조회
    public ProductVO getProduct(int product_id);
}

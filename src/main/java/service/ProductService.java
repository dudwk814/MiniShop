package service;

import domain.Criteria;
import domain.ProductVO;

import java.util.List;

public interface ProductService {

    // 홈 화면 신상품 조회
    public List<ProductVO> getHomeProductList();

    // 전체 상품 조회
    public List<ProductVO> getProductList(Criteria cri);

    // 단일 상품 조회
    public ProductVO getProduct(int product_id);

    // 상품 등록
    public void insertProduct(ProductVO vo);

    // 상품 수정
    public boolean updateProduct(ProductVO vo);

    // 상품 삭제
    public boolean deleteProduct(int product_id);

    // 상품 전체 개수 조회
    public int getTotalCount();
}

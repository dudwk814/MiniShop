package service;

import domain.ProductVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class ProductServiceImpl implements ProductService{

    @Setter(onMethod_ = @Autowired)
    private ProductMapper productMapper;

    // 홈 화면 상품 조회
    @Override
    public List<ProductVO> getHomeProductList() {

        log.info("Get New Product");

        return productMapper.getHomeProductList();
    }

    // 전체 상품 조회
    @Override
    public List<ProductVO> getProductList() {

        log.info("Get All ProductList");

        return productMapper.getProductList();
    }

    // 단일 상품 조회
    @Override
    public ProductVO getProduct(int product_id) {

        log.info("get Product for : " + product_id);
        return productMapper.getProduct(product_id);
    }

    // 상품 등록
    @Override
    public void insertProduct(ProductVO vo) {
        productMapper.insertProduct(vo);
    }

    // 상품 수정
    @Override
    public void updateProduct(ProductVO vo) {
        productMapper.updateProduct(vo);
    }

    // 상품 삭제
    @Override
    public void deleteProduct(int product_id) {
        productMapper.deleteProduct(product_id);
    }
}

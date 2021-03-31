package service;

import domain.Criteria;
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
    public List<ProductVO> getProductList(Criteria cri) {

        log.info("Get All ProductList");

        return productMapper.getProductList(cri);
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
    public boolean updateProduct(ProductVO vo) {
        return productMapper.updateProduct(vo) == 1;
    }

    // 상품 삭제
    @Override
    public boolean deleteProduct(int product_id) {
        return productMapper.deleteProduct(product_id) == 1;
    }

    @Override
    public int getTotalCount() {
        return productMapper.getTotalCount();
    }
}

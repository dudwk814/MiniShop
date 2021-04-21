package service;

import domain.Criteria;
import domain.ProductVO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService{

    private final ProductMapper productMapper;

    /**
     * 홈 화면 상품 목록
     * @return
     */
    @Override
    public List<ProductVO> getHomeProductList() {

        log.info("Get New Product");

        return productMapper.getHomeProductList();
    }

    /**
     * 전체 상품 조회
     * @param cri
     * @return
     */
    @Override
    public List<ProductVO> getProductList(Criteria cri) {

        log.info("Get All ProductList");

        return productMapper.getProductList(cri);
    }

    /**
     * 단일 상품 조회
     * @param product_id
     * @return
     */
    @Override
    public ProductVO getProduct(int product_id) {

        log.info("get Product for : " + product_id);
        return productMapper.getProduct(product_id);
    }

    /**
     * 상품 등록
     * @param vo
     */
    @Override
    public void insertProduct(ProductVO vo) {
        productMapper.insertProduct(vo);
    }

    /**
     * 상품 수정
     * @param vo
     * @return
     */
    @Override
    public boolean updateProduct(ProductVO vo) {
        return productMapper.updateProduct(vo) == 1;
    }

    /**
     * 상품 삭제
     * @param product_id
     * @return
     */
    @Override
    public boolean deleteProduct(int product_id) {
        return productMapper.deleteProduct(product_id) == 1;
    }

    /**
     * 전체 상품 갯수 조회
     * @return
     */
    @Override
    public int getTotalCount() {
        return productMapper.getTotalCount();
    }
}

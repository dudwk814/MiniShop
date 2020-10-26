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

    @Override
    public List<ProductVO> getHomeProductList() {

        log.info("Get New Product");

        return productMapper.getHomeProductList();
    }

    @Override
    public List<ProductVO> getProductList() {

        log.info("Get All ProductList");

        return productMapper.getProductList();
    }

    @Override
    public ProductVO getProduct(int product_id) {

        log.info("get Product for : " + product_id);
        return productMapper.getProduct(product_id);
    }
}

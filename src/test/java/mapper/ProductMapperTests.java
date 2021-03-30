package mapper;

import domain.Criteria;
import domain.ProductVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:web/WEB-INF/applicationContext.xml", "file:web/WEB-INF/security-context.xml"})
@Log4j
public class ProductMapperTests {

    @Setter(onMethod_ = @Autowired)
    private ProductMapper productMapper;

    // 홈 화면 상품 조회
    @Test
    public void testGetHomeList() {

        List<ProductVO> homeProductList = productMapper.getHomeProductList();
        homeProductList.forEach(productVO -> log.info(productVO));
    }

    // 전체 상품 조회
    @Test
    public void testGetList() {

        Criteria cri = new Criteria();

        /*cri.setPrice_from(0);

        cri.setBrand("자체 생산");*/

        /*cri.setPrice_to(100000);*/

        List<ProductVO> productList = productMapper.getProductList(cri);

        productList.forEach(productVO -> log.info(productVO));
    }

    // 단일 상품 조회
    @Test
    public void testGet() {

        log.info(productMapper.getProduct(2));
    }
}

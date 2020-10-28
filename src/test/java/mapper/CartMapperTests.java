package mapper;

import domain.CartVO;
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
public class CartMapperTests {

    @Setter(onMethod_ = @Autowired)
    private CartMapper cartMapper;

    // 장바구니 추가
    @Test
    public void testInsertCart() {

        CartVO vo = new CartVO();
        vo.setUserid("admin");
        vo.setAmount(1);
        vo.setProduct_id(2);

        cartMapper.insertCart(vo);
    }

    // 장바구니 목록 테스트
    @Test
    public void testGetCartList() {

        List<CartVO> admin = cartMapper.cartList("admin");

        admin.forEach(vo -> log.info(vo));
    }

    // 장바구니 전체 금액 테스트
    @Test
    public void testSumMoney() {

        log.info(cartMapper.sumMoney("admin"));
    }

    // 장바구니 수정 테스트
    @Test
    public void testModifyCart() {

        CartVO vo = new CartVO();
        vo.setAmount(2);
        vo.setProduct_id(1);
        vo.setUserid("admin");

        cartMapper.modifyCart(vo);
    }

    // 장바구니 삭제 테스트
    @Test
    public void testDeleteCart() {

        cartMapper.deleteCart(2);
    }
}

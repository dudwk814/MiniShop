package mapper;

import domain.Criteria;
import domain.OrderVO;
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
public class OrderMapperTests {

    @Setter(onMethod_ = @Autowired)
    private OrderMapper orderMapper;

    @Test
    public void testGetList() {

        Criteria cri = new Criteria();
        cri.setAmount(10);
        cri.setPageNum(1);

        List<OrderVO> list = orderMapper.getList("qwer", cri);

        list.forEach(order -> log.info(order));
    }

    @Test
    public void testGetTotalOrderCount() {

        log.info(orderMapper.getTotalOrderCount("qwer"));
    }

    @Test
    public void testGetAllOrderList() {

        List<OrderVO> allList = orderMapper.getAllList();

        allList.forEach(order -> {log.info(order);});
    }
}

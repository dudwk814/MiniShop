package service;

import domain.OrderVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class OrderServiceImpl implements OrderService{

    @Setter(onMethod_ = @Autowired)
    private OrderMapper orderMapper;

    @Override
    public void insert(OrderVO vo) {

        log.info("insert Order " + vo.getUserid());

        orderMapper.insert(vo);
    }

    @Override
    public OrderVO get(int order_id) {

        log.info("get Order : " + order_id);

        return orderMapper.get(order_id);
    }

    @Override
    public List<OrderVO> getList(String userid) {

        return orderMapper.getList(userid);
    }

    @Override
    public List<OrderVO> getAllList() {

        return orderMapper.getAllList();
    }

    @Override
    public void delete(int order_id) {

        log.info("delete order : " + order_id);

        orderMapper.delete(order_id);
    }
}

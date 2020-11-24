package service;

import domain.Criteria;
import domain.OrderDetailsVO;
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
    public List<OrderDetailsVO> getOrderDetails(String order_id) {
        return orderMapper.getOrderDetails(order_id);
    }

    @Override
    public int getTotalOrderCount(String userid) {
        return orderMapper.getTotalOrderCount(userid);
    }

    @Override
    public void insertDetail(OrderDetailsVO vo) {
        orderMapper.insertDetail(vo);
    }

    @Override
    public OrderVO get(String order_id) {

        log.info("get Order : " + order_id);

        return orderMapper.get(order_id);
    }

    @Override
    public List<OrderVO> getList(String userid, Criteria cri) {

        return orderMapper.getList(userid, cri);
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
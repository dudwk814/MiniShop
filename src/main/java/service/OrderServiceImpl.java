package service;

import domain.Criteria;
import domain.OrderDetailsVO;
import domain.OrderVO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.OrderMapper;
import mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Log4j
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService{

    private final OrderMapper orderMapper;
    private final ProductMapper productMapper;

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

    @Transactional
    @Override
    public void insertDetail(OrderDetailsVO vo) {
        orderMapper.insertDetail(vo);

        List<OrderDetailsVO> orderDetails = orderMapper.getOrderDetails(vo.getOrder_id());

        for (OrderDetailsVO orderDetail : orderDetails) {
            System.out.println("amount : " + orderDetail.getAmount());
            productMapper.updateStock(-orderDetail.getAmount(), orderDetail.getProduct_id());
        }


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

    @Transactional
    @Override
    public boolean delete(String order_id) {

        log.info("delete order : " + order_id);

        List<OrderDetailsVO> orderDetails = orderMapper.getOrderDetails(order_id);
        for (OrderDetailsVO orderDetail : orderDetails) {
            productMapper.updateStock(orderDetail.getAmount(), orderDetail.getProduct_id());
        }

        orderMapper.detailDelete(order_id);

        return orderMapper.delete(order_id) == 1;
    }
}

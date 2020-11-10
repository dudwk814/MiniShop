package service;

import domain.OrderDetailsVO;
import domain.OrderVO;

import java.util.List;

public interface OrderService {

    public void insert(OrderVO vo);

    public void insertDetail(OrderDetailsVO vo);

    public OrderVO get(String order_id);

    public List<OrderDetailsVO> getOrderDetails(String order_id);

    public List<OrderVO> getList(String userid);

    public List<OrderVO> getAllList();

    public void delete(int order_id);
}

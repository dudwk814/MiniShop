package service;

import domain.OrderVO;

import java.util.List;

public interface OrderService {

    public void insert(OrderVO vo);

    public OrderVO get(int order_id);

    public List<OrderVO> getList(String userid);

    public List<OrderVO> getAllList();

    public void delete(int order_id);
}

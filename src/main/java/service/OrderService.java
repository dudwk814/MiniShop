package service;

import domain.Criteria;
import domain.OrderDetailsVO;
import domain.OrderVO;

import java.util.List;

public interface OrderService {

    public void insert(OrderVO vo);

    public void insertDetail(OrderDetailsVO vo);

    public OrderVO get(String order_id);

    public List<OrderDetailsVO> getOrderDetails(String order_id);

    public List<OrderVO> getList(String userid, Criteria cri);

    // 회원에 대한 전체 오더 개수
    public int getTotalOrderCount(String userid);

    public List<OrderVO> getAllList();

    public void delete(int order_id);
}

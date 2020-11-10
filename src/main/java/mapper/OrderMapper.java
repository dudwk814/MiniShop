package mapper;

import domain.OrderDetailsVO;
import domain.OrderVO;

import java.util.List;

public interface OrderMapper {

    // 오더 추가
    public void insert(OrderVO vo);

    // 오더 디테일 추가
    public void insertDetail(OrderDetailsVO vo);

    // 오더 조회
    public OrderVO get(String order_id);

    // orderDetails 조회
    public List<OrderDetailsVO> getOrderDetails(String order_id);

    // 회원에 대한 전체 오더 조회
    public List<OrderVO> getList(String userid);

    // 전체 오더 조회
    public List<OrderVO> getAllList();

    // 오더 삭제
    public void delete(int order_id);

}

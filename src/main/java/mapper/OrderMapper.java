package mapper;

import domain.OrderVO;

import java.util.List;

public interface OrderMapper {

    public void insert(OrderVO vo);

    // 오더 조회
    public OrderVO get(int order_id);

    // 회원에 대한 전체 오더 조회
    public List<OrderVO> getList(String userid);

    // 전체 오더 조회
    public List<OrderVO> getAllList();

    // 오더 삭제
    public void delete(int order_id);

}

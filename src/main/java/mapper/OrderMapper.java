package mapper;

import domain.Criteria;
import domain.OrderDetailsVO;
import domain.OrderVO;
import org.apache.ibatis.annotations.Param;

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
    public List<OrderVO> getList(@Param("userid") String userid,  @Param("cri") Criteria cri);

    // 회원에 대한 전체 오더 개수
    public int getTotalOrderCount(String userid);

    // 전체 오더 조회
    public List<OrderVO> getAllList();

    // 오더 삭제
    public int delete(String order_id);

    // 오더 디테일 삭제
    public void detailDelete(String order_id);

    // userid에 대한 오더 삭제
    public void deleteByUserId(String userid);

    // userid에 대한 오더 디테일 삭제
    public void detailDeleteByUserId(String userid);

}

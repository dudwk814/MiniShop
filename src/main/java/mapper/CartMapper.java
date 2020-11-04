package mapper;

import domain.CartVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {

    // 장바구니 추가
    public void insertCart(CartVO vo);

    // 장바구니 리스트
    public List<CartVO> cartList(String userid);

    // 장바구니 삭제
    public void deleteCart(int cart_id);

    // 장바구니 수정
    public void modifyCart(CartVO vo);

    // 장바구니 금액 합계
    public int sumMoney(String userid);

    // 동일한 상품 합계(동일 상품 존재 시 장바구니 업데이트)
    public int countCart(@Param("product_id") int product_id, @Param("userid") String userid);

    // 장바구니에 있는 상품의 수 (amount x)
    public int countCartForMember(String userid);

    // 동일 상품 확인 후 장바구니 업데이트
    public void updateCart(CartVO vo);
}

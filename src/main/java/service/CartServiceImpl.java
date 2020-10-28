package service;

import domain.CartVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class CartServiceImpl implements CartService{

    @Setter(onMethod_ = @Autowired)
    private CartMapper cartMapper;

    @Override
    public void insertCart(CartVO vo) {

        log.info("Insert Cart : " + vo);

        cartMapper.insertCart(vo);
    }

    @Override
    public List<CartVO> cartList(String userid) {

        log.info("get CartList for " + userid);

        return cartMapper.cartList(userid);
    }

    @Override
    public void deleteCart(int cart_id) {

        log.info("delete Cart : " + cart_id);

        cartMapper.deleteCart(cart_id);

    }

    @Override
    public void modifyCart(CartVO vo) {

        log.info("Modified Cart " + vo);

        cartMapper.modifyCart(vo);

    }

    @Override
    public int sumMoney(String userid) {

        log.info("Sum of price : " + userid);

        return cartMapper.sumMoney(userid);
    }

    @Override
    public int countCart(int product_id, String userid) {

        log.info("Same Product Count : " + userid);

        return cartMapper.countCart(product_id, userid);
    }

    @Override
    public void updateCart(CartVO vo) {

        log.info("updateCart : " + vo);

        cartMapper.updateCart(vo);
    }
}

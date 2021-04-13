package service;

import domain.UserVO;
import domain.authVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import mapper.OrderMapper;
import mapper.UserMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;

    private final OrderMapper orderMapper;

    private final BCryptPasswordEncoder encoder;

    @Transactional
    @Override
    public int register(UserVO userVO) {

        userVO.setUserpw(encoder.encode(userVO.getUserpw()));


        int register = userMapper.register(userVO);


        userMapper.authRegister(userVO.getUserid());

        return register;
    }

    @Override
    public int modify(UserVO userVO) {

        userVO.setUserpw(encoder.encode(userVO.getUserpw()));

        return userMapper.modify(userVO);
    }

    @Transactional
    @Override
    public int remove(String userid) {

        log.info("removed user : " + userid);

        orderMapper.detailDeleteByUserId(userid);
        orderMapper.deleteByUserId(userid);

        userMapper.removeAuth(userid);

        int removeUser = userMapper.removeUser(userid);





        return removeUser;
    }

    @Override
    public UserVO findPassword(UserVO vo) {

        return userMapper.findPassword(vo);
    }

    @Override
    public int modifyPassword(UserVO vo) {

        vo.setUserpw(encoder.encode(vo.getUserpw()));
        return userMapper.modifyPassword(vo);
    }

    @Override
    public UserVO getUser(String userid) {

        UserVO user = userMapper.getUser(userid);

        return user;
    }

    @Override
    public UserVO read(String userid) {

        log.info("get user info " + userid);

        return userMapper.get(userid);
    }

    @Override
    public List<UserVO> getList() {
        return userMapper.getList();
    }

    @Override
    public int findUser(String userid) {
        return userMapper.findUser(userid);
    }

    @Override
    public boolean updateAuth(authVO vo) {
        return userMapper.updateAuth(vo) == 1;
    }
}

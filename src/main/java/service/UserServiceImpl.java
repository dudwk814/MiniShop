package service;

import domain.UserVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class UserServiceImpl implements UserService{

    @Setter(onMethod_ = {@Autowired})
    private UserMapper userMapper;

    @Override
    public boolean register(UserVO vo) {

        log.info("Register : " + vo);

        if (vo.getUser_pw().equals(vo.getUser_pw2())) {
            int result = userMapper.register(vo);
            return true;
        } else {
            return false;
        }

    }

    @Override
    public boolean removeUser(Long mno) {

        log.info("Remove User : " + mno);
        return userMapper.delete(mno) == 1;
    }

    @Override
    public boolean modifyUser(UserVO vo) {

        log.info("Modified User : " + vo);

        return userMapper.update(vo) == 1;
    }

    @Override
    public UserVO getUser(Long mno) {

        log.info("get User Info : " + mno);
        return userMapper.get(mno);
    }

    @Override
    public List<UserVO> getUserList() {

        log.info("get All Users");
        return userMapper.getList();
    }
}

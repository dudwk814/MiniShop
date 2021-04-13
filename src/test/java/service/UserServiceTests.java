package service;

import domain.UserVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:web/WEB-INF/applicationContext.xml", "file:web/WEB-INF/security-context.xml"})
@Log4j
public class UserServiceTests {

    @Setter(onMethod_ = {@Autowired})
    private UserMapper userMapper;

    @Setter(onMethod_ = {@Autowired})
    private PasswordEncoder encoder;

    // 회원 정보 조회
    @Test
    public void testGetMember() {

        log.info(userMapper.get("admin"));

    }

    // 회원 가입
    @Test
    public void testRegister() {

        UserVO vo = new UserVO();
        vo.setUserid("member2");
        vo.setUserpw(encoder.encode("member2"));
        vo.setUserName("member2");

        userMapper.register(vo);

        userMapper.authRegister(vo.getUserid());


    }

    @Test
    public void testModifyMember() {

        UserVO vo = userMapper.getUser("admin");
        vo.setUserpw(encoder.encode("admin"));

        userMapper.modify(vo);

    }

    @Test
    public void testRemovedMember() {


        userMapper.removeAuth("user2");
        userMapper.removeUser("user2");

    }




}

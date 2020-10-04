package service;

import domain.UserVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:web/WEB-INF/applicationContext.xml")
@Log4j
public class UserServiceTests {

    @Setter(onMethod_ = {@Autowired})
    private UserService userService;


    // 단일 회원 조회 테스트
    @Test
    public void testGet() {

        UserVO vo = userService.getUser(2L);

        log.info(vo);
    }

    // 전체 회원 조회 테스트
    @Test
    public void testGetList() {

        List<UserVO> list = userService.getUserList();

        for (UserVO user : list) {
            log.info(user);
        }
    }

    // 회원 가입 테스트
    @Test
    public void testRegister() {

        UserVO vo = new UserVO();
        vo.setUser_id("Ralo");
        vo.setUser_name("김찬호");
        vo.setUser_pw("1234");
        vo.setUser_pw2("1234");
        vo.setAddress("트위치");


        userService.register(vo);
    }


    // 회원 정보 수정 테스트
    @Test
    public void testModify() {

        // 13L
        UserVO vo = userService.getUser(14L);

        vo.setUser_pw("8103");
        vo.setUser_pw2("8103");
        vo.setAddress("카팟");

        boolean count = userService.modifyUser(vo);

        log.info("MODIFIED COUNT : " + count);
    }

    // 회원 삭제 테스트
    @Test
    public void testRemove() {

        // 13L
        boolean count = userService.removeUser(14L);

        log.info("REMOVED COUNT : " + count);
    }

}

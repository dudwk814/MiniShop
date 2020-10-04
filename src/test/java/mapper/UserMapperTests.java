package mapper;

import domain.UserVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:web/WEB-INF/applicationContext.xml")
@Log4j
public class UserMapperTests {

    @Setter(onMethod_ = {@Autowired})
    private UserMapper mapper;

    // 단일 회원 조회 테스트
    @Test
    public void testGet() {
        UserVO vo = mapper.get(2L);

        log.info(vo);
    }

    // 전체 회원 조회 테스트
    @Test
    public void testGetList() {

        List<UserVO> list = mapper.getList();

        for (UserVO user : list) {

            log.info(user);
        }
    }

    // 회원 등록 테스트
    @Test
    public void testRegister() {

        /*UserVO vo = new UserVO();
        vo.setMId("abc");
        vo.setMName("park");
        vo.setMPw("1234");
        vo.setMPw2("1234");
        vo.setAddress("seoul kang-book");

        log.info(vo);
        mapper.register(vo);*/

        int count = 0;

        for (int i = 0; i < 10; i++) {
            UserVO vo = new UserVO();
            vo.setUser_id("aaa" + i);
            vo.setUser_name("son" + i);
            vo.setUser_pw("son" + i);
            vo.setUser_pw2("son" + i);
            vo.setAddress("Jeju" + i);

            mapper.register(vo);
            count++;
        }

        log.info("Registered Count : " + count);
    }

    // 회원 정보 수정 테스트
    @Test
    public void testUpdate() {

        UserVO vo = mapper.get(2L);

        vo.setAddress("busan");

        vo.setUser_pw("5678");
        vo.setUser_pw2("5678");

        log.info(vo);

        int modify = mapper.update(vo);

        log.info("MODIFIED COUNT : " + modify);

        log.info(vo);
    }

    // 회원 삭제 테스트
    @Test
    public void testDelte() {
        log.info(mapper.delete(12L));
    }
}

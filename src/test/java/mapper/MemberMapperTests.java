package mapper;

import domain.MemberVO;
import domain.authVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:web/WEB-INF/applicationContext.xml", "file:web/WEB-INF/security-context.xml"})
@Log4j
public class MemberMapperTests {

    @Setter(onMethod_ = {@Autowired})
    private MemberMapper memberMapper;

    @Test
    public void testRead() {

        MemberVO vo = memberMapper.get("admin");

        log.info(vo);

        vo.getAuthList().forEach(authVO -> log.info(authVO));
    }

    @Test
    public void testFindUser() {

        String userid = "admin";

        log.info(memberMapper.findUser(userid));
    }

    @Test
    public void testGetList() {

        List<MemberVO> list = memberMapper.getList();

        list.forEach(memberVO -> log.info(memberVO));
    }


    // 멤버 권한 변경 테스트 (어드민 전용)
    @Test
    public void testUpdateAuth() {

        authVO vo = new authVO();

        vo.setAuth("ROLE_ADMIN");
        vo.setUserid("qwer");

        memberMapper.updateAuth(vo);
    }

}

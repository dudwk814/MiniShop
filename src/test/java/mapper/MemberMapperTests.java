package mapper;

import domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
}

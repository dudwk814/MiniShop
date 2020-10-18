package service;

import domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.MemberMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:web/WEB-INF/applicationContext.xml", "file:web/WEB-INF/security-context.xml"})
@Log4j
public class MemberServiceTests {

    @Setter(onMethod_ = {@Autowired})
    private MemberMapper memberMapper;

    @Setter(onMethod_ = {@Autowired})
    private PasswordEncoder encoder;

    // 회원 정보 조회
    @Test
    public void testGetMember() {

        log.info(memberMapper.get("admin"));

    }

    // 회원 가입
    @Test
    public void testRegister() {

        MemberVO vo = new MemberVO();
        vo.setUserid("member");
        vo.setUserpw(encoder.encode("member"));
        vo.setUserName("member");
        vo.setAddress("busan");

        memberMapper.register(vo);

        memberMapper.authRegister(vo.getUserid());


    }

}

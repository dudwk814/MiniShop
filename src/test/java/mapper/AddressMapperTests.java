package mapper;

import domain.AddressVO;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class AddressMapperTests {

    private final AddressMapper addressMapper;

    /* 회원 등록 테스트 */
    @Test
    public void testInsert() {

        AddressVO vo = new AddressVO();

        vo.setUserid("member");
        vo.setPost_code("1111");
        vo.setStreet_address("주소1");
        vo.setAddress("주소2");
        vo.setDetail_address("주소3");
        vo.setNote("참고");

        addressMapper.insert(vo);
    }

    /* 회원 주소 조회 */
    @Test
    public void getAddress() {

        String userid = "member";

        log.info(addressMapper.get(userid));
    }

    /* 회원 주소 수정 */
    @Test
    public void modifyAddress() {

        String userid = "member";
        AddressVO vo = addressMapper.get(userid);
        vo.setPost_code("2222");

        addressMapper.modify(vo);
    }

    /* 회원 주소 삭제 */
    @Test
    public void deleteAddress() {

        String userid = "member";

        addressMapper.delete(userid);
    }
}

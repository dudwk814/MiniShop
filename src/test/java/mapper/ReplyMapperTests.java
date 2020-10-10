package mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:web/WEB-INF/applicationContext.xml")
@Log4j
public class ReplyMapperTests {

    @Setter(onMethod_ = {@Autowired})
    private ReplyMapper mapper;

    // mapper 파일 빈 생성 테스트
    @Test
    public void testMapper() {

        log.info(mapper);
    }
}

package mapper;

import domain.NoticeVO;
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
public class NoticeMapperTests {

    @Setter(onMethod_ = @Autowired)
    private NoticeMapper noticeMapper;

    /* 단일 공지 조회 */
    @Test
    public void testGet() {

        Long nno = 1L;

        NoticeVO vo = noticeMapper.get(nno);

        log.info(vo);
    }

    /* 전체 공지 조회*/
    @Test
    public void testGetList() {

        List<NoticeVO> list = noticeMapper.getList();

        list.forEach(vo -> log.info(vo));

    }

    /* 공지 작성 */
    @Test
    public void testInsert() {

        NoticeVO vo = new NoticeVO();

        vo.setTitle("test3");
        vo.setContent("test3");
        vo.setWriter("admin");
        int insert = noticeMapper.insert(vo);

        log.info("count : " + insert);

    }

    /* 공지 수정 */
    @Test
    public void testUpdate() {

        NoticeVO vo = noticeMapper.get(5L);

        vo.setTitle("test3");

        noticeMapper.update(vo);

    }

    /* 공지 삭제 */
    @Test
    public void testDelete() {

        log.info(noticeMapper.delete(5L));
    }

}

package service;

import domain.Criteria;
import domain.ReplyPageDTO;
import domain.ReplyVO;
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
public class ReplyServiceTests {

    @Setter(onMethod_ = {@Autowired})
    private ReplyService replyService;

    // 댓글 작성 테스트
    @Test
    public void testInsert() {

        ReplyVO vo = new ReplyVO();
        vo.setBno(1038L);
        vo.setReply("Service Test");
        vo.setReplyer("Service Tester");

        replyService.insert(vo);
    }

    // 댓글 삭제 테스트
    @Test
    public void testRemove() {

        log.info(replyService.remove(12L, 1038L));
    }

    // 댓글 수정 테스트
    @Test
    public void testModify() {

        ReplyVO vo = replyService.get(13L);

        vo.setReply("Test Service Class");

        log.info(replyService.modify(vo));
    }

    // 단일 댓글 조회 테스트
    @Test
    public void testGet() {

        log.info(replyService.get(13L));
    }

    // 게시글 별 전체 댓글 조회 테스트
    @Test
    public void testGetList() {

        Criteria cri = new Criteria();

        ReplyPageDTO list = replyService.getList(1038L, cri);

        list.getList().forEach(reply -> log.info(reply));

    }
}

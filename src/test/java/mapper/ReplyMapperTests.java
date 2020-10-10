package mapper;

import domain.Criteria;
import domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.stream.IntStream;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:web/WEB-INF/applicationContext.xml")
@Log4j
public class ReplyMapperTests {

    @Setter(onMethod_ = {@Autowired})
    private ReplyMapper mapper;

    // Bno 배열
    private Long[] bnoArr = {1038L, 1037L, 1036L, 1035L, 1034L};

    // mapper 파일 빈 생성 테스트
    @Test
    public void testMapper() {

        log.info(mapper);
    }

    // 댓글 작성 테스트
    @Test
    public void testCreate() {

        IntStream.rangeClosed(1, 10).forEach(i -> {
            ReplyVO vo = new ReplyVO();

            vo.setBno(bnoArr[i % 5]);
            vo.setReply("댓글 테스트" + i);
            vo.setReplyer("replyer" + i);

            mapper.insert(vo);
        });
    }

    // 단일 댓글 조회 테스트
    @Test
    public void testRead() {

        log.info(mapper.read(2L));
    }

    // 전체 댓글 조회 테스트
    @Test
    public void testList() {

        Criteria cri = new Criteria();

        List<ReplyVO> replies = mapper.getListWithPaging(1038L, cri);

        replies.forEach(reply -> log.info(reply));
    }

    // 댓글 삭제 테스트
    @Test
    public void testDelete() {

        log.info(mapper.delete(11L));
    }

    // 댓글 수정 테스트
    @Test
    public void testUpdate() {

        ReplyVO vo = mapper.read(2L);

        vo.setReply("댓글 수정 테스트");

        int count = mapper.update(vo);

        log.info("UPDATE COUNT : " + count);
    }
}

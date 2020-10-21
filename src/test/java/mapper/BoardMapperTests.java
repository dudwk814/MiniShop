package mapper;

import domain.BoardVO;
import domain.Criteria;
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
public class BoardMapperTests {

    @Setter(onMethod_ = {@Autowired})
    private BoardMapper boardMapper;

    // 게시글 추가 테스트
    @Test
    public void testInsert() {
        /*BoardVO vo = new BoardVO();
        vo.setTitle("테스트1");
        vo.setContent("테스트1");
        vo.setWriter("테스터1");

        boardMapper.insert(vo);*/

        for (int i = 2; i <= 10; i++) {
            BoardVO vo = new BoardVO();
            vo.setTitle("테스트" + i);
            vo.setContent("테스트" + i);
            vo.setWriter("테스터" + i);

            boardMapper.insert(vo);
        }
    }

    // 게시글 추가 테스트2
    @Test
    public void testInsert2() {
        BoardVO vo = new BoardVO();
        vo.setTitle("ㅎㅎㅎㅋㅋㅋ");
        vo.setContent("헤헿");
        vo.setWriter("후후후");

        boardMapper.insertSelectKey(vo);
    }

    // 게시글 조회 테스트
    @Test
    public void testGet() {

        BoardVO vo = boardMapper.get(2L);

        log.info(vo);
    }

    // 전체 게시글 조회 테스트
    @Test
    public void testGetList() {

        List<BoardVO> list = boardMapper.getList(1);

        for (BoardVO board : list) {
            log.info(board);
        }
    }

    // 게시글 페이징 테스트
    @Test
    public void testPaging() {

        Criteria cri = new Criteria(5, 10);

        int boardIdx = 1;

        List<BoardVO> list = boardMapper.getListWithPaging(cri);

        list.forEach(board -> log.info(board));
    }
    // 게시글 수정 테스트
    @Test
    public void testUpdate() {

        BoardVO vo = boardMapper.get(11L);

        vo.setTitle("테스트 제목 수정");
        vo.setContent("테스트 내용 수정");

        boardMapper.update(vo);

    }

    // 게시글 삭제 테스트
    @Test
    public void testDelete() {

        log.info("Delete....");

        boardMapper.delete(11L);
    }

    // 게시글 검색 테스트
    @Test
    public void testSearch() {

        Criteria cri = new Criteria();
        cri.setType("TC");
        cri.setKeyword("ㅋㅋㄹㅃㅃ");

        int boardIdx = 2;

        List<BoardVO> list = boardMapper.getListWithPaging(cri);

        list.forEach(board -> log.info(board));
    }

    // 전체 게시글 갯수 테스트
    @Test
    public void testTotal() {

        log.info(boardMapper.getTotalCount());
    }

   /* // 게시글 당 전체 댓글 테스트
    @Test
    public void testReplyCnt() {

        log.info(boardMapper.getTotalReply(1038L));
    }*/

    // 댓글 개수 업데이트 테스트 (플러스)
    @Test
    public void testUpdateReplyPlus() {

        boardMapper.plusReplyCnt(1038L);

        BoardVO vo = boardMapper.get(1038L);

        log.info(vo.getReplyCnt());
    }

    // 댓글 개수 업데이트 테스트 (마이너스)
    @Test
    public void testUpdateReplyCntMinus() {

        boardMapper.minusReplyCnt(1038L);

        BoardVO vo = boardMapper.get(1038L);

        log.info(vo.getReplyCnt());
    }

}

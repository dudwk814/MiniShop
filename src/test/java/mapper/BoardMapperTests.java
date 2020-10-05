package mapper;

import domain.BoardVO;
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

    // 게시글 조회 테스트
    @Test
    public void testGet() {

        BoardVO vo = boardMapper.get(2L);

        log.info(vo);
    }

    // 전체 게시글 조회 테스트
    @Test
    public void testGetList() {

        List<BoardVO> list = boardMapper.getList();

        for (BoardVO board : list) {
            log.info(board);
        }
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


}
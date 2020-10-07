package service;

import domain.BoardVO;
import domain.Criteria;
import domain.UserVO;
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
public class BoardServiceTests {

    @Setter(onMethod_ = {@Autowired})
    private BoardService boardService;

    // 단일 게시글 조회 테스트
    @Test
    public void testRead() {

        BoardVO vo = boardService.read(10L);

        log.info(vo);
    }

    // 전체 게시글 조회 테스트
    @Test
    public void testGetList() {

        Criteria cri = new Criteria(5, 10);
        List<BoardVO> list = boardService.getList(cri);

        list.forEach(board -> log.info(board));
    }

    // 게시글 등록 테스트
    @Test
    public void testRegister() {

        BoardVO vo = new BoardVO();
        vo.setTitle("테스트2");
        vo.setContent("테스트2");
        vo.setWriter("tester2");

        boardService.register(vo);
    }

    // 게시글 수정 테스트
    @Test
    public void testModify() {

        BoardVO vo = boardService.read(12L);

        vo.setTitle("test2");
        vo.setContent("test2");

        boardService.modify(vo);
    }

    // 게시글 삭제 테스트
    @Test
    public void testRemove() {

        boardService.remove(12L);
    }


}

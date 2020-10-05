package service;

import domain.BoardVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.ws.Action;
import java.util.List;

@Service
@Log4j
public class BoardServiceImpl implements BoardService{

    @Setter(onMethod_ = {@Autowired})
    private BoardMapper boardMapper;

    // 단일 게시글 조회
    @Override
    public BoardVO read(Long bno) {

        log.info("read......." + bno);
        return boardMapper.get(bno);
    }

    // 전체 게시글 조회
    @Override
    public List<BoardVO> list() {

        log.info("Get List.....");
        return boardMapper.getList();
    }

    // 게시글 등록
    @Override
    public void register(BoardVO vo) {
        log.info("Registered Board...." + vo);

        boardMapper.insert(vo);
    }

    // 게시글 수정
    @Override
    public void modify(BoardVO vo) {

        log.info("Modified Board........" + vo);

        boardMapper.update(vo);
    }

    // 게시글 삭제
    @Override
    public void remove(Long bno) {

        log.info("Removed Board......" + bno);

        boardMapper.delete(bno);
    }
}

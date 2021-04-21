package service;

import domain.BoardVO;
import domain.Criteria;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.BoardMapper;
import mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.ws.Action;
import java.util.List;

@Service
@Log4j
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{

    private final BoardMapper boardMapper;

    private final ReplyMapper replyMapper;

    @Override
    public BoardVO read(Long bno) {

        log.info("read......." + bno);

        return boardMapper.get(bno);
    }

    @Override
    public void upHit(Long bno) {
        boardMapper.UpHit(bno);
    }

    @Override
    public int getTotalCount(Criteria cri) {
        return boardMapper.getTotalCount(cri);
    }

    @Override
    public List<BoardVO> getList(Criteria cri) {

        log.info("Get List.....");
        return boardMapper.getListWithPaging(cri);
    }

    @Override
    public void register(BoardVO vo) {
        log.info("Registered Board...." + vo);

        boardMapper.insertSelectKey(vo);
    }

    @Override
    public boolean modify(BoardVO vo) {

        log.info("Modified Board........" + vo);

        return boardMapper.update(vo);
    }

    @Override
    public boolean remove(Long bno) {

        log.info("Removed Board......" + bno);

        replyMapper.deleteByBno(bno);

        return boardMapper.delete(bno);
    }
}

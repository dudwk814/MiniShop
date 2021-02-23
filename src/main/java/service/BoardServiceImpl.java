package service;

import domain.BoardVO;
import domain.Criteria;
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
public class BoardServiceImpl implements BoardService{

    @Setter(onMethod_ = {@Autowired})
    private BoardMapper boardMapper;

    @Setter(onMethod_ = {@Autowired})
    private ReplyMapper replyMapper;

    /**
     * 단일 게시글 조회
     * @param bno
     * @return
     */
    @Override
    public BoardVO read(Long bno) {

        log.info("read......." + bno);

        return boardMapper.get(bno);
    }

    @Override
    public void upHit(Long bno) {
        boardMapper.UpHit(bno);
    }

    /**
     * 전체 게시글 수 조회
     * @return
     */
    @Override
    public int getTotalCount() {
        return boardMapper.getTotalCount();
    }

    /**
     * 전체 게시글 조회 (List)
     * @param cri
     * @return
     */
    @Override
    public List<BoardVO> getList(Criteria cri) {

        log.info("Get List.....");
        return boardMapper.getListWithPaging(cri);
    }

    /**
     * 게시글 등록
     * @param vo
     */
    @Override
    public void register(BoardVO vo) {
        log.info("Registered Board...." + vo);

        boardMapper.insertSelectKey(vo);
    }

    /**
     * 게시글 수정
     * @param vo
     * @return
     */
    @Override
    public boolean modify(BoardVO vo) {

        log.info("Modified Board........" + vo);

        return boardMapper.update(vo);
    }

    /**
     * 게시글 삭제
     * @param bno
     * @return
     */
    @Override
    public boolean remove(Long bno) {

        log.info("Removed Board......" + bno);

        replyMapper.deleteByBno(bno);

        return boardMapper.delete(bno);
    }
}

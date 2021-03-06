package service;

import domain.BoardVO;
import domain.Criteria;

import java.util.List;

public interface BoardService {

    public BoardVO read(Long bno);

    public void upHit(Long bno);

    public List<BoardVO> getList(Criteria cri);

    public int getTotalCount(Criteria cri);

    public void register(BoardVO vo);

    public boolean modify(BoardVO vo);

    public boolean remove(Long bno);

}

package service;

import domain.BoardVO;

import java.util.List;

public interface BoardService {

    public BoardVO read(Long bno);

    public List<BoardVO> list();

    public void register(BoardVO vo);

    public void modify(BoardVO vo);

    public void remove(Long bno);
}

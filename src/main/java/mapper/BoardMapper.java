package mapper;

import domain.BoardVO;

import java.util.List;

public interface BoardMapper {

    public BoardVO get(Long bno);

    public List<BoardVO> getList();

    public void insert(BoardVO vo);

    public void update(BoardVO vo);

    public void delete(Long bno);
}
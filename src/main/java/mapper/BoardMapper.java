package mapper;

import domain.BoardVO;
import domain.Criteria;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BoardMapper {

    public BoardVO get(Long bno);

    public List<BoardVO> getList(int boardIdx);

    public List<BoardVO> getListWithPaging(Criteria cri);

    public int getTotalCount();

    public void insert(BoardVO vo);

    public void insertSelectKey(BoardVO vo);

    public boolean update(BoardVO vo);

    public boolean delete(Long bno);

    public void plusReplyCnt(Long bno);

    public void minusReplyCnt(Long bno);
}

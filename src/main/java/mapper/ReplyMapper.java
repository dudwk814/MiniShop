package mapper;

import domain.ReplyVO;

import java.util.List;

public interface ReplyMapper {


    public int insert(ReplyVO vo);

    public ReplyVO read(Long rno);

    public List<ReplyVO> list(Long bno);

    public int delete(Long rno);

    public int update(ReplyVO vo);
}

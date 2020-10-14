package mapper;

import domain.Criteria;
import domain.ReplyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {


    public int insert(ReplyVO vo);

    public ReplyVO read(Long rno);

    public List<ReplyVO> getListWithPaging(@Param("bno") Long bno, @Param("cri")Criteria cri);

    // 전체 댓글 숫자 파악
    public int getCountByBno(Long bno);

    // bno 당 댓글 개수 파악
    public int getReplyCnt(Long bno);

    public int delete(Long rno);

    public int update(ReplyVO vo);
}

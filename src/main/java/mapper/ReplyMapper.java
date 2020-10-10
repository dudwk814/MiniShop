package mapper;

import domain.Criteria;
import domain.ReplyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {


    public int insert(ReplyVO vo);

    public ReplyVO read(Long rno);

    public List<ReplyVO> getListWithPaging(@Param("bno") Long bno, @Param("cri")Criteria cri);

    public int delete(Long rno);

    public int update(ReplyVO vo);
}

package service;

import domain.ReplyVO;

import java.util.List;

public interface ReplyService {

    // 댓글 작성
    public int insert(ReplyVO vo);

    // 단일 댓글 조회
    public ReplyVO get(Long rno);

    // 전체 댓글 조회
    public List<ReplyVO> getList(Long bno);

    // 댓글 삭제
    public int remove(Long rno);

    // 댓글 수정
    public int modify(ReplyVO vo);
}

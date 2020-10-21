package mapper;

import domain.NoticeVO;

import java.util.List;

public interface NoticeMapper {

    // 단일 공지 조회
    public NoticeVO get(Long nno);

    // 전체 공지 조회
    public List<NoticeVO> getList();

    // 공지 작성
    public int insert(NoticeVO vo);

    // 공지 수정
    public int update(NoticeVO vo);

    // 공지 삭제
    public int delete(Long nno);
}

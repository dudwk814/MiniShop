package service;

import domain.NoticeVO;

import java.util.List;

public interface NoticeService {

    public NoticeVO read(Long nno);

    public List<NoticeVO> list();

    public int register(NoticeVO vo);

    public int modify(NoticeVO vo);

    public int remove(Long nno);
}

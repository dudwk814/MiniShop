package service;

import domain.NoticeVO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Log4j
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeMapper noticeMapper;

    @Transactional
    @Override
    public NoticeVO read(Long nno) {

        log.info("Get Notice By : " + nno);

        noticeMapper.UpHit(nno);

        return noticeMapper.get(nno);
    }

    @Override
    public List<NoticeVO> list() {

        log.info("Get All Notice List");

        return noticeMapper.getList();
    }

    @Override
    public int register(NoticeVO vo) {

        log.info("Register Notice : " + vo);

        return noticeMapper.insert(vo);
    }

    @Override
    public int modify(NoticeVO vo) {

        log.info("Modified Notice By " + vo.getNno());

        return noticeMapper.update(vo);
    }

    @Override
    public int remove(Long nno) {

        log.info("Removed Notice : " + nno);

        return noticeMapper.delete(nno);
    }
}

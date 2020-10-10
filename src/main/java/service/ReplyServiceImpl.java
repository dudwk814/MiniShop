package service;

import domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

    @Setter(onMethod_ = {@Autowired})
    private ReplyMapper replyMapper;


    @Override
    public int insert(ReplyVO vo) {

        log.info("insert Reply : " + vo.getRno());
        return replyMapper.insert(vo);
    }

    @Override
    public ReplyVO get(Long rno) {

        log.info("Get Reply : " + rno);

        return replyMapper.read(rno);
    }

    @Override
    public List<ReplyVO> getList(Long bno) {

        log.info("Reply GetList : " + bno);
        return replyMapper.list(bno);
    }

    @Override
    public int remove(Long rno) {

        log.info("REMOVED REPLY : " + rno);
        return replyMapper.delete(rno);
    }

    @Override
    public int modify(ReplyVO vo) {

        log.info("MODIFIED REPLY : " + vo);

        return replyMapper.update(vo);
    }
}

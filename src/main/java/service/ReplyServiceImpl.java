package service;

import domain.Criteria;
import domain.ReplyPageDTO;
import domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.BoardMapper;
import mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

    @Setter(onMethod_ = {@Autowired})
    private ReplyMapper replyMapper;

    @Setter(onMethod_ = {@Autowired})
    private BoardMapper boardMapper;


    @Transactional
    @Override
    public int insert(ReplyVO vo) {

        log.info("insert Reply : " + vo.getRno());

        boardMapper.plusReplyCnt(vo.getBno());

        return replyMapper.insert(vo);
    }

    @Override
    public ReplyVO get(Long rno) {

        log.info("Get Reply : " + rno);

        return replyMapper.read(rno);
    }

    @Override
    public ReplyPageDTO getList(Long bno, Criteria cri) {

        log.info("Reply GetList : " + bno);
        return new ReplyPageDTO(replyMapper.getCountByBno(bno), replyMapper.getListWithPaging(bno, cri));
    }

    @Override
    public int getReplyCnt(Long bno) {
        return replyMapper.getCountByBno(bno);
    }

    @Transactional
    @Override
    public int remove(Long rno, Long bno) {

        log.info("REMOVED REPLY : " + rno);

        boardMapper.minusReplyCnt(bno);
        return replyMapper.delete(rno);
    }

    @Override
    public int modify(ReplyVO vo) {

        log.info("MODIFIED REPLY : " + vo);

        return replyMapper.update(vo);
    }
}

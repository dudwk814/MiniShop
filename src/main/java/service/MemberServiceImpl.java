package service;

import domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{

    @Setter(onMethod_ = {@Autowired})
    private MemberMapper memberMapper;

    @Setter(onMethod_ = {@Autowired})
    private PasswordEncoder encoder;

    @Transactional
    @Override
    public int register(MemberVO memberVO) {

        memberVO.setUserpw(encoder.encode(memberVO.getUserpw()));


        int register = memberMapper.register(memberVO);

        memberMapper.authRegister(memberVO.getUserid());

        return register;
    }

    @Override
    public int modify(MemberVO memberVO) {

        memberVO.setUserpw(encoder.encode(memberVO.getUserpw()));

        return memberMapper.modify(memberVO);
    }

    @Override
    public int remove(String userid) {

        log.info("removed member : " + userid);

        int removeMember = memberMapper.removeMember(userid);

        memberMapper.removeAuth(userid);

        return removeMember;
    }

    @Override
    public MemberVO read(String userid) {

        log.info("get member info " + userid);

        return memberMapper.get(userid);
    }
}

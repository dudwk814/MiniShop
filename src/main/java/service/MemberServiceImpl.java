package service;

import domain.AddressVO;
import domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{

    @Setter(onMethod_ = {@Autowired})
    private MemberMapper memberMapper;

    @Setter(onMethod_ = {@Autowired})
    private AddressService addressService;

    @Setter(onMethod_ = @Autowired)
    private BCryptPasswordEncoder encoder;

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

    @Transactional
    @Override
    public int remove(String userid) {

        log.info("removed member : " + userid);

        memberMapper.removeAuth(userid);

        int removeMember = memberMapper.removeMember(userid);



        return removeMember;
    }

    @Override
    public MemberVO read(String userid) {

        log.info("get member info " + userid);

        return memberMapper.get(userid);
    }

    @Override
    public List<MemberVO> getList() {
        return memberMapper.getList();
    }

    @Override
    public int findUser(String userid) {
        return memberMapper.findUser(userid);
    }
}

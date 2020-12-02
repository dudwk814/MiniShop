package service;

import domain.AddressVO;
import domain.MemberVO;
import domain.authVO;

import java.util.List;

public interface MemberService {

    public MemberVO read(String userid);

    public List<MemberVO> getList();

    public int register(MemberVO memberVO);

    public int modify(MemberVO memberVO);

    public int remove(String userid);

    public int findUser(String userid);

    public boolean updateAuth(authVO vo);
}

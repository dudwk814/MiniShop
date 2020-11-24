package service;

import domain.AddressVO;
import domain.MemberVO;

import java.util.List;

public interface MemberService {

    public MemberVO read(String userid);

    public List<MemberVO> getList();

    public int register(MemberVO memberVO);

    public int modify(MemberVO memberVO);

    public int remove(String userid);

    public int findUser(String userid);
}

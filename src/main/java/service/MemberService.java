package service;

import domain.AddressVO;
import domain.MemberVO;

public interface MemberService {

    public MemberVO read(String userid);

    public int register(MemberVO memberVO, AddressVO addressVO);

    public int modify(MemberVO memberVO);

    public int remove(String userid);
}

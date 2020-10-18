package service;

import domain.MemberVO;

public interface MemberService {

    public MemberVO read(String userid);

    public int register(MemberVO memberVO);

    public int modify(MemberVO memberVO);

    public int remove(String userid);
}

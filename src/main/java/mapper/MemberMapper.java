package mapper;

import domain.MemberVO;

public interface MemberMapper {

    public MemberVO get(String userid);

    public int register(MemberVO memberVO);
    public void authRegister(String userid);

    public int modify(MemberVO memberVO);

    public int removeMember(String userid);
    public void removeAuth(String userid);

    public int findUser(String userid);
}

package mapper;

import domain.MemberVO;
import domain.authVO;

import java.util.List;

public interface MemberMapper {

    public MemberVO get(String userid);

    public List<MemberVO> getList();

    public int register(MemberVO memberVO);
    public void authRegister(String userid);

    public int modify(MemberVO memberVO);

    public int removeMember(String userid);
    public void removeAuth(String userid);

    public int findUser(String userid);

    public int updateAuth(authVO vo);
}

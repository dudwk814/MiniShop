package mapper;

import domain.UserVO;
import domain.authVO;

import java.util.List;

public interface UserMapper {

    public UserVO get(String userid);

    public List<UserVO> getList();

    public int register(UserVO userVO);
    public void authRegister(String userid);

    public UserVO getUser(String userid);

    public int modify(UserVO userVO);

    public int removeUser(String userid);
    public void removeAuth(String userid);

    public int findUser(String userid);

    public UserVO findPassword(UserVO vo);

    public int modifyPassword(UserVO vo);

    public int updateAuth(authVO vo);
}

package service;

import domain.UserVO;
import domain.authVO;

import java.util.List;

public interface UserService {

    public UserVO read(String userid);

    public List<UserVO> getList();

    public int register(UserVO userVO);

    public int modify(UserVO userVO);

    public int remove(String userid);

    public UserVO getUser(String userid);

    public UserVO findPassword(UserVO vo);

    public int modifyPassword(UserVO vo);

    public int findUser(String userid);

    public boolean updateAuth(authVO vo);
}

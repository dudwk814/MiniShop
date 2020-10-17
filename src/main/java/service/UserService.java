package service;

import domain.UserVO;

import java.util.List;

public interface UserService {

    public boolean register(UserVO vo);

    public boolean removeUser(Long mno);

    public boolean modifyUser(UserVO vo);

    public UserVO getUser(UserVO vo);

    public List<UserVO> getUserList();
}

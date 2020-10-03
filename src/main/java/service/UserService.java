package service;

import domain.UserVO;

import java.util.List;

public interface UserService {

    public void register(UserVO vo);

    public boolean removeUser(Long mno);

    public boolean modifyUser(UserVO vo);

    public UserVO getUser(Long mno);

    public List<UserVO> getUserList();
}

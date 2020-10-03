package mapper;

import domain.UserVO;

import java.util.List;

public interface UserMapper {

    public UserVO get(Long mNo);

    public List<UserVO> getList();

    public int register(UserVO vo);

    public int update(UserVO vo);

    public int delete(Long mNo);
}

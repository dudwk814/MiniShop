package mapper;

import domain.AddressVO;

public interface AddressMapper {

    public AddressVO get(String userid);

    public void insert(AddressVO vo);

    public void modify(AddressVO vo);

    public void delete(String userid);
}

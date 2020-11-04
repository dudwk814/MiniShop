package service;

import domain.AddressVO;

public interface AddressService {

    public AddressVO get(String userid);

    public void insert(AddressVO vo);

    public void modify(AddressVO vo);

    public void delete(String userid);
}

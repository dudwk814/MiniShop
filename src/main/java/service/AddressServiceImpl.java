package service;

import domain.AddressVO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.AddressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Log4j
@RequiredArgsConstructor
public class AddressServiceImpl implements AddressService{

    private final AddressMapper addressMapper;

    @Override
    public AddressVO get(String userid) {

        log.info("get Address : " + userid);
        return addressMapper.get(userid);
    }

    @Override
    public void insert(AddressVO vo) {

        log.info("insert Address : " + vo.getUserid());

        addressMapper.insert(vo);
    }

    @Override
    public void modify(AddressVO vo) {

        log.info("modify Address : " + vo.getUserid());

        addressMapper.modify(vo);
    }

    @Override
    public void delete(String userid) {

        log.info("delete address : " + userid);

        addressMapper.delete(userid);
    }
}


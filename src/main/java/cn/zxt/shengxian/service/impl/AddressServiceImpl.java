package cn.zxt.shengxian.service.impl;

import cn.zxt.shengxian.dao.AddressDao;
import cn.zxt.shengxian.pojo.Address;
import cn.zxt.shengxian.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    @Qualifier("addressDao")
    private AddressDao addressDao;

    @Override
    public Address getAddressByUId(Integer uId) {
        return addressDao.getAddressByUId(uId);
    }

    @Override
    public int addAddress(Address address) {
        return addressDao.addAddress(address);
    }

    @Override
    public int updAddress(Address address) {
        return addressDao.updAddress(address);
    }

}

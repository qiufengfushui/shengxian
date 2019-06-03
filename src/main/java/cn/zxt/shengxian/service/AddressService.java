package cn.zxt.shengxian.service;

import cn.zxt.shengxian.pojo.Address;

public interface AddressService {
    Address getAddressByUId(Integer uId);

    int addAddress(Address address);

    int updAddress(Address address);
}

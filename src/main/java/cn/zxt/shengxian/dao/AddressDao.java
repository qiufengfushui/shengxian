package cn.zxt.shengxian.dao;

import cn.zxt.shengxian.pojo.Address;

public interface AddressDao {
    Address getAddressByUId(Integer uId);

    int addAddress(Address address);

    int updAddress(Address address);
}

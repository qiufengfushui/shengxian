package cn.zxt.shengxian.service.impl;

import cn.zxt.shengxian.dao.OrderFromDao;
import cn.zxt.shengxian.service.OrderFromService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class OrderFromServiceImpl implements OrderFromService {

    @Autowired
    @Qualifier("orderFromDao")
    private OrderFromDao orderFromDao;
}

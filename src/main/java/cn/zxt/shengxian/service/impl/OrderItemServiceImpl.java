package cn.zxt.shengxian.service.impl;

import cn.zxt.shengxian.dao.OrderItemDao;
import cn.zxt.shengxian.pojo.Order;
import cn.zxt.shengxian.pojo.OrderItem;
import cn.zxt.shengxian.pojo.Product;
import cn.zxt.shengxian.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class OrderItemServiceImpl implements OrderItemService {

    @Autowired
    @Qualifier("orderItemDao")
    private OrderItemDao orderItemDao;

    @Override
    public int addOrderItemOne(long oiId, int pId, int pCount) {
        return orderItemDao.addOrderItemOne(oiId,pId,pCount);
    }

    @Override
    public int addOrderItem(long oiId, HashMap map, Double price) {
        return orderItemDao.addOrderItem(oiId,map,price);
    }

    @Override
    public int addOrder(Order order) {
        return orderItemDao.addOrder(order);
    }

    @Override
    public List<Order> getOrderProduct(int uId) {
        return orderItemDao.getOrderProduct(uId);
    }

    @Override
    public List<OrderItem> getOrderItemByOiId(long oiId) {
        return orderItemDao.getOrderItemByOiId(oiId);
    }

    @Override
    public Product getOrderItemProductByPid(int pId) {
        return orderItemDao.getOrderItemProductByPid(pId);
    }

    @Override
    public List<Order> getOrderByOiId(long oiId) {
        return orderItemDao.getOrderByOiId(oiId);
    }

    @Override
    public int updOrderByOiId(long oiId) {
        return orderItemDao.updOrderByOiId(oiId);
    }
}

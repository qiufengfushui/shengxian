package cn.zxt.shengxian.service;

import cn.zxt.shengxian.pojo.Order;
import cn.zxt.shengxian.pojo.OrderItem;
import cn.zxt.shengxian.pojo.Product;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

public interface OrderItemService {

    int addOrderItemOne(long oiId,int pId,int pCount);

    int addOrderItem(long oiId, HashMap map, Double price);

    int addOrder(Order order);

    List<Order> getOrderProduct(int uId);

    List<OrderItem> getOrderItemByOiId(long oiId);

    Product getOrderItemProductByPid(int pId);

    List<Order> getOrderByOiId(long oiId);

    int updOrderByOiId(long oiId);
}

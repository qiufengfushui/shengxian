package cn.zxt.shengxian.dao;

import cn.zxt.shengxian.pojo.Order;
import cn.zxt.shengxian.pojo.OrderItem;
import cn.zxt.shengxian.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface OrderItemDao {
    int addOrderItem(@Param("oiId") long oiId, @Param("map")HashMap<Integer,Integer> map, @Param("price")Double price);

    int addOrder(Order order);

    List<Order> getOrderProduct(int uId);

    List<OrderItem> getOrderItemByOiId(long oiId);

    Product getOrderItemProductByPid(int pId);

    List<Order> getOrderByOiId(long oiId);

    int updOrderByOiId(long oiId);

    int addOrderItemOne(@Param("oiId") long oiId, @Param("pId") int pId, @Param("pCount") int pCount);
}

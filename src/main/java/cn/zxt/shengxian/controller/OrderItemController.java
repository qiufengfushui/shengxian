package cn.zxt.shengxian.controller;

import cn.zxt.shengxian.pojo.*;
import cn.zxt.shengxian.service.OrderItemService;
import cn.zxt.shengxian.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class OrderItemController {

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private ShoppingService shoppingService;

    @RequestMapping("/doAJAXAddOrder")
    @ResponseBody
    public Object doAJAXAddOrder(HttpSession session,Integer pId,Integer pCount,Double total){
        AJAXResult result = new AJAXResult();
        long oiId =  new Date().getTime();
        int db_resultOne = orderItemService.addOrderItemOne(oiId,pId,pCount);
        if(db_resultOne == 1){
            //添加订单集成功
            int uId = ((User) session.getAttribute("userSession")).getUserId();
            Order order = new Order(oiId,uId,total,1);
            int db_resultTwo = orderItemService.addOrder(order);
            if(db_resultTwo == 1){
                result.setSuccess(true);
                result.setObject(oiId);
            }
        }
        return result;
    }

    @RequestMapping("/doAJAXAddOrderItem")
    @ResponseBody
    private Object doAJAXAddOrderItem(HttpSession session,String sIds,String values, Double price){
        AJAXResult result = new AJAXResult();
        HashMap<Integer,Integer> map = new HashMap<>();
        String[] value = values.split("&");
        for (int i = 0; i < value.length; i++) {
            String[] products = value[i].split("=");
            map.put(Integer.valueOf(products[0]),Integer.valueOf(products[1]));
        }
        String[] sId = sIds.split(",");
        Integer[] sIds1 = new Integer[sId.length];
        for (int i = 0; i < sId.length; i++) {
            sIds1[i] = Integer.valueOf(sId[i]);
        }

        if(session.getAttribute("userSession") != null) {
            int uId = ((User) session.getAttribute("userSession")).getUserId();
            long oiId =  new Date().getTime();
            int db_resultOne = orderItemService.addOrderItem(oiId,map,price);
            if(db_resultOne > 0){
                //添加订单集成功
                //由于订单是新建的订单状态默认为1
                int db_resultTwo = orderItemService.addOrder(new Order(oiId,uId,price,1));
                if(db_resultTwo == 1){
                    //添加订单成功
                    int db_resultThree = shoppingService.batchDelShopping(sIds1);
                    System.out.println(db_resultThree);
                    if (db_resultThree > 0){
                        //删除购物车成功
                        result.setSuccess(true);
                        result.setObject(oiId);
                    }
                }
            }
        }
        return result;
    }
    @RequestMapping("/doAJAXGetOrderProduct")
    @ResponseBody
    public Object doAJAXGetOrderProduct(HttpSession session){
        AJAXResult result = new AJAXResult();
        User user = (User)session.getAttribute("userSession");
        List<Order> db_orderList = orderItemService.getOrderProduct(user.getUserId());
        for (int i = 0; i < db_orderList.size(); i++) {
            long oiId = db_orderList.get(i).getOiId();
            List<OrderItem> db_orderItemList = orderItemService.getOrderItemByOiId(oiId);
            db_orderList.get(i).setOrderItemList(db_orderItemList);
            for (int j = 0; j < db_orderItemList.size(); j++) {
                int pId = db_orderItemList.get(j).getOipId();
                Product db_product = orderItemService.getOrderItemProductByPid(pId);
                db_orderItemList.get(j).setProduct(db_product);
            }
        }
        result.setObject(db_orderList);
        return result;
    }

    @RequestMapping("/doAJAXGetOrderByOiId")
    @ResponseBody
    public Object doAJAXGetOrderByOiId(@RequestParam(value = "oiId") long oiId){
        AJAXResult result = new AJAXResult();
         List<Order> db_order = orderItemService.getOrderByOiId(oiId);
         result.setObject(db_order);
        return result;
    }

    @RequestMapping("/doAJAXUpdOrderByOiId")
    @ResponseBody
    public Object doAJAXUpdOrderByOiId(@RequestParam(value = "oiId") long oiId){
        AJAXResult result = new AJAXResult();
        int db_result = orderItemService.updOrderByOiId(oiId);
        if(db_result == 1){
            result.setSuccess(true);
        }
        return result;
    }
}

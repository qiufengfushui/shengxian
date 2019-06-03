package cn.zxt.shengxian.service;

import cn.zxt.shengxian.pojo.Shopping;

import java.util.List;

public interface ShoppingService {
    int addShopping(Shopping shopping);

    List<Shopping> getShoppingListByUId(int uId);

    int delShopping(Integer sId);

    int updPCountBySId(Integer sId, Integer pCount);

    Shopping getShoppingByUIdAndPId(int uId, Integer pId);

    int batchDelShopping(Integer[] sIds);
}

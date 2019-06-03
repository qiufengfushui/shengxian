package cn.zxt.shengxian.service.impl;

import cn.zxt.shengxian.dao.ShoppingDao;
import cn.zxt.shengxian.pojo.Shopping;
import cn.zxt.shengxian.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingServiceImpl implements ShoppingService {

    @Autowired
    @Qualifier("shoppingDao")
    private ShoppingDao shoppingDao;

    @Override
    public int addShopping(Shopping shopping) {
        return shoppingDao.addShopping(shopping);
    }

    @Override
    public List<Shopping> getShoppingListByUId(int uId) {
        return shoppingDao.getShoppingListByUId(uId);
    }

    @Override
    public int delShopping(Integer sId) {
        return shoppingDao.delShopping(sId);
    }

    @Override
    public int updPCountBySId(Integer sId, Integer pCount) {
        return shoppingDao.updPCountBySId(sId,pCount);
    }

    @Override
    public Shopping getShoppingByUIdAndPId(int uId, Integer pId) {
        return shoppingDao.getShoppingByUIdAndPId(uId,pId);
    }

    @Override
    public int batchDelShopping(Integer[] sIds) {
        return shoppingDao.batchDelShopping(sIds);
    }
}

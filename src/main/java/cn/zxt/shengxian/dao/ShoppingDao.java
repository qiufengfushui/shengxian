package cn.zxt.shengxian.dao;

import cn.zxt.shengxian.pojo.Shopping;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShoppingDao {
    int addShopping(Shopping shopping);

    List<Shopping> getShoppingListByUId(int uId);

    int delShopping(Integer sId);

    int updPCountBySId(@Param("sId") Integer sId,@Param("pCount") Integer pCount);

    Shopping getShoppingByUIdAndPId(@Param("uId") int uId, @Param("pId") Integer pId);

    int batchDelShopping(@Param("sIds")Integer[] sIds);
}

package cn.zxt.shengxian.dao;

import cn.zxt.shengxian.pojo.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface ProductDao {

    List<Product> getProductListByCount(@Param("count")Integer count);

    List<Product> getProductListByType(@Param("ptId") Integer ptId, @Param("pName")String pName, @Param("startIndex")Integer startIndex,@Param("pageSize")Integer pageSize);

    Integer getProductListByTypeCount(@Param("ptId")Integer ptId, @Param("pName")String pName);

    Product getProductByPId(@Param("pId") Integer pId);
}

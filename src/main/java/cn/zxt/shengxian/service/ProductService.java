package cn.zxt.shengxian.service;

import cn.zxt.shengxian.pojo.Product;

import java.util.List;

public interface ProductService {

    List<Product> getProductListByCount(Integer count);

    List<Product> getProductListByType(Integer ptId, String pName, Integer startIndex,Integer pageSize);

    Integer getProductListByTypeCount(Integer ptId, String pName);

    Product getProductByPId(Integer pId);
}

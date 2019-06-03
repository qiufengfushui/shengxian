package cn.zxt.shengxian.service.impl;


import cn.zxt.shengxian.dao.ProductDao;
import cn.zxt.shengxian.pojo.Product;
import cn.zxt.shengxian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    @Qualifier("productDao")
    private ProductDao productDao;

    @Override
    public List<Product> getProductListByCount(Integer count) {
        return productDao.getProductListByCount(count);
    }

    @Override
    public List<Product> getProductListByType(Integer ptId, String pName, Integer startIndex, Integer pageSize) {
        return productDao.getProductListByType(ptId,pName,startIndex,pageSize);
    }

    @Override
    public Integer getProductListByTypeCount(Integer ptId, String pName) {
        return productDao.getProductListByTypeCount(ptId,pName);
    }

    @Override
    public Product getProductByPId(Integer pId) {
        return productDao.getProductByPId(pId);
    }

}

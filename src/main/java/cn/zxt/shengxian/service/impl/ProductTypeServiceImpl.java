package cn.zxt.shengxian.service.impl;

import cn.zxt.shengxian.dao.ProductTypeDao;
import cn.zxt.shengxian.pojo.ProductType;
import cn.zxt.shengxian.service.ProductService;
import cn.zxt.shengxian.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductTypeServiceImpl implements ProductTypeService {

    @Autowired
    @Qualifier("productTypeDao")
    private ProductTypeDao productTypeDao;

    @Override
    public List<ProductType> getProductTypeList() {
        return productTypeDao.getProductTypeList();
    }
}

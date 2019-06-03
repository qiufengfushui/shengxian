package cn.zxt.shengxian.controller;

import cn.zxt.shengxian.pojo.AJAXResult;
import cn.zxt.shengxian.pojo.ProductType;
import cn.zxt.shengxian.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ProductTypeController {

    @Autowired
    private ProductTypeService productTypeService;

    @RequestMapping("/doAJAXGetProductTypeList")
    @ResponseBody
    public Object doAJAXGetProductTypeList(){
        AJAXResult result = new AJAXResult();
        List<ProductType> list = productTypeService.getProductTypeList();
        result.setList(list);
        return result;
    }
}

package cn.zxt.shengxian.controller;

import cn.zxt.shengxian.pojo.AJAXResult;
import cn.zxt.shengxian.pojo.Product;
import cn.zxt.shengxian.service.ProductService;
import cn.zxt.shengxian.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/doAJAXGetProductListByCount")
    @ResponseBody
    public Object doAJAXLGetProductListByCount(@RequestParam(value = "count",required = false,defaultValue = "4") Integer count){
        AJAXResult result = new AJAXResult();
        List<Product> db_list = productService.getProductListByCount(count);
        List result_list = new ArrayList();
        int score = 0;
        for (int i = 0; i < db_list.size()/count; i++) {
            List<Product> list = new ArrayList<>();
            for (int j = 0; j < count ; j++) {
                list.add(db_list.get(score++));
            }
            result_list.add(list);
        }
        result.setList(result_list);
        return result;
    }
    @RequestMapping("/doAJAXGetProductListByType")
    @ResponseBody
    public Object doAJAXLGetProductListByType(@RequestParam(value = "all",required = false) String all, @RequestParam(value = "ptId",required = false)Integer ptId, @RequestParam(value = "pName",required = false)String pName, @RequestParam(value = "pageNum",required = false,defaultValue = "1") Integer pageNum,@RequestParam(value = "pageSize",required = false,defaultValue = "10")Integer pageSize){
        AJAXResult result = new AJAXResult();
        int totalRecord = productService.getProductListByTypeCount(ptId,pName);
        PageBean pageBean = new PageBean(pageNum,pageSize,totalRecord);
        List<Product> list = productService.getProductListByType(ptId,pName,pageBean.getStartIndex(),pageBean.getPageSize());
        result.setList(list);
        result.setPageBean(pageBean);
        return result;
    }
    @RequestMapping("/doAJAXGetProductByPId")
    @ResponseBody
    public Object doAJAXGetProductByPId(@RequestParam(value = "pId") Integer pId){
        AJAXResult result = new AJAXResult();
        Product product = productService.getProductByPId(pId);
        result.setObject(product);
        return result;
    }
}

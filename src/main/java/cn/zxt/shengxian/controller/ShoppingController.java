package cn.zxt.shengxian.controller;

import cn.zxt.shengxian.pojo.AJAXResult;
import cn.zxt.shengxian.pojo.Shopping;
import cn.zxt.shengxian.pojo.User;
import cn.zxt.shengxian.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ShoppingController {
    @Autowired
    private ShoppingService shoppingService;

    @RequestMapping("/doAJAXAddShopping")
    @ResponseBody
    public Object doAJAXAddShopping(HttpSession session, @RequestParam("pId") Integer pId, @RequestParam(value = "pCount",required = false,defaultValue = "1") Integer pCount){

        AJAXResult result = new AJAXResult();
        if(session.getAttribute("userSession") != null){
           int uId = ((User) session.getAttribute("userSession")).getUserId();

            //加入购物车之前要查询一下此人购物车有没有这个商品,有的话返回商品数量
            Shopping db_Shopping = shoppingService.getShoppingByUIdAndPId(uId,pId);

            //有此商品，修改商品数量
            if(db_Shopping != null){
                db_Shopping.setpCount(db_Shopping.getpCount()+1);

               int db_result = shoppingService.updPCountBySId(db_Shopping.getsId(),db_Shopping.getpCount());
                if (db_result == 1){
                    result.setStatus("true");
                }else {
                    result.setStatus("false");
                }
            }else{
            //无此商品，新增商品
                Shopping shopping = new Shopping(0,uId,pId,pCount,null,null);

                int db_result = shoppingService.addShopping(shopping);
                if (db_result == 1){
                    result.setStatus("true");
                }else {
                    result.setStatus("false");
                }
            }
        }else{
            result.setStatus("null");
        }
        return result;
    }
    @RequestMapping("/doAJAXGetShoppingListByUId")
    @ResponseBody
    public Object doAJAXGetShoppingListByUId(HttpSession session){
        AJAXResult result = new AJAXResult();
        if(session.getAttribute("userSession") != null){
            int uId = ((User) session.getAttribute("userSession")).getUserId();
            List<Shopping> list = shoppingService.getShoppingListByUId(uId);
            if (list.size() > 0 ){
                result.setStatus("true");
                result.setList(list);
            }else{
                result.setStatus("false");
            }
        }else{
            result.setStatus("null");
        }
        return result;
    }
    @RequestMapping("/doAJAXDelShopping")
    @ResponseBody
    public Object doAJAXDelShopping(@RequestParam(value = "sId",required = false) Integer sId){
        AJAXResult result = new AJAXResult();
        if(sId != null){
               int db_result = shoppingService.delShopping(sId);
               if(db_result == 1){
                   result.setSuccess(true);
               }else{
                   result.setSuccess(false);
               }
        }else{
            result.setSuccess(false);
        }
        return result;
    }
    @RequestMapping("/doAJAXUpdPCountBySId")
    @ResponseBody
    public Object doAJAXUpdPCountBySId(Integer sId,Integer pCount){
        AJAXResult result = new AJAXResult();
        int db_result = shoppingService.updPCountBySId(sId,pCount);
        if(db_result == 1){
            result.setSuccess(true);
        }else{
            result.setSuccess(false);
        }
        return result;
    }

}

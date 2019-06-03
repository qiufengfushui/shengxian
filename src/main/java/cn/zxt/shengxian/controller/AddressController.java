package cn.zxt.shengxian.controller;

import cn.zxt.shengxian.pojo.AJAXResult;
import cn.zxt.shengxian.pojo.Address;
import cn.zxt.shengxian.pojo.User;
import cn.zxt.shengxian.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class AddressController {
    @Autowired
    private AddressService addressService;

    @RequestMapping("/doAJAXGetAddressByUId")
    @ResponseBody
    public Object doAJAXGetAddressByUId(HttpSession session){
        User user = (User)session.getAttribute("userSession");
        AJAXResult result = new AJAXResult();
        Address address = addressService.getAddressByUId(user.getUserId());
        String phone =  address.getPhone().substring(0,3)+"****"+address.getPhone().substring(7,11);
        address.setPhone(phone);
        result.setObject(address);
        return result;
    }
    @RequestMapping("/doAJAXUpdAddress")
    @ResponseBody
    public Object doAJAXUpdAddress(HttpSession session, String aName, String aAddress, String zipCode, String phone){
        AJAXResult result = new AJAXResult();
        User user = (User)session.getAttribute("userSession");
        Address db_address = addressService.getAddressByUId(user.getUserId());
        Address address = new Address(0,user.getUserId(),aName,zipCode,phone,aAddress,1);
        //此用户如果没有默认收货地址，就新建为默认收货地址
        int db_result = 0;
        if(db_address == null){
            //新建收货地址
            db_result = addressService.addAddress(address);
        }else{
            //修改收货地址
           db_result = addressService.updAddress(address);
        }

        if(db_result == 1){
            result.setSuccess(true);
        }else{
            result.setSuccess(false);
        }
        return result;
    }
}

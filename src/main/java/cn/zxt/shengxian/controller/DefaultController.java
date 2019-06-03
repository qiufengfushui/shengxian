package cn.zxt.shengxian.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

    @RequestMapping("/login")
    public String getLogin(){
        return "login";
    }

    @RequestMapping("/index")
    public String getIndex(){
        return "index";
    }

    @RequestMapping("/register")
    public String getRegister(){
        return "register";
    }

    @RequestMapping("/user_center_info")
    public String getUserCenterInfo(){
        return "user_center_info";
    }

    @RequestMapping("/cart")
    public String getCart(){
        return "cart";
    }

    @RequestMapping("/user_center_order")
    public String getUserCenterOrder(){
        return "user_center_order";
    }

    @RequestMapping("/user_center_site")
    public String getUserCenterSite(){
        return "user_center_site";
    }

    @RequestMapping("/place_order")
    public String getPlaceOrder(){
        return "place_order";
    }

    @RequestMapping("/detail")
    public String getDetail(){
        return "detail";
    }

    @RequestMapping("/list")
    public String getList(){
        return "list";
    }
}

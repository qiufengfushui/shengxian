package cn.zxt.shengxian.controller;

import cn.zxt.shengxian.pojo.AJAXResult;
import cn.zxt.shengxian.pojo.User;
import cn.zxt.shengxian.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/doAJAXLogin")
    @ResponseBody
    public Object doAJAXLogin(HttpSession session, String userName, String userPwd){
        AJAXResult result = new AJAXResult();
        User dbUser = userService.login(new User(0,userName,userPwd,"","",""));
        if (dbUser == null){
            result.setSuccess(false);
        }else{
            result.setSuccess(true);
            session.setAttribute("userSession",dbUser);
        }
        return result;
    }
    @RequestMapping("/doAJAXCheckEmailIsExist")
    @ResponseBody
    public Object doAJAXLCheckEmailIsExist(String userEmail){
        AJAXResult result = new AJAXResult();
        int count = userService.checkEmailIsExist(userEmail);
        if(count == 0){
            //不存在
            result.setSuccess(false);
        }else{
            //存在
            result.setSuccess(true);
        }
        return result;
    }

    @RequestMapping("/doAJAXRegister")
    @ResponseBody
    public Object doAJAXLRegister(String userName,String userPwd1,String userPwd2,String userEmail){
        AJAXResult result = new AJAXResult();
        int count = userService.register(new User(0,userName,userPwd1,userEmail));
        if(count == 1){
            result.setSuccess(true);
        }else{
            result.setSuccess(false);
        }
        return result;
    }


}

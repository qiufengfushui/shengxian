package cn.zxt.shengxian.config;

import cn.zxt.shengxian.pojo.User;
import cn.zxt.shengxian.service.UserService;
import org.springframework.data.redis.core.RedisTemplate;

import javax.annotation.Resource;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.ArrayList;
import java.util.List;

public class UserListener implements ServletContextListener {
    @Resource
    private RedisTemplate redisTemplate;

    @Resource
    private UserService userService;
    private static final String ALL_USER = "ALL_USER";
    public void contextInitialized(ServletContextEvent servletContextEvent){

        User user = new User();
        user.setUserName("admin");
        user.setUserPwd("admin");
        User user1 = userService.login(user);
        List<User> list = new ArrayList<>();
        list.set(1,user1);
        redisTemplate.delete(ALL_USER);
        redisTemplate.opsForList().leftPushAll(ALL_USER,list);

        List<User> list1 = (List<User>) redisTemplate.opsForList();
        System.out.println("缓存中目前的用户数有："+list1.size()+"人！");


    }
}

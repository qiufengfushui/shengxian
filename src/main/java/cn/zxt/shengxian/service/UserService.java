package cn.zxt.shengxian.service;

import cn.zxt.shengxian.pojo.User;

public interface UserService {
    User login(User user);

    int checkEmailIsExist(String userEmail);

    int register(User user);
}

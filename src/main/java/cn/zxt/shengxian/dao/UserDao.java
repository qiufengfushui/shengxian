package cn.zxt.shengxian.dao;

import cn.zxt.shengxian.pojo.User;

public interface UserDao {

    User getUserNameAndUserPwd(User user);

    int checkEmailIsExist(String userEmail);

    int register(User user);
}

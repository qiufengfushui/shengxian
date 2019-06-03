package cn.zxt.shengxian.service.impl;

import cn.zxt.shengxian.dao.UserDao;
import cn.zxt.shengxian.pojo.User;
import cn.zxt.shengxian.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    @Qualifier("userDao")
    private UserDao userDao;

    public User login(User user) {
        return userDao.getUserNameAndUserPwd(user);
    }

    @Override
    public int checkEmailIsExist(String userEmail) {
        return userDao.checkEmailIsExist(userEmail);
    }

    @Override
    public int register(User user) {
        return userDao.register(user);
    }
}

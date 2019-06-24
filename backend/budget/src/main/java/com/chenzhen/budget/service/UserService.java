package com.chenzhen.budget.service;

import com.chenzhen.budget.dao.UserDao;
import com.chenzhen.budget.model.User;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.UUID;

@Service
public class UserService {
    @Resource
    private UserDao userDao;

    public User findUserByName(final String name) {
        User user = userDao.findUserByName(name);
        return user;
    }

    public int registerUser(User user) {
        String salt = UUID.randomUUID().toString().replaceAll("-", "");
        ByteSource saltByteSource = ByteSource.Util.bytes(salt);
        String newPwd = new SimpleHash(user.getPwd(), saltByteSource, 1024).toHex();
        user.setSalt(salt);
        user.setPwd(newPwd);
        return userDao.registerUser(user);
    }

}

package com.chenzhen.budget.service;

import com.chenzhen.budget.model.User;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Random;

@Service
public class UserService {
    public User findUserByName(final String name) {
        User user = new User();
        user.setName(name);
        user.setNick(name+"NICK");
        user.setPwd("J/ms7qTJtqmysekuY8/v1TAS+VKqXdH5sB7ulXZOWho=");//密码明文是123456
        user.setSalt("wxKYXuTPST5SG0jMQzVPsg==");//加密密码的盐值
        user.setId(new Random().nextLong());//随机分配一个id
        user.setCreated(new Date());
        return user;
    }
}

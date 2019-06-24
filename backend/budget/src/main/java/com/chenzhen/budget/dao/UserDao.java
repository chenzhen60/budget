package com.chenzhen.budget.dao;

import com.chenzhen.budget.model.User;
import org.springframework.stereotype.Component;

@Component
public interface UserDao {

    public User findUserByName(String name);

    public int registerUser(User user);

}

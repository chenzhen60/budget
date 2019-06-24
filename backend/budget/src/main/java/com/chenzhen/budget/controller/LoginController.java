package com.chenzhen.budget.controller;

import com.chenzhen.budget.model.User;
import com.chenzhen.budget.service.UserService;
import com.chenzhen.budget.util.RestResponse;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@RestController
public class LoginController {

    @Resource
    private UserService userService;
    private Logger logger = LoggerFactory.getLogger(LoginController.class);

    @GetMapping("/login")
    public RestResponse login() {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken("aa", "123456");
        try {
            subject.login(usernamePasswordToken);
            User user = (User) subject.getPrincipal();
            if (subject.isAuthenticated()) {
                return RestResponse.ok(user);
            } else {
                return RestResponse.fail("login failed");
            }
        } catch (AuthenticationException ex) {
            return RestResponse.fail(ex.getMessage());
        }
    }


    @PostMapping("/register")
    public RestResponse register(@RequestBody User user, HttpServletRequest request) {
        try {
            if (userService.findUserByName(user.getName()) != null) {
                return RestResponse.fail("用户名重复");
            }
            userService.registerUser(user);
            user.setPwd("");
            return RestResponse.ok(user);
        } catch (Exception ex) {
            logger.error(ex.getLocalizedMessage());
            return RestResponse.fail("register error");
        }
    }


    @GetMapping("/login/hello")
    @RequiresPermissions("create")
    public String hello() {
        return "hello";
    }
}

package com.chenzhen.budget.model;

import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


@Component
public class User {
    private Long id;       // 用户id
    private String name;   // 登录名，不可改
    private String nick;    // 用户昵称，可改
    private String pwd;     // 已加密的登录密码
    private String salt;    // 加密盐值
    private Date created;   // 创建时间
    private Date updated;   // 修改时间
    private Set<String> roles = new HashSet<>();    //用户所有角色值，用于shiro做角色权限的判断
    private Set<String> perms = new HashSet<>();    //用户所有权限值，用于shiro做资源权限的判断


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", uname='" + name + '\'' +
                ", nick='" + nick + '\'' +
                ", pwd='" + pwd + '\'' +
                ", salt='" + salt + '\'' +
                ", created=" + created +
                ", updated=" + updated +
                ", roles=" + roles +
                ", perms=" + perms +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String uname) {
        this.name = uname;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public Set<String> getRoles() {
        return roles;
    }

    public void setRoles(Set<String> roles) {
        this.roles = roles;
    }

    public Set<String> getPerms() {
        return perms;
    }

    public void setPerms(Set<String> perms) {
        this.perms = perms;
    }
}
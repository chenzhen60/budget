package com.chenzhen.budget.model;

import org.springframework.stereotype.Component;

@Component
public class Role {
    private Long id;
    private String roleName;
    private String permIds;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getPermIds() {
        return permIds;
    }

    public void setPermIds(String permIds) {
        this.permIds = permIds;
    }
}

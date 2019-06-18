package com.chenzhen.budget.service;

import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class RoleService {

    public Set<String> getRolesByUserId(final long id) {
        Set<String> roles = new HashSet<>();
        roles.add("js");
        roles.add("java");
        roles.add("cpp");


        return roles;
    }
}

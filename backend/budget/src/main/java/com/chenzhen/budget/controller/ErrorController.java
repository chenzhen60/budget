package com.chenzhen.budget.controller;

import com.chenzhen.budget.util.RestResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ErrorController {

    @GetMapping("/login_err")
    public RestResponse loginError() {
        return RestResponse.fail("login error");
    }
}

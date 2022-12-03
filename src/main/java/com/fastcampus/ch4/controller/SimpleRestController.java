package com.fastcampus.ch4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SimpleRestController {

    @GetMapping("/test")
    public String test() {
        return "test";
    }
}

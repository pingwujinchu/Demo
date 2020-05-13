package com.example.demo.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author fanshuaishuai
 * @date 20-5-13 下午5:00
 */
@RestController
public class Controller {

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public Object sayHello(){
        return "Hello world!";
    }
}

package br.com.k8s.simplewebapp.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.UnknownHostException;

@RestController("/test")
public class MyController {

    @RequestMapping
    public String get() throws UnknownHostException {
        return  "Hello World " + java.net.InetAddress.getLocalHost();
    }

}

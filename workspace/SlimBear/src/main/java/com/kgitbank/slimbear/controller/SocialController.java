package com.kgitbank.slimbear.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.service.SocialService;

@Controller
public class SocialController {
	
	@Autowired
    private SocialService socialService;

    @GetMapping("/login/kakao")
    public String login() {
        try {
            String loginLink = socialService.createLoginLink();
            return "redirect:" + loginLink;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return "error";
        }
    }

    @GetMapping("/login/kakao/callback")
    public String loginCallback(@RequestParam String code) {
        try {
            String accessToken = socialService.getAccessToken(code);
            String userInfo = socialService.getUserInfo(accessToken);

            // 콘솔에 출력
            System.out.println("Access Token: " + accessToken);
            System.out.println("User Info: " + userInfo);

            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
	
	
}

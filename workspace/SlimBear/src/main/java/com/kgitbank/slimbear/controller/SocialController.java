package com.kgitbank.slimbear.controller;

import java.io.IOException;

import org.springframework.web.bind.annotation.RestController;

import com.kgitbank.slimbear.service.SocialService;
@RestController
public class SocialController {

    public static void main(String[] args) throws IOException {
        SocialService kakaoApiService = new SocialService();
        String userInfo = kakaoApiService.getUserInfo();

        if (userInfo != null) {
            System.out.println("Kakao User Info: " + userInfo);
            // 여기에서 필요한 로직을 추가하세요 (예: 사용자 정보 파싱, 로그인 처리 등)
        } else {
            System.out.println("Failed to get Kakao user info");
        }
    }
}
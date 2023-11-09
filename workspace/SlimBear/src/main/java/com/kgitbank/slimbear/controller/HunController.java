package com.kgitbank.slimbear.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.security.SecurityUser;

@Controller
public class HunController {

	@RequestMapping("member/myPage")
	public String myPage(Authentication authentication) {

		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
		return "mypage";
	}
}

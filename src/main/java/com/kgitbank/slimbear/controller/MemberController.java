package com.kgitbank.slimbear.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;

	@RequestMapping("login")
	public String login(){
		memberService.login(null, null);
		return "home";
	}
}

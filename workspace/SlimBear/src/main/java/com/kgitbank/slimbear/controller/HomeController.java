package com.kgitbank.slimbear.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kgitbank.slimbear.service.MemberServiceImpl;

@Controller
public class HomeController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@GetMapping("home")
	public void home() {	
	}
}

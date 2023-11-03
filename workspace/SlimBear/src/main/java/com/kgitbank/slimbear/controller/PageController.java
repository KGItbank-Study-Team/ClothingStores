package com.kgitbank.slimbear.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.service.MemberServiceImpl;

@Controller
public class PageController {
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping("home")
	public String homePage() {
		service.login(null, null);
		return "home";
	}

	@RequestMapping("cateagory")
	public String categoryPage() {
		return "home";
	}
	
	@RequestMapping("product")
	public String productPage() {
		return "home";
	}

}

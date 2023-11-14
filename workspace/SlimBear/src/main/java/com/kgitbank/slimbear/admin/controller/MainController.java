package com.kgitbank.slimbear.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/home")
	public String homePage() {
		return "index";
	}
	
	@RequestMapping("/loginPage")
	public String loginPage() {
		return "login";
	}
}

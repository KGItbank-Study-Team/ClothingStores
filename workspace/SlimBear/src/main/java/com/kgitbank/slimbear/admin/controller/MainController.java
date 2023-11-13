package com.kgitbank.slimbear.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/admin")
	public String homePage() {
		return "index";
	}
	
}

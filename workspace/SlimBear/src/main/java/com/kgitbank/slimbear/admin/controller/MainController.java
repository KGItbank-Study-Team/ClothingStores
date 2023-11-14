package com.kgitbank.slimbear.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	@RequestMapping("/auth")
	public String homePage(@RequestParam(required = false) String error, HttpServletRequest request) {
		
		if(error != null) {
			request.setAttribute("error", error);
		}
		
		return "login";
	}
	
	@RequestMapping("/home")
	public String homePage() {

		return "index";
	}
	
}

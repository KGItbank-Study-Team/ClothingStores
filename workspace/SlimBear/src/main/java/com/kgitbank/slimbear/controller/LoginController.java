package com.kgitbank.slimbear.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
	
	@PostMapping("auth/login")
	public String login() {
		return null;
	}
}

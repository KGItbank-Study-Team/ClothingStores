package com.kgitbank.slimbear.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.service.ProductServiceImpl;

@Controller
public class PageController {
	
	@Autowired
	private ProductServiceImpl productService;

	@RequestMapping("main")
	public String mainePage(HttpSession session, Model model) {

		 model.addAttribute("hotProductList", productService.getHotProductList());
		
		return "main";
	}

	@RequestMapping("login")
	public String loginPage(HttpServletRequest request) {
		return "login";
	}
	
	@RequestMapping("join")
	public String joinPage(HttpServletRequest request) {
		return "join";
	}
}

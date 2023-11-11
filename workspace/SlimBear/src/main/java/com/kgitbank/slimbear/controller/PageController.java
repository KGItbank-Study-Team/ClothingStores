package com.kgitbank.slimbear.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.service.PageConfigService;
import com.kgitbank.slimbear.service.ProductServiceImpl;

@Controller
public class PageController {

	@Autowired
	private PageConfigService pageConfigService;
	
	@Autowired
	private ProductServiceImpl productService;

	@RequestMapping("main")
	public String mainePage(HttpSession session, Model model) {

		model.addAttribute("productBannerTop", pageConfigService.getProductBannerTop());
		model.addAttribute("hotProductList", productService.getHotProductList());
		
		return "main";
	}

	@RequestMapping("login")
	public String loginPage(@RequestParam(required = false) String error, HttpServletRequest request) {
		
		if(error != null) {
			request.setAttribute("error", "error");
		}
		
		return "login";
	}
	
	@RequestMapping("join")
	public String joinPage(HttpServletRequest request) {
		return "join";
	}
}

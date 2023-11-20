package com.kgitbank.slimbear.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.service.PageConfigServiceImpl;
import com.kgitbank.slimbear.service.ProductServiceImpl;

@Controller
public class PageController {

	@Autowired
	private PageConfigServiceImpl pageConfigService;

	@Autowired
	private ProductServiceImpl productService;

	@RequestMapping("main")
	public String mainePage(Model model) {

		model.addAttribute("productBannerTop", pageConfigService.getProductBannerTop());
		model.addAttribute("hotProductList", productService.getHotProductList());

		return "main";
	}

	@RequestMapping("login")
	public String loginPage(@RequestParam(required = false) String error, HttpServletRequest request) {

		if (error != null) {
			request.setAttribute("error", "error");
		}

		return "login";
	}

	@RequestMapping("login/success")
	public String loginSuccessPage(Authentication authentication, HttpServletRequest request) {

		if (authentication.getAuthorities().contains(AuthorityUtils.createAuthorityList("ADMIN").get(0))) {
			return "redirect:/admin/home";
		}else {
			return "redirect:/";
		}
	}

	@RequestMapping("join")
	public String joinPage(HttpServletRequest request) {
		return "join";
	}
}

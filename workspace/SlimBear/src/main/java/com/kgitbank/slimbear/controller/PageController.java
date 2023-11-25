package com.kgitbank.slimbear.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.common.SlimBearEnum.MEMBER_TYPE;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.service.MemberService;
import com.kgitbank.slimbear.service.PageConfigServiceImpl;
import com.kgitbank.slimbear.service.ProductServiceImpl;

@Controller
public class PageController {

	@Autowired
	private PageConfigServiceImpl pageConfigService;

	@Autowired
	private ProductServiceImpl productService;
	
	@Autowired 
	private MemberService memberService;

	@RequestMapping("main")
	public String mainePage(Model model) {

		model.addAttribute("productBannerTop", pageConfigService.getProductBannerTop());
		model.addAttribute("hotProductList", productService.getHotProductList());

		return "main";
	}

	@RequestMapping("login")
	public String loginPage(@RequestParam(required = false) String id, @RequestParam(required = false) String pwd, @RequestParam(required = false) String error, HttpServletRequest request) {

		if (error != null) {
			request.setAttribute("error", "error");
		}
		
		if(id != null && pwd != null) {
			request.setAttribute("id", id);
			request.setAttribute("pwd", pwd);
		}
		
		return "login";
	}
	
	@RequestMapping("slimbear/login")
	public String slimbearLogin(String id, String pwd, HttpServletRequest request) {
	
		MemberDTO member = memberService.getMemberById(id);
		if(member == null) {
			// 회원아님
			return "redirect:/app/login";
		}
		
		if(member.getLogin_type().equals(MEMBER_TYPE.SLIMBEAR.toString())) {
    		// 로그인
			request.setAttribute("id", id);
			request.setAttribute("pwd", pwd);
			
			return "redirect:/app/login";
    	}else {
    		// 다른 로그인타입으로 사용중
    		return "redirect:/app/login";
    	}
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

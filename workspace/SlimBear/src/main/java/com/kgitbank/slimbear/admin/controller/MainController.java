package com.kgitbank.slimbear.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("home")
	public String homePage() {
		return "index";
	}
	
	@RequestMapping("home/board/member")
	public String boardMember(Model model) {

		model.addAttribute("memberList", memberService.getMemberList());
	
		return "tables-member";
	}

	@RequestMapping("home/board/product")
	public String boardProduct() {
		return "tables-product";
	}
	
	@RequestMapping("home/member")
	public String memberPage() {
		return "tables-product";
	}
}

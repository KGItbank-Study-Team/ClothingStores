package com.kgitbank.slimbear.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.security.SecurityUser;
import com.kgitbank.slimbear.service.MemberServiceImpl;


@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("join")
	public String join(MemberDTO member) {
		
		if(memberService.join(member)) {
			System.out.println("가입 성공");
			return "redirect:/";
		}else {
			System.out.println("가입 실패");
			return "redirect:/app/join";
		}
	}

}

package com.kgitbank.slimbear.controller;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.service.MemberServiceImpl;


@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("join")
	public String join(MemberDTO member) {
		
		member.setReg_date(new Date(System.currentTimeMillis()));
		
		if(memberService.join(member)) {
			
			return "redirect:/";
		}else {
		
			return "redirect:/app/join";
		}
	}

}

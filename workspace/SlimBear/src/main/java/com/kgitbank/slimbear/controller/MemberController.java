package com.kgitbank.slimbear.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.common.SlimBearEnum.MEMBER_TYPE;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.service.MemberService;


@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("join")
	public String join(MemberDTO member) {
		
		member.setStatus(MEMBER_TYPE.SLIMBEAR.toString());

		if(memberService.join(member)) {
			
			return "redirect:/";
		}else {
		
			return "redirect:/app/join";
		}
	}
	
}

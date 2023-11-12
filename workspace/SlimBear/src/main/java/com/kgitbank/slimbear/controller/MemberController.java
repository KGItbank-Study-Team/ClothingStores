package com.kgitbank.slimbear.controller;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.service.MemberService;


@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("join")
	public String join(MemberDTO member){
		
		member.setReg_date(new Date(System.currentTimeMillis()));
		
		try {
			if(memberService.join(member)) {
				return "redirect:/";
			}else {
			
				return "redirect:/app/join";
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/app/join";
	}

}

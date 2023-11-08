package com.kgitbank.slimbear.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.service.MemberServiceImpl;
import com.kgitbank.slimbear.service.MemberServiceImpl.ELoginResult;


@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;

	@RequestMapping("login")
	public String login(MemberDTO member,  HttpServletRequest request,  HttpSession session, Model model) {
			
		ELoginResult result =  memberService.login(member.getId(), member.getPassword());

		switch(result) {
			case SUCCESS:
				member = memberService.getMemberById(member.getId());
				session.setAttribute("member", member);

				return "redirect:/";
			case NOT_FOUNT_ID:
				
				break;
			case FAILED_PASSWORD:
				
				break;
		}
		
		model.addAttribute("error", result.ordinal());
		
		
		return "redirect:/app/login";
	}
	
	@RequestMapping("join")
	public String join(MemberDTO member, HttpSession session, Model model) {
		
		if(memberService.join(member)) {
			System.out.println("가입 성공");
			return "redirect:/";
		}else {
			System.out.println("가입 실패");
			return "redirect:/app/join";
		}
	}

	@RequestMapping("myPage")
	public String myPage() {
		return "mypage";
	}
}

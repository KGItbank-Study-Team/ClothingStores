package com.kgitbank.slimbear.controller;


import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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

		// �ӽõ����� =============================
		member.setSex('F');
		member.setAddress("����õ�������¼����¼��");
		member.setName("�Ȼ���");
		member.setEmail("milgos@naver.com");
		member.setReg_date(new Date(System.currentTimeMillis()));
		// ========================================
		
		if(memberService.join(member)) {
			System.out.println("���� ����");
		}else {
			System.out.println("���� ����");
		}
		
		// �α����� ���������� ������
		return "redirect:/app/login";
	}
	
}

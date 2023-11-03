package com.kgitbank.slimbear.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.dto.MemberDTO;

@Controller
@RequestMapping("product")
public class ProductController {
		
	@RequestMapping("list")
	@ResponseBody
	public MemberDTO getProductList(MemberDTO dto) {
		dto.setEmail("¾È¤¤³ç");
		System.out.println(dto.toString());
		return dto;
	}
}

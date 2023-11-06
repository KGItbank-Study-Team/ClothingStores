package com.kgitbank.slimbear.controller;


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
		dto.setEmail("gd");
		System.out.println(dto.toString());
		return dto;
	}
}

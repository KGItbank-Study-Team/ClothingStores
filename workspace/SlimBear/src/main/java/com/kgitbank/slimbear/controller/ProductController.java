package com.kgitbank.slimbear.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.service.ProductServiceImpl;

@Controller
@RequestMapping("product")
public class ProductController {
	
	@Autowired
	private ProductServiceImpl productService;
		
	@RequestMapping("")
	public String productPage(@RequestParam("p")long productUid) {
		
		
		return "productInfo";
	}
}

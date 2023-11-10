package com.kgitbank.slimbear.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.service.ProductServiceImpl;

@Controller
@RequestMapping("product")
public class ProductController {
	
	@Autowired
	private ProductServiceImpl productService;
		
	@RequestMapping("")
	public String productPage(@RequestParam("p")long productUid, Model model) {
		
		ProductDTO product = productService.getProductByUid(productUid);
		
		
		// 잘못된 UID일 경우 메인페이지로
		if(product == null) {
			return "redirct:/";
		}
		
		model.addAttribute("product", product);
		
		return "productInfo";
	}
}

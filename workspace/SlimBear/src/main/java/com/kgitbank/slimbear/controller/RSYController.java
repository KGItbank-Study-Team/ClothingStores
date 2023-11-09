package com.kgitbank.slimbear.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.service.RSYServiceImpl;

@Controller
public class RSYController {
	@Autowired
	private RSYServiceImpl RSYService;

	@RequestMapping("product/category")
	public String categoryPage(@RequestParam int category, Model model) {
		List<ProductDTO>list= RSYService.getProductListByCategory(category);
		
		model.addAttribute("productList", list);
		System.out.println(list);
		return "category";
		
	}
}

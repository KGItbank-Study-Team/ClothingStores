package com.kgitbank.slimbear.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.service.RSYServiceImpl;

@Controller
public class RSYController {
	@Autowired
	private RSYServiceImpl RSYService;

	@RequestMapping("product/category")
	public String categoryPage01(@RequestParam int category, @RequestParam(name = "order", required = false) String order, Model model) {
		List<ProductDTO> productList = RSYService.getProductListByCategory(category, order);

		model.addAttribute("productList", productList);

		List<CategoryDTO> categoryList = RSYService.getSubCategoryListByTopCtgUid(category);

		model.addAttribute("categoryList", categoryList);

		CategoryDTO topCategory = RSYService.getCategoryByUid(category);
		model.addAttribute("category", topCategory);
		
		
		
		System.out.println(categoryList);
		return "category";


	}
}

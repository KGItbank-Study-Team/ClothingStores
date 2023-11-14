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
	public String categoryPage01(@RequestParam long category,
			@RequestParam(name = "order", required = false) String order, @RequestParam(name = "currentPage", defaultValue = "1", required = false) int currentPage, Integer offset, Integer pageSize, Model model) {
		
		if(offset==null) {offset=0;}
		pageSize = 10; // 페이지 당 아이템 수
		
		

		// 페이징에 관련된 정보 추가
		int totalItems = RSYService.getTotalItems(category); // 전체아이템 수
		int totalPages = (int) Math.ceil( (double)totalItems / pageSize); // 전체 페이지 수
		
		List<ProductDTO> productList = RSYService.getProductListByCategory(category, order,currentPage, offset, pageSize);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("productList", productList);

		List<CategoryDTO> categoryList = RSYService.getSubCategoryListByTopCtgUid(category);

		model.addAttribute("categoryList", categoryList);

		CategoryDTO topCategory = RSYService.getCategoryByUid(category);
		model.addAttribute("category", topCategory);

		System.out.println(categoryList);
		return "category";

	}
}

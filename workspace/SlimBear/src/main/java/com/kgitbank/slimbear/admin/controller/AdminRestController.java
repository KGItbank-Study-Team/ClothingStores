package com.kgitbank.slimbear.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kgitbank.slimbear.admin.service.AdminService;
import com.kgitbank.slimbear.dao.CategoryDAO;
import com.kgitbank.slimbear.dto.CategoryDTO;

@RestController
public class AdminRestController {

	@Autowired
	private CategoryDAO categoryService;

	@PostMapping("category/childs")
	public List<CategoryDTO> getCategory(@RequestParam("ctg") long ctg) {
		
		List<CategoryDTO> categoryList = categoryService.getSubCategoryListByTopCtgUid(ctg);
		
		return categoryList;
	}
}

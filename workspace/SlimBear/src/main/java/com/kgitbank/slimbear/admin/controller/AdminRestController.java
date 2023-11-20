package com.kgitbank.slimbear.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kgitbank.slimbear.admin.service.AdminServiceImpl;
import com.kgitbank.slimbear.dao.CategoryDAO;
import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;

@RestController
public class AdminRestController {

	@Autowired
	private CategoryDAO categoryService;
	
	@Autowired
	private AdminServiceImpl adminService;

	@PostMapping("category/childs")
	public List<CategoryDTO> getCategory(@RequestParam("ctg") long ctg) {
		
		List<CategoryDTO> categoryList = categoryService.getSubCategoryListByTopCtgUid(ctg);
		
		return categoryList;
	}
	

	@PostMapping("add/product/detail")
	public String addProductDetail(ProductDetailDTO detail) {
	
		adminService.addProductDetail(detail);
		
		return "Success";
	}
	
	@PostMapping("update/product/detail")
	public String updateProductDetail(ProductDetailDTO detail) {
		adminService.updateProductDetail(detail);
		return "Success";
	}
	
	@PostMapping("delete/product/detail")
	public String deleteProductDetail(ProductDetailDTO detail) {
		adminService.deleteProductDetail(detail);
		return "Success";
	}
}

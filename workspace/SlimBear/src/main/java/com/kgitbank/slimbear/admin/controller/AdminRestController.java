package com.kgitbank.slimbear.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kgitbank.slimbear.admin.dto.OrderListDTO;
import com.kgitbank.slimbear.admin.service.AdminServiceImpl;
import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.service.RSYServiceImpl;

@RestController
public class AdminRestController {

	@Autowired
	private RSYServiceImpl rsyService;

	@Autowired
	private AdminServiceImpl adminService;

	@PostMapping("category/childs")
	public List<CategoryDTO> getCategory(@RequestParam("ctg") long ctg) {
		
		List<CategoryDTO> categoryList = rsyService.getSubCategoryListByTopCtgUid(ctg);
		
		return categoryList;
	}
	
	@GetMapping("order/list")
	public List<OrderListDTO> getOrderList(){
		
		List<OrderListDTO> orderList = adminService.getOrderInfos();

		return orderList;
	}
	
	@GetMapping("order/detail")
	public OrderListDTO getOrderProductDetailList(@RequestParam(name="order_uid" , required=false) Long order_uid){
		OrderListDTO order = null;
		if(order_uid != null) {
			order = adminService.getOrderDetailInfos(order_uid);
		}
		return 	order;
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

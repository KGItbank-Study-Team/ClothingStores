package com.kgitbank.slimbear.admin.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kgitbank.slimbear.admin.dto.OrderListDTO;
import com.kgitbank.slimbear.admin.dto.StatisticsCategoryDTO;
import com.kgitbank.slimbear.admin.dto.StatisticsMemberDTO;
import com.kgitbank.slimbear.admin.dto.StatisticsOrderDTO;
import com.kgitbank.slimbear.admin.service.AdminServiceImpl;
import com.kgitbank.slimbear.admin.service.StatisticsServiceImpl;
import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.exception.SlimBearException;
import com.kgitbank.slimbear.service.OrderService;
import com.kgitbank.slimbear.service.ProductService;

@RestController
public class AdminRestController {

	@Autowired
	private ProductService productService;

	@Autowired
	private AdminServiceImpl adminService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private StatisticsServiceImpl statisticsService;

	@PostMapping("category/childs")
	public List<CategoryDTO> getCategory(@RequestParam("ctg") long ctg) {
		List<CategoryDTO> categoryList = productService.getSubCategoryListByTopCtgUid(ctg);
		
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
	
	
	@PostMapping("order/cancel")
	public HashMap<String, String> orderCancel(Long orderUID, String reason){
		HashMap<String, String> res = new HashMap<String, String>();
		
		try {
			orderService.orderCancel(orderUID, reason);
			res.put("success", "취소 완료");
		}catch(SlimBearException e) {
			res.put("failed", "취소 실패");
		}catch(Exception e) {
			res.put("failed", "취소 실패");
		}
		
		return res;
	}
	
	@PostMapping("order/return")
	public HashMap<String, String> orderReturn(Long orderUID, String reason){
		HashMap<String, String> res = new HashMap<String, String>();
		
		try {
			orderService.orderReturn(orderUID, reason);
			res.put("success", "반품 완료");
		}catch(SlimBearException e) {
			res.put("failed", "반품 실패");
		}catch(Exception e) {
			res.put("failed", "반품 실패");
		}
		
		return res;
	}
	
	@PostMapping("order/status")
	public HashMap<String, String> orderStatusChange(Long orderUID, String status){
		HashMap<String, String> res = new HashMap<String, String>();
		
		try {
			orderService.orderStatusChange(orderUID,status);
			res.put("success", "상대 변경 완료");
		}catch(SlimBearException e) {
			res.put("failed", "상대 변경 실패");
		}catch(Exception e) {
			res.put("failed", "상대 변경 실패");
		}
		
		return res;
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
	
	// 통계
	@RequestMapping("stat/orders/year")
	public HashMap<Integer, StatisticsOrderDTO> getCurrentYearOrderList() {
		return statisticsService.getYearOrderList(Calendar.getInstance().get(Calendar.YEAR));
	}
	
	@RequestMapping("stat/orders/category/year")
	public List<StatisticsCategoryDTO> getOrderCategoryStatistics() {
		return statisticsService.getOrderCategoryStatistics(Calendar.getInstance().get(Calendar.YEAR));
	}
	
	@RequestMapping("stat/members/year")
	public HashMap<Integer, StatisticsMemberDTO> getMemberStatistics() {
		return statisticsService.getYearMemberList(Calendar.getInstance().get(Calendar.YEAR));
	}
	
	@RequestMapping("stat/members/type/year")
	public List<StatisticsMemberDTO> getMemberTypeStatistics() {
		return statisticsService.getYearMemberListType(Calendar.getInstance().get(Calendar.YEAR));
	}
	
	@RequestMapping("stat/orders/type/year")
	public HashMap<Integer, StatisticsOrderDTO> getCurrentYearOrderListStatus(@RequestParam(required=false) String status) {
		return statisticsService.getYearOrderListType(Calendar.getInstance().get(Calendar.YEAR), status);
	}
}

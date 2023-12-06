package com.kgitbank.slimbear.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.common.SlimBearEnum;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.OrderDTO;
import com.kgitbank.slimbear.dto.OrderPaymentDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.exception.SlimBearException;
import com.kgitbank.slimbear.security.SecurityUser;
import com.kgitbank.slimbear.service.HunServiceImpl;
import com.kgitbank.slimbear.service.MemberService;
import com.kgitbank.slimbear.service.OrderService;
import com.kgitbank.slimbear.service.ProductServiceImpl;
import com.kgitbank.slimbear.vo.AddrVO;
import com.kgitbank.slimbear.vo.CouponVO;
import com.kgitbank.slimbear.vo.MemberCartVO;
import com.kgitbank.slimbear.vo.OrderProductVO;
import com.kgitbank.slimbear.vo.OrderVO;
import com.kgitbank.slimbear.vo.command.OrderProductCommand;

@Controller
@RequestMapping("order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HunServiceImpl hunService;
	
	@Autowired
	private ProductServiceImpl prodService;

	
	@RequestMapping("product") 
	public String orderPage(HttpSession session, OrderProductCommand orderProducts, Authentication authentication) 
	{ 
		System.out.println(orderProducts.getOptionsList());
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		
		MemberDTO mem = memberService.getMemberById(user.getUsername());
		List<AddrVO> addressInfo = hunService.getAddrInfo(mem.getUid());
		
		int totalProduct = 0;
		int deliveryPrice = 2500;
		int paymonetAmount = 0;
		OrderVO orderInfo = new OrderVO();

		List<MemberCartVO> productList = new ArrayList<MemberCartVO>(); 
		for(int i=0; i<orderProducts.getOptionsList().size(); ++i) {
		    OrderProductVO orderProduct = orderProducts.getOptionsList().get(i);
			ProductDTO product = prodService.getProductByUid(orderProduct.getProd_Uid());
			
			if(orderInfo.getProductName() == null) {
				orderInfo.setProductName(product.getName() + " " + orderProduct.getColor() + "/" + orderProduct.getSize());
			}
			
			MemberCartVO vo = new MemberCartVO();
			vo.setProductUid(product.getUid());
			vo.setName(product.getName());
			vo.setColor(orderProduct.getColor());
			vo.setSize(orderProduct.getSize());
			vo.setPrice(product.getPrice());
			vo.setMileage(product.getAddi_mileage());
			vo.setMaybeprice(product.getPrice() - product.getSale_price());
			vo.setMain_image(product.getMain_image());
			vo.setCnt(orderProduct.getCnt());
			productList.add(vo);
			
			
			totalProduct += vo.getMaybeprice() * vo.getCnt();
		}
		
		if(orderProducts.getOptionsList().size() > 1 ) {
			orderInfo.setProductName(orderInfo.getProductName().concat(" 외 " + (orderProducts.getOptionsList().size()-1) + "개의 상품"));
		}
		
		if(totalProduct > 50000) {
			deliveryPrice = 0;
		}
		paymonetAmount  = deliveryPrice + totalProduct;
		
		
		
		orderInfo.setUid(mem.getUid());
		orderInfo.setName( mem.getName());
		orderInfo.setEmail(mem.getEmail());
		orderInfo.setPhone(mem.getPhone());
		orderInfo.setMileage( mem.getMileage());
		orderInfo.setAddressInfo(addressInfo);
		orderInfo.setProductList(productList);
		orderInfo.setCouponeList( hunService.getCouponListInfo(user.getUid()));
		orderInfo.setTotalProduct(totalProduct);
		orderInfo.setDeliveryPrice( deliveryPrice);
		orderInfo.setPaymonetAmount(paymonetAmount);
		
		session.setAttribute("order", orderInfo);
		
		return "order";
	 }
	
	@PostMapping("mileage/apply")
	@ResponseBody
	public HashMap<String, String> applyMileage(@RequestParam int mileage, HttpSession session, Authentication authentication) {
		HashMap<String, String> response = new HashMap<String, String>();
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		
		MemberDTO mem = memberService.getMemberById(user.getUsername());
		
		if(mileage > 3000) {
			response.put("failed", "3000마일리지 이상 사용하 실 수 없습니다."); 
			return response;
		}
		
		if(mem.getMileage() < mileage) {
			response.put("failed", "보유한 마일리지 보다 많이 사용할 없습니다."); 
			return response;
		}
		
		OrderVO orderInfo = (OrderVO)session.getAttribute("order");
		orderInfo.setApplyMileage(mileage);
		session.setAttribute("order", orderInfo);
	

		response.put("paymentAmount", "" + (orderInfo.getPaymonetAmount() - 	orderInfo.getCouponSaleAmount() - orderInfo.getApplyMileage()));
		response.put("success", "적용완료"); 
		return response;
	}
	
	@PostMapping("coupon/apply")
	@ResponseBody
	public HashMap<String, String> applyCoupon(HttpSession session, Authentication authentication, long couponUID) {
		HashMap<String, String> response = new HashMap<String, String>();
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		
		OrderVO orderInfo = (OrderVO)session.getAttribute("order");
		if(couponUID == 0) {
			orderInfo.setApplyCouponUID(0);
			orderInfo.setCouponSaleAmount(0);
			response.put("default","1");
		}
		else {
			for(int i=0; i<orderInfo.getCouponeList().size(); ++i) {
				CouponVO coupon = orderInfo.getCouponeList().get(i);
	
				System.out.println(coupon);
				if(coupon.getCoup_uid() == couponUID) {
					if(orderInfo.getPaymonetAmount() < coupon.getMinimumAmount()) {
						response.put("failed", coupon.getMinimumAmount()  + "원 이상일경우 사용가능");
						return response;
					}
					
					orderInfo.setApplyCouponUID(couponUID);
					if(coupon.getType().equals(SlimBearEnum.COUPONE_TYPE.PRICE.toString())) {
						orderInfo.setCouponSaleAmount(coupon.getValue());
					}
					else {
						orderInfo.setCouponSaleAmount(Math.round((orderInfo.getPaymonetAmount() * (coupon.getValue() * 0.01f))));
					}
					break;
				}
			}
		}
		
		response.put("paymentAmount", "" + (orderInfo.getPaymonetAmount() - orderInfo.getCouponSaleAmount() - orderInfo.getApplyMileage()));
		session.setAttribute("order", orderInfo);
		return response;
	}

	@PostMapping("product/payment")
	@ResponseBody
	public HashMap<String, String> orderProduct(Authentication authentication, String imp_uid, OrderDTO order, OrderPaymentDTO payment, HttpSession session){

		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		OrderVO orderInfo = (OrderVO)session.getAttribute("order");
		
		order.setMem_uid(orderInfo.getUid());
		order.setOrder_date(new Date(System.currentTimeMillis()));
		order.setStatus(SlimBearEnum.ORDER_STATUS.STAY.toString());
		order.setTotal_price(orderInfo.getTotalProduct());
		order.setDeliv_price(orderInfo.getDeliveryPrice());
		order.setAddisale_price(orderInfo.getCouponSaleAmount());
		order.setUse_mileage(orderInfo.getApplyMileage());
		
		payment.setPay_date(order.getOrder_date());
		payment.setStatus(SlimBearEnum.PAYMENT_STATUS.DONE.toString());
	
		orderService.productOrder(user.getUid(), imp_uid, order, payment, orderInfo.getProductList(), orderInfo.getApplyCouponUID());

		HashMap<String, String> res = new HashMap<String, String>();
		res.put("url", "/app/member/myPage/orderList");
		return res;
	}
	
	@PostMapping("cancel")
	@ResponseBody
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
	
	@PostMapping("return")
	@ResponseBody
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
}

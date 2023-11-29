package com.kgitbank.slimbear.controller;


import java.io.IOException;
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
import com.kgitbank.slimbear.dto.OrderDetailDTO;
import com.kgitbank.slimbear.dto.OrderPaymentDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
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
import com.siot.IamportRestClient.exception.IamportResponseException;

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

		List<MemberCartVO> productList = new ArrayList<MemberCartVO>(); 
		for(int i=0; i<orderProducts.getOptionsList().size(); ++i) {
		    OrderProductVO orderProduct = orderProducts.getOptionsList().get(i);
			ProductDTO product = prodService.getProductByUid(orderProduct.getProd_Uid());
			
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
		
		if(totalProduct > 50000) {
			deliveryPrice = 0;
		}
		paymonetAmount  = deliveryPrice + totalProduct;
		
		OrderVO orderInfo = new OrderVO();;
		
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
			return response;
		}
		else {
			for(int i=0; i<orderInfo.getCouponeList().size(); ++i) {
				CouponVO coupon = orderInfo.getCouponeList().get(i);
				if(coupon.getCoup_uid() == couponUID) {
					orderInfo.setApplyCouponUID(couponUID);
					if(coupon.getType().equals(SlimBearEnum.COUPONE_TYPE.PRICE.toString())) {
						orderInfo.setCouponSaleAmount(coupon.getValue());
					}
					else {
						orderInfo.setCouponSaleAmount((int)(orderInfo.getPaymonetAmount() * (coupon.getValue() * 0.01f)));
					}
					return response;
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
	
		orderService.productOrder(user.getUid(), imp_uid, order, payment, orderInfo.getProductList());

		HashMap<String, String> res = new HashMap<String, String>();
		res.put("url", "/app/member/myPage/orderList");
		return res;
	}

}

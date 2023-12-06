package com.kgitbank.slimbear.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderVO {
	private long uid;
	private String name;
	private String email;
	private String phone;
	private int mileage;
	private int totalProduct;
	private int deliveryPrice;
	private int paymonetAmount;
	private int applyMileage;	
	private int couponSaleAmount;
	private long applyCouponUID;
	private String productName;
	private Date orderDate;
	private String status;
	private String code;
	
	private String recipient;
	private String recipient_tel;
	private String recipient_address;
	private String order_request;
	private String payment_info;
	
	List<AddrVO> addressInfo;
	List<MemberCartVO> productList;
	List<CouponVO> couponeList;
}

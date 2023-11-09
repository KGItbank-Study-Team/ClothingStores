package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponVO {
	private int couponNumber;
	private String couponName;
	private String couponProduct;
	private int productPrice;
	private String payMethod;
	private String couponBenefit;
	private String couponPeriod;
}

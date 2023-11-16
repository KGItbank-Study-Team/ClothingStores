package com.kgitbank.slimbear.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponVO {
	private long couponNumber;		//쿠폰번호
	private String couponName;		//쿠폰이름
	private String couponProduct;	//쿠폰적용상품
	private int minimumAmount;		//최소구매금액
	private String payMethod;		//결제수단
	private String couponBenefit;	//쿠폰혜택
	private Date couponPeriod;		//쿠폰사용기간
}

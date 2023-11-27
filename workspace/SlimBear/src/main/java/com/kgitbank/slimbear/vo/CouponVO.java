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
	private int minimumAmount;		//최소구매금액
	private String couponBenefit;	//쿠폰혜택
	private Date couponPeriod;		//쿠폰사용기간
	
	private int value;
	private String type;
	private long coup_uid;			//멤쿠
}

//쿠폰 uid가 제대로 안들어간다
//type 하고 value 값도 넣을수있게
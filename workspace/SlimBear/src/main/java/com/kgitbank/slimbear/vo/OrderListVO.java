package com.kgitbank.slimbear.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderListVO {
	
	private Date orderDate;			//주문일자.
	private String orderStatus;		//주문처리상태.
	private String orderImage;		//주문상품 사진
	private String orderName;		//상품 정보(이름)
	private int orderAmount;		//상품 가격
	private int orderCount;			//상품 주문수량

}
	
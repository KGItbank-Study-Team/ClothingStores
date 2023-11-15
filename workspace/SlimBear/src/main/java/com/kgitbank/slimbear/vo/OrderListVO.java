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
	private int orderNum;			//주문번호.
	private String productImage;	//상품이미지.
	private String productName;		//상품정보.
	private String productOption;	//상품옵션.
	private int orderCount;			//주문수량.
	private int orderAmount;		//주문금액.
	private String orderStatus;		//주문처리상태.
	private String fluctuation; 	//취소, 교환, 반품
}
	
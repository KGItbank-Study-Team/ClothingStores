package com.kgitbank.slimbear.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderListVO {
	private Date orderDate;
	private int orderNum;
	private String productImage;
	private String productName;
	private String productOption;
	private int orderCount;		//주문 수량
	private int orderAmount;	//주문 금액
	private String orderStauts;	//상태
	private String fluctuation; //취소, 교환, 반품
}
	
package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderListVO {
	private String orderDate;
	private int orderNum;
	private String productImage;
	private String productName;
	private String productOption;
	private int orderCount;
	private int orderAmount;
	private String orderStauts;
	private String fluctuation;
	private int finalMoney;
}
	
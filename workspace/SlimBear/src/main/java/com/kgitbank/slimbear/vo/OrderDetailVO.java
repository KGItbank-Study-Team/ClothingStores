package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDetailVO {

	private String productImage;	//상품이미지.
	private String productName;		//상품정보.
	private String productOption;	//상품옵션.
	private int orderCount;			//주문수량.
	
}

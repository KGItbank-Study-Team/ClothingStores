package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WishlistVO {
	private String productURL;
	private String productImage;
	private String productName;
	private int orderAmount;
	private int orderDiscount;
}

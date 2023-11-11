package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MemberCartVO {
	
	private long uid;
	private int price;
	private int addprice;
	private String desc;
	private String infoo;
	private int totalprice;
	private int maybeprice;
	private int baedalprice;
	private int quantity;
	private int productId;
	
}

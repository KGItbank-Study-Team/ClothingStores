package com.kgitbank.slimbear.vo;

import lombok.Data;

@Data
public class OrderProductVO {
	
	private long prod_uid;
	private String color;
	private String size;
	private int cnt;
	
	public OrderProductVO() {}
	
	public OrderProductVO(long prod_uid, String color, String size, int cnt) {
		super();
		this.prod_uid = prod_uid;
		this.color = color;
		this.size = size;
		this.cnt = cnt;
	}

}

package com.kgitbank.slimbear.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDetailDTO {
	
	private long order_uid;
	private String prod_code;
	private int cnt;
	private Integer review_uid; 
	private long total_price;
}

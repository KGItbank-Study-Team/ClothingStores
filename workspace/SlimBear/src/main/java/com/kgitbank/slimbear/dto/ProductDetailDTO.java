package com.kgitbank.slimbear.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class ProductDetailDTO {
	
	private long prod_uid;
	private String color;
	private String size;
	private int cnt;
	private Long review_uid;
}

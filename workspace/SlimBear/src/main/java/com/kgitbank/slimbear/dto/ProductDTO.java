package com.kgitbank.slimbear.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDTO {
	private long uid;
	private long ctg_uid;
	private String name;
	private String desc;
	private int price;
	private String maker;
}

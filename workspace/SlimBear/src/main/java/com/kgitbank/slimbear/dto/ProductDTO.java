package com.kgitbank.slimbear.dto;

import java.util.Date;

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
	private String main_image;
	private String main_image2;
	private String order;
	private Date reg_date;
	private Integer sale_price;
	private Integer addi_mileage;
	private String detail_image;
}

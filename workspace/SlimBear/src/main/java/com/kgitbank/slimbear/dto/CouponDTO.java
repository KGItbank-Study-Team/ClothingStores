package com.kgitbank.slimbear.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CouponDTO {
	
	private long uid;
	private String name;
	private String type;
	private int value;
	private int expi_days;
	private int price;
	
}

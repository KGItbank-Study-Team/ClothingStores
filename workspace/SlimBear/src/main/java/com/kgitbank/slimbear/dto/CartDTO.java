package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CartDTO {
	
	private long uid;
	private int mem_uid;
	private String prod_code;
	private int cnt;
	private Date reg_date;
}

package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDTO {
	
	private long uid;
	private String code;
	private long mem_uid;
	private Date order_date;
	private String status;
	private int total_price;
	private Integer deliv_price;
	private Integer addisale_price;
	private String order_request;
	private Integer use_mileage;
	private String deliv_recipient;
	private String deliv_address;
	private String deliv_tel;
	private String deliv_norm_tel;
}

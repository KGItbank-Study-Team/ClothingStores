package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class OrderPaymentDTO {
	
	private long order_uid;
	private Date pay_date;
	private String type;
	private String satus;
	private int price;
	
}

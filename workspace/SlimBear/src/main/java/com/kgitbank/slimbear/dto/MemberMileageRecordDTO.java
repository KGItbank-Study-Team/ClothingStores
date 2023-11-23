package com.kgitbank.slimbear.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberMileageRecordDTO {
	
	private long mem_uid;
	private Date date;
	private String order_code;
	private String type;
	private int mileage;
	
}

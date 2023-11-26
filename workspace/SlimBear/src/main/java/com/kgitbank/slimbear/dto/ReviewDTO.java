package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO extends PageDTO {
	
	private long uid;
	private String mem_id;
	private String prod_code;
	private String title;
	private String content;
	private int score;
	private Date reg_date;
	
}

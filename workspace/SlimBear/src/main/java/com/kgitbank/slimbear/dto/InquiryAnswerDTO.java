package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InquiryAnswerDTO {
	
	private long uid;
	private long inqr_uid;
	private String title;
	private String content;
	private String mem_id;
	private Date reg_date;
	private int secure;
}

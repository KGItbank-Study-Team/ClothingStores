package com.kgitbank.slimbear.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
	private int secure;
}

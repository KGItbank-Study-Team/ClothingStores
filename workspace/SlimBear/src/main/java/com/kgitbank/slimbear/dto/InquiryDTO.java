package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InquiryDTO {
	private long uid;
	private String writer_id;
	private String title;
	private String content;
	private Date reg_date;
	private String status;
	private String type;
	private Long prod_uid;
}

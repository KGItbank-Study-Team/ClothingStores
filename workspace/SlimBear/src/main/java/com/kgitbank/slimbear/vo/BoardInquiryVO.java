package com.kgitbank.slimbear.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardInquiryVO {

		private int no;
		private String title;
		private String writer_id;
		private Date reg_date;	// 작성일자
		private String content;
		
}

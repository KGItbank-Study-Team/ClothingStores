package com.kgitbank.slimbear.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class NoticeDTO {
	private long uid;
	private String title;
	private String content;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
	private int priority;
	private String type;
	private String writer;
	private String view_cnt;
}

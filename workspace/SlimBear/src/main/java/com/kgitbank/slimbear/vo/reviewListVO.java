package com.kgitbank.slimbear.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class reviewListVO {
	
	private String image;
	private String title;
	private String content;
	private String mem_id;
	private int score;
	private Date reg_date;
	
}

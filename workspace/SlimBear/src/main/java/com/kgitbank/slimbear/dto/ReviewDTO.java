package com.kgitbank.slimbear.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {
	
	private long uid;
	private long mem_uid;
	private String title;
	private String content;
	
}

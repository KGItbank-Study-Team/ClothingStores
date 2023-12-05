package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {
	
	private long uid;
	private String mem_id;
	private String prod_code;
	private String title;
	private String content;
	private int score;
	private Date reg_date;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	

	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(long uid, String mem_id, String prod_code, String title, String content, int score, Date reg_date,
			String image1, String image2, String image3, String image4) {
		super();
		this.uid = uid;
		this.mem_id = mem_id;
		this.prod_code = prod_code;
		this.title = title;
		this.content = content;
		this.score = score;
		this.reg_date = reg_date;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
	}
}

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
	
	// 생성자 추가
    public ReviewDTO(long uid, String mem_id, String prod_code, String title, String content, int score, Date reg_date) {
        this.uid = uid;
        this.mem_id = mem_id;
        this.prod_code = prod_code;
        this.title = title;
        this.content = content;
        this.score = score;
        this.reg_date = reg_date;
    }

	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}
}

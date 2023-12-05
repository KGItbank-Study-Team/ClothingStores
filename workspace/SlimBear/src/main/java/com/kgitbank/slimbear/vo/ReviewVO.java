package com.kgitbank.slimbear.vo;

import java.util.Date;

import com.kgitbank.slimbear.dto.ReviewDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
public class ReviewVO extends ReviewDTO {

    private String status;


    // 기본 생성자
    public ReviewVO() {
        super(); // ReviewDTO의 기본 생성자 호출
    }

	public ReviewVO(long uid, String mem_id, String prod_code, String title, String content, int score, Date reg_date,String status,
			String image1, String image2, String image3, String image4) {
		super(uid, mem_id, prod_code, title, content, score, reg_date, image1, image2, image3, image4);
		// TODO Auto-generated constructor stub
		this.status = status;
	}
}

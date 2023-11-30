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

    // ReviewDTO의 생성자를 호출하는 부분
    public ReviewVO(long uid, String mem_id, String prod_code, String title, String content, int score, Date reg_date, String status) {
        super(uid, mem_id, prod_code, title, content, score, reg_date);
        this.status = status;
    }

    // 기본 생성자
    public ReviewVO() {
        super(); // ReviewDTO의 기본 생성자 호출
    }
}

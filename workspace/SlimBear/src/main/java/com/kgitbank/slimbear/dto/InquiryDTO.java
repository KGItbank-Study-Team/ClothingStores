package com.kgitbank.slimbear.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InquiryDTO {
	private Long uid;
	private String writer_id;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
	private String status;
	private String type;
	private Long prod_uid;
    private int secure; // 비밀글 여부를 나타내는 필드
    
    private String searchKey; // 검색 대상 (title, content, writer_id, prod_uid 등)
    private String searchValue; // 검색어
    
}

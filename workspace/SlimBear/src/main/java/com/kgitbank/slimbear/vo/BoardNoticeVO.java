package com.kgitbank.slimbear.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardNoticeVO {

	private int no;
	private String title;
	private String name;
	private Date reg_date; // 작성일자
	private String content;

//	private String boardTitle; // 게시글 제목
//    private String name; // 작성자 이름

}

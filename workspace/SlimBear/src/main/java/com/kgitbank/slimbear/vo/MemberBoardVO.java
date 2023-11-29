package com.kgitbank.slimbear.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberBoardVO {
	private String boardGroup;
	private String boardTitle;
	private String boardWriter;
	private Date boardDate;
	private long uid;
}

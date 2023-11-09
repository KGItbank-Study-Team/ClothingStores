package com.kgitbank.slimbear.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardListVO {
	private List<BoardVO> boardList;	// 게시물 목록
	
}

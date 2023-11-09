package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MemberCartVO {
	
	private long uid;
	private int price;
	private int deprice;
	private String desc;
}

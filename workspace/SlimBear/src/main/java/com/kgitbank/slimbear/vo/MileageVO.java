package com.kgitbank.slimbear.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MileageVO {
	private int totalReserve;	//총적립금
	private int reserve;		//사용가능적립금
	private int useReserve;		//사용된 적립금
	
	private Date orderDate;		//주문날짜
	private int addReserve;		//적립금
	private String relatedOrder;//관련주문
	private String substance;	//내용
}

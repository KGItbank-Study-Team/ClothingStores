package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyPageVO {
	private String username;	//사용자이름
	
	private int reserve;		//가용적립금.
	private int totalReserve;	//총적립금.
	private int useReserve;		//사용적립금.
	private int totalOrderM;	//총주문금액.
	private int totalOrderN;	//총주문횟수.
	private int coupon;			//쿠폰개수.
	
	private int beforeDeposit;		//입금전인 주문.
	private int preparingDelivery;	//배송준비중인 주문.
	private int transit;			//배송준인 주문.
	private int delivered;			//배송완료된 주문.
	private int cancel;				//취소
	private int turn;				//반품
	
}

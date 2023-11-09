package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyPageVO {
	private String username;
	private String grade;
	private String upgrade;
	private int upgradeMoney;
	private int yearMoney;
	
	private int reserve;
	private int totalReserve;
	private int useReserve;
	private int deposit;
	private int totalOrderM;
	private int totalOrderN;
	private int coupon;
	
	private int beforeDeposit;
	private int preparingDelivery;
	private int transit;
	private int delivered;
	private int cancel;
	private int exchange;
	private int turn;
}

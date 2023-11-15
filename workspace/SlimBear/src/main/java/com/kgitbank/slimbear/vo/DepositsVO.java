package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DepositsVO {
	private int accrueDeposit; //누적예치금
	private int useDeposit;	   //사용된예치금
	private int deposit;		//사용가능예치금
	private int refundDeposit;	//환불요청예치금
	
	private String orderDate;
	private int minusDeposit;
	private String relatedOrder;
	private String substance;
}

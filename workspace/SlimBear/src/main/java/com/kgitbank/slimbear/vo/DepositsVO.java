package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DepositsVO {
	private int accureDeposit;
	private int useDeposit;
	private int deposit;
	private int refundDeposit;
	
	private String orderDate;
	private int minusDeposit;
	private String relatedOrder;
	private String substance;
}

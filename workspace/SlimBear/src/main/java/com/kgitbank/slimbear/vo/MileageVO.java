package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MileageVO {
	private int totalReserve;
	private int reserve;
	private int useReserve;
	private int unReserve;
	
	private String orderDate;
	private int addReserve;
	private String relatedOrder;
	private String substance;
}

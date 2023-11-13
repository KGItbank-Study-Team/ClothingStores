package com.kgitbank.slimbear.common;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class SlimBearAddress {
	private String number;
	private String address1;
	private String address2;
	
	public SlimBearAddress(String number, String address1, String address2) {
		this.number = number;
		this.address1 = address1;
		this.address2 = address2;
	}
}

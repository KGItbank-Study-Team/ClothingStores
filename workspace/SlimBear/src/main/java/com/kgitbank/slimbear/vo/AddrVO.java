package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddrVO {
	private String addrName;
	private String username;
	private String phone;
	private String mobile;
	private int postcode;
	private String defaultAddr;
	private String remainAddr;
	private int phoneF;
	private int phoneL;
	private int mobileF;
	private int mobileL;
}

package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ModifyVO {
	private String username;
	private String grade;
	private String userID;
	private int postcode;
	private String defaultAddr;
	private String remainAddr;
	private int phoneF;
	private int phoneL;
	private int mobileF;
	private int mobileL;
	private String email;
	private int userYear;
	private int userMonth;
	private int userDay;
	private String refundAccount;
}

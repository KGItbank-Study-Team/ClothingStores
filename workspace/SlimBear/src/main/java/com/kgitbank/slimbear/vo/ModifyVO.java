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
	private String postcode;
	private String defaultAddr;
	private String remainAddr;
	private String phone0;
	private String phone1;
	private String phone2;
	private String mobile0;
	private String mobile1;
	private String mobile2;
	private String email;
	private int userYear;
	private int userMonth;
	private int userDay;
	private String refundAccount;
}

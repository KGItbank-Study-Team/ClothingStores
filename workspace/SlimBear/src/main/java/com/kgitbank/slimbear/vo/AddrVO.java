package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddrVO {
	private String addrName;		//배송지명
	private	String recipient;   	//수령인
	private String phone;			//일반전화
	private String mobile;			//휴대전화
	private String postcode;		//우편번호
	private String defaultAddr;		//기본주소
	private String remainAddr;		//상세주소
	private long addr_uid;			//배송지uid
	
	//addrfix, addrregister
	private String phone1;
	private String phone2;
	private String phone3;
	private String mobile1;
	private String mobile2;
	private String mobile3;
}

package com.kgitbank.slimbear.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ModifyVO {
	private String username;	//회원이름
	private String userID;		//회원 아이디
	private String password;
	private String postcode;	//우편번호
	private String defaultAddr;	//기본주소
	private String remainAddr;	//상세주소
	private String phone0;		//일반전화 앞 3자리
	private String phone1;		//일반전화 중간 4자리
	private String phone2;		//일반전화 끝 4자리
	private String mobile0;		//휴대전화 앞 3자리
	private String mobile1;		//휴대전화 중간 4자리
	private String mobile2;		//휴대전화 끝 4자리
	private String email;		//회원 이메일
}

package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class MemberDTO {
	private int uid;
	private String id;
	private String password;
	private String email;
	private String name;
	private String address;
	private char sex;
	private Date regDate;
}

package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class MemberDTO {
	private Long uid;
	private String id;
	private String password;
	private String email;
	private String name;
	private String address;
	private String phone;
	private Character sex;				
	private Date reg_date;
	private Integer mileage;
	private String login_type;
	private String status;
}
     
package com.kgitbank.slimbear.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class MemberOrderAddressDTO {
	private long uid;
	private long mem_uid;
	private String name;
	private String phone;
	private String nomal_phone;
	private String address;
}

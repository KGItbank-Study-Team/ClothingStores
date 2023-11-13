package com.kgitbank.slimbear.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class AdminDTO {
	private long uid;
	private String id;
	private String password;
	private String name;
}

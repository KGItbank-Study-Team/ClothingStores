package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class WishDTO {
	private long uid;
	private long mem_uid;
	private String prod_code;
	private Date reg_date;
}

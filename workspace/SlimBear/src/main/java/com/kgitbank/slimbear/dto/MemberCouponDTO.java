package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString


public class MemberCouponDTO {

	private long uid;
	private long mem_uid;
	private long coup_uid;
	private Date expi_date;
	private Date use_date;
	private String code;
}

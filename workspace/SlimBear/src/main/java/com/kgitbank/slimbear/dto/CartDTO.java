package com.kgitbank.slimbear.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CartDTO {
	
	private long uid; /* 장바구니 물품uid */
	private long mem_uid; /* 회원uid */
	private String prod_code; /* 제품코드 */
	private int cnt; /* 수량 */
	private Date reg_date; /* 등록일 */
}

package com.kgitbank.slimbear.admin.dto;

import java.util.HashMap;
import java.util.List;

import com.kgitbank.slimbear.dto.OrderDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderListDTO extends OrderDTO {
	
	private String owner_id;
	private String pay_status;
	private String pay_type;
	
	private List<HashMap<Object, Object>> productDetails;
}

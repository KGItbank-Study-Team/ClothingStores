package com.kgitbank.slimbear.vo.command;

import com.kgitbank.slimbear.dto.OrderDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OrderCommand{
	private String code;
	private OrderDTO order;
}

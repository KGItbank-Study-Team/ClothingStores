package com.kgitbank.slimbear.vo.command;


import java.util.ArrayList;

import com.kgitbank.slimbear.vo.OrderProductVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
public class OrderProductCommand {
	public ArrayList<OrderProductVO> productList;
}

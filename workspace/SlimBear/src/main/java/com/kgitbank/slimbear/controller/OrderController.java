package com.kgitbank.slimbear.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.vo.command.OrderProductCommand;

@Controller
@RequestMapping("order")
public class OrderController {

	@RequestMapping("product")
	public String ProductOrder(@ModelAttribute("productList") OrderProductCommand orderProducts) {
		System.out.println(orderProducts);
		
		return "order";
	}
}

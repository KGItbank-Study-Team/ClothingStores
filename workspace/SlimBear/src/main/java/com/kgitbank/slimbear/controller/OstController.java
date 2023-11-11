package com.kgitbank.slimbear.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.service.OstSerivceImpl;
import com.kgitbank.slimbear.vo.MemberCartVO;


@Controller
public class OstController {
	
	@Autowired
	private OstSerivceImpl ostService;
	
	@RequestMapping("cart")
	public String cartPage(Model model) {
		List<MemberCartVO> cardlist = ostService.getCart();
		
		int totalPrice = 0;
		for(int i=0; i<cardlist.size(); ++i) {
			totalPrice += cardlist.get(i).getPrice();
		}
		
		model.addAttribute("cartList",cardlist);
		model.addAttribute("totalprice",totalPrice);
		
		return "cart"; 
	}
	
}










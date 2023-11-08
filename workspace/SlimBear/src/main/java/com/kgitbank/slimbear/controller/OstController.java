package com.kgitbank.slimbear.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.service.OstSerivceImpl;


@Controller
public class OstController {
	
	@Autowired
	private OstSerivceImpl ostService;
	
	@RequestMapping("board/cart")
	public String cartPage(Model model) {
		List<CartDTO> cardlist = ostService.getCart();
		
		for(int i = 0; i<3; ++i) {
			CartDTO item = new CartDTO();
			item.setProd_code("상품 : " + i );
			cardlist.add(item);
		}
		model.addAttribute("cartList",cardlist);
		
		return "ba"; 
	}
}

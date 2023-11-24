package com.kgitbank.slimbear.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.security.SecurityUser;
import com.kgitbank.slimbear.service.HunServiceImpl;
import com.kgitbank.slimbear.service.MemberService;
import com.kgitbank.slimbear.service.OrderServiceImpl;
import com.kgitbank.slimbear.service.ProductServiceImpl;
import com.kgitbank.slimbear.vo.AddrVO;
import com.kgitbank.slimbear.vo.MemberCartVO;
import com.kgitbank.slimbear.vo.OrderProductVO;
import com.kgitbank.slimbear.vo.command.OrderCommand;
import com.kgitbank.slimbear.vo.command.OrderProductCommand;
import com.siot.IamportRestClient.exception.IamportResponseException;

@Controller
@RequestMapping("order")
public class OrderController {

	@Autowired
	private OrderServiceImpl orderService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HunServiceImpl hunService;
	
	@Autowired
	private ProductServiceImpl prodService;

	
	@RequestMapping("product") 
	public String orderPage(HttpSession session, OrderProductCommand orderProducts, Authentication authentication, Model model) 
	{ 
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		
		MemberDTO mem = memberService.getMemberById(user.getUsername());
		List<AddrVO> addressInfo = hunService.getAddrInfo(mem.getUid());
		
		List<MemberCartVO> productList = new ArrayList<MemberCartVO>(); 
		for(int i=0; i<5; ++i) {
			ProductDTO product = prodService.getProductByUid(1);
			
			MemberCartVO vo = new MemberCartVO();
			vo.setUid(product.getUid());
			vo.setName(product.getName());
			vo.setColor("COLOR");
			vo.setSize("SIZE");
			vo.setPrice(product.getPrice());
			vo.setMaybeprice((int)(product.getPrice() - product.getPrice()*0.15));
			vo.setMain_image(product.getMain_image());
			vo.setCnt(i);
			
			productList.add(vo);
		}
		model.addAttribute("uid" , mem.getUid());
		model.addAttribute("name" , mem.getName());
		model.addAttribute("email", mem.getEmail());
		model.addAttribute("phone", mem.getPhone());
		model.addAttribute("addressInfo", addressInfo);
		model.addAttribute("productList", productList);
		session.setAttribute("test", productList);
		
		return "order";
	 }

	@PostMapping("product/payment")
	@ResponseBody
	public HashMap<String, String> orderProduct(Authentication authentication, OrderCommand order)
			throws IamportResponseException, IOException {

		//SecurityUser user = (SecurityUser) authentication.getPrincipal();

		orderService.productOrder(11, order);

		HashMap<String, String> res = new HashMap<String, String>();
		res.put("msg", "test");
		return res;
	}

}

package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.vo.MemberCartVO;

@Service
public class OstSerivceImpl {
	
	
	
	public List<MemberCartVO> getCart(){
		/* List<CartDTO> list = new ArrayList<CartDTO>(); */
		List<MemberCartVO> list = new ArrayList<MemberCartVO>();
		
		for(int i=0; i<5; ++i) {
			MemberCartVO membercart = new MemberCartVO();
			membercart.setUid(i);
			membercart.setDesc("유해커의 후드티");
			membercart.setInfoo("입는순간 유해커가 되는 후드티");
			membercart.setQuantity(i);
			membercart.setAddprice(100);
			membercart.setPrice(45000);
			membercart.setBaedalprice(2500);
			
			list.add(membercart);
		}
		
		return list;
	}
	
	
}

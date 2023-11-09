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
			
		}
		
		return list;
	}
	
	
}

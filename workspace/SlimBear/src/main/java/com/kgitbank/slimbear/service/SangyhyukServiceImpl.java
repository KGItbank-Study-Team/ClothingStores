package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.MemberDAO;
import com.kgitbank.slimbear.dto.ReviewDTO;

@Service
public class SangyhyukServiceImpl {
	
	@Autowired
	private MemberDAO memDAO;
	
	public List<ReviewDTO> getReview(){
		
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
	
		return list;
	}
}

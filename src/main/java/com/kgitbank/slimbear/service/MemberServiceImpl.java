package com.kgitbank.slimbear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.MemberDAO;
import com.kgitbank.slimbear.dto.MemberDTO;

@Service
public class MemberServiceImpl {

	@Autowired
	private MemberDAO memDAO;
	
	public void login(String id, String password) {
		System.out.println(memDAO.getMemberList());
	}
	
}

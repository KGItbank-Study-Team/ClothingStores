package com.kgitbank.slimbear.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.MemberDAO;
import com.kgitbank.slimbear.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memDAO;

	@Autowired
	private PasswordEncoder pwdEncoder;

	@Override
	public boolean join(MemberDTO member) throws RuntimeException {
		
		member.setPassword(pwdEncoder.encode(member.getPassword()));
		
		if (memDAO.addMember(member) > 0)
			return true;

		return false;
	}

	@Override
	public MemberDTO getMemberById(String id) {
		return memDAO.getMemberById(id);
	}
}

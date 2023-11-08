package com.kgitbank.slimbear.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.MemberDAO;
import com.kgitbank.slimbear.dto.MemberDTO;

@Service
public class MemberServiceImpl {

	public enum ELoginResult {
		SUCCESS, NOT_FOUNT_ID, FAILED_PASSWORD
	}

	@Autowired
	private MemberDAO memDAO;

	@Autowired
	private PasswordEncoder pwdEncoder;

	public ELoginResult login(String id, String password) {

		MemberDTO member = getMemberById(id);

		if (member == null) {
			return ELoginResult.NOT_FOUNT_ID;
		} else if (!member.getPassword().equals(password)) {
			return ELoginResult.FAILED_PASSWORD;
		}

		return ELoginResult.SUCCESS;
	}

	public boolean join(MemberDTO member) {
		
		if (memDAO.addMember(member) > 0)
			return true;

		return false;
	}

	public MemberDTO getMemberById(String id) {
		return memDAO.getMemberById(id);
	}
}

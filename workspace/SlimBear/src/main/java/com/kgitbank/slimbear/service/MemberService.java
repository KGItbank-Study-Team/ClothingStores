package com.kgitbank.slimbear.service;

import java.util.List;

import com.kgitbank.slimbear.dto.MemberDTO;

public interface MemberService {

	boolean join(MemberDTO member);

	MemberDTO getMemberById(String id);
	List<MemberDTO> getMemberList();
}
package com.kgitbank.slimbear.service;

import com.kgitbank.slimbear.dto.MemberDTO;

public interface MemberService {

	boolean join(MemberDTO member) throws RuntimeException;

	MemberDTO getMemberById(String id);

}
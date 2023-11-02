package com.kgitbank.slimbear.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.MemberDTO;

@Repository
public class MemberDAO extends MybatisDAO{
	
	public MemberDTO fintMemberById(int uid) {
		MemberDTO mem = new MemberDTO();
		mem.setUid(uid);
		return (MemberDTO)template.selectOne("com.slimbear.mapper.Member.SELECT_MEM_BY_UID", mem);
	}

	public List<MemberDTO> getMemberList() {
		return template.selectList("com.slimbear.mapper.Member.SELECT_MEM_LIST");
	}

}

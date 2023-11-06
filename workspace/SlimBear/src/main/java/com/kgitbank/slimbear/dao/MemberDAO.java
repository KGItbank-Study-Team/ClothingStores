package com.kgitbank.slimbear.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.MemberDTO;

@Repository
public class MemberDAO extends MybatisDAO{

	public MemberDTO getMemberById(String id){
		return template.selectOne("com.slimbear.mapper.Member.SELECT_MEM_BY_ID", id);
	}

	public List<MemberDTO> getMemberList() {
		return template.selectList("com.slimbear.mapper.Member.SELECT_MEM_LIST");
	}

	public int addMember(MemberDTO member) {
		return template.insert("com.slimbear.mapper.Member.INSERT_MEM", member);
	}
	
}

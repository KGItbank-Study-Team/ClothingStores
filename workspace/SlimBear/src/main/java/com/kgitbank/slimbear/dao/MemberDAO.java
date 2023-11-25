package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.MemberMileageRecordDTO;

@Repository
public class MemberDAO{
	
	@Autowired
	protected SqlSessionTemplate template;

	public MemberDTO getMemberByUID(long uid) {
		MemberDTO info = new MemberDTO();
		info.setUid(uid);
		return template.selectOne("com.slimbear.mapper.Member.SELECT_MEM_BY_UID", info);
	}
	
	public MemberDTO getMemberById(String id) {
		MemberDTO info = new MemberDTO();
		info.setId(id);
		return template.selectOne("com.slimbear.mapper.Member.SELECT_MEM_BY_ID", info);
	}
	

	public MemberDTO getMemberByEmail(String email) {
		return template.selectOne("com.slimbear.mapper.Member.SELECT_MEM_BY_EMAIL", email);
	}

	public List<MemberDTO> getMemberList() {
		return template.selectList("com.slimbear.mapper.Member.SELECT_MEM_LIST");
	}

	public int addMember(MemberDTO member) {
		return template.insert("com.slimbear.mapper.Member.INSERT_MEM", member);
	}
	
	public int updateMember(MemberDTO member) {
		return template.update("com.slimbear.mapper.Member.UPDATE_MEM", member);
	}
	
	// 마일리지 내역
	public int getMemberMileageRecordListByMemberUID(long mem_uid) {
		return  template.update("com.slimbear.mapper.Member.SELECT_MILEAGERECORD_BY_MEM_UID", mem_uid);
	}
	
	public int insertMemberMileageRecord(MemberMileageRecordDTO record) {
		return  template.update("com.slimbear.mapper.Member.INSERT_MILEAGERECORD", record);
	}
	
	// 비밀번호 찾기 시 비밀번호 수정(승연)
	public int updateTemporaryPassword(MemberDTO member) {
		return template.update("com.slimbear.mapper.Member.UPDATE_TEMP_MEM", member);
	}

}

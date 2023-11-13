package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.MemberOrderAddressDTO;

@Repository
public class MemberOrderAddressDAO {
	
	@Autowired
	protected SqlSessionTemplate template;
	
	public List<MemberOrderAddressDTO> getAddressListByMemberUID(long memberUID) {
		MemberDTO info = new MemberDTO();
		info.setUid(memberUID);
		return template.selectList("com.slimbear.mapper.Member.SELECT_ORDERADDRESS_LIST_BY_MEMBER_UID", info);
	}

	public int insertAddress(MemberOrderAddressDTO address) {
		return template.insert("com.slimbear.mapper.Member.INSERT_ORDERADDRESS", address);
	}
	
	public int updateAddress(MemberOrderAddressDTO address) {
		return template.update("com.slimbear.mapper.Member.UPDATE_ORDERADDRESS", address);
	}
	
	public int deleteAddress(MemberOrderAddressDTO address) {
		return template.delete("com.slimbear.mapper.Member.DELETE_ORDERADDRESS", address);
	}
}

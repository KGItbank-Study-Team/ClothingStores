package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.MemberCouponDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.WishDTO;

@Repository
public class WishDAO {
	@Autowired
	protected SqlSessionTemplate template;

	public List<WishDTO> getWishListByMemberUID(long memberUID) {
		MemberDTO info = new MemberDTO();
		info.setUid(memberUID);
		return template.selectList("com.slimbear.mapper.Member.SELECT_WISH_LIST_BY_MEMBER_UID", info);
	}

	public int insertAddress(WishDTO wish) {
		return template.insert("com.slimbear.mapper.Member.INSERT_WISH", wish);
	}
	
	public int updateAddress(WishDTO wish) {
		return template.update("com.slimbear.mapper.Member.UPDATE_WISH", wish);
	}
}

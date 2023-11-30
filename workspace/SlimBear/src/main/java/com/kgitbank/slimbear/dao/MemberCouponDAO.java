package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.CouponDTO;
import com.kgitbank.slimbear.dto.MemberCouponDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.MemberOrderAddressDTO;

@Repository
public class MemberCouponDAO {

	@Autowired
	protected SqlSessionTemplate template;

	public List<MemberCouponDTO> getCouponListByMemberUID(long memberUID) {
		MemberDTO info = new MemberDTO();
		info.setUid(memberUID);
		return template.selectList("com.slimbear.mapper.Member.SELECT_COUPON_LIST_BY_MEMBER_UID", info);
	}
	
	public MemberCouponDTO getCouponByUID(long uid) {
		return template.selectOne("com.slimbear.mapper.Member.SELECT_COUPON_LIST_BY_UID", uid);
	}

	public int insertAddress(MemberCouponDTO coupon) {
		return template.insert("com.slimbear.mapper.Member.INSERT_COUPON", coupon);
	}
	
	public int updateAddress(MemberCouponDTO coupon) {
		return template.update("com.slimbear.mapper.Member.UPDATE_COUPON", coupon);
	}
	
	public int updateUseDate(MemberCouponDTO coupon) {
		return template.update("com.slimbear.mapper.Member.UPDATE_COUPON_USEDATE", coupon);
	}
}

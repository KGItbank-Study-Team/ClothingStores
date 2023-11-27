package com.kgitbank.slimbear.service;

import java.util.List;

import com.kgitbank.slimbear.dto.CouponDTO;
import com.kgitbank.slimbear.dto.MemberCouponDTO;
import com.kgitbank.slimbear.dto.MemberDTO;

public interface MemberService {

	boolean join(MemberDTO member);

	MemberDTO getMemberById(String id);
	MemberDTO getMemberByUID(Long uid);
	MemberDTO getMemberByEmail(String email);
	
	CouponDTO getCoupon(String code);
	MemberCouponDTO getMemberCouponByCode(String code);
	void registerCoupon(MemberCouponDTO coupon);
	
	List<MemberDTO> getMemberList();

}
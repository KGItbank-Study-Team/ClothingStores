package com.kgitbank.slimbear.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.common.SlimBearEnum.MEMBER_STATUS;
import com.kgitbank.slimbear.dao.CouponDAO;
import com.kgitbank.slimbear.dao.MemberCouponDAO;
import com.kgitbank.slimbear.dao.MemberDAO;
import com.kgitbank.slimbear.dto.CouponDTO;
import com.kgitbank.slimbear.dto.MemberCouponDTO;
import com.kgitbank.slimbear.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memDAO;
	
	@Autowired
	private CouponDAO couponDAO;
	private MemberCouponDAO memCouponDAO;

	@Autowired
	private PasswordEncoder pwdEncoder;

	@Override
	public boolean join(MemberDTO member) {
		
		member.setReg_date(new Date(System.currentTimeMillis()));
		member.setStatus(MEMBER_STATUS.ACTIVE.toString());
		member.setPassword(pwdEncoder.encode(member.getPassword()));
		
		if (memDAO.addMember(member) > 0)
			return true;

		return false;
	}

	@Override
	public MemberDTO getMemberById(String id) {
		return memDAO.getMemberById(id);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		return memDAO.getMemberList();
	}

	@Override
	public MemberDTO getMemberByUID(Long uid) {
		return memDAO.getMemberByUID(uid);
	}

	@Override
	public MemberDTO getMemberByEmail(String email) {
		return memDAO.getMemberByEmail(email);
	}

	@Override
	public CouponDTO getCoupon(String code) {
		return couponDAO.getCouponByCode(code);
	}

	@Override
	public MemberCouponDTO getMemberCouponByUID(long uid) {
		return memCouponDAO.getCouponByUID(uid);
	}

	@Override
	public void registerCoupon(MemberCouponDTO coupon) {
		memCouponDAO.insertAddress(coupon);
	
	}
}

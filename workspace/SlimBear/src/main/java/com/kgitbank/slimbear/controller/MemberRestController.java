package com.kgitbank.slimbear.controller;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kgitbank.slimbear.common.SlimBearUtil;
import com.kgitbank.slimbear.dto.CouponDTO;
import com.kgitbank.slimbear.dto.MemberCouponDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.security.SecurityUser;
import com.kgitbank.slimbear.service.HunServiceImpl;
import com.kgitbank.slimbear.service.MemberService;
import com.kgitbank.slimbear.vo.AddrVO;

@RestController
@RequestMapping("member")
public class MemberRestController {
	
	@Autowired
	private MemberService memberService;
	
@Autowired
	private HunServiceImpl hunService;
	
	@PostMapping("id/duplicate")
	public HashMap<String, Object> CheckDuplicateMemberID(@RequestParam HashMap<String, Object> data) {
		String id = (String)data.get("id");

		HashMap<String, Object> restData = new HashMap<String, Object>();
		
		MemberDTO member = memberService.getMemberById(id);
		if(member == null) {
			restData.put("result", 1);
			restData.put("text", "사용가능한 아이디입니다.");
		}else {
			restData.put("result", 2);
			restData.put("text", "중복되는 아이디입니다.");
		}
		return  restData;
	}
	
	@PostMapping("addressinfo")
	public AddrVO getMemberAddressInfo(@RequestParam(name="userUID", required=false) Long userUID, @RequestParam(name="addrUID", required=false) Long addrUID) {
		AddrVO addressInfo = new AddrVO();
		String[] Split;
		if(userUID != null) {
			MemberDTO member = memberService.getMemberByUID(userUID);
			
			if(member == null) return addressInfo;
			
			addressInfo.setRecipient(member.getName());

			Split = SlimBearUtil.splitPhoneNumber(member.getPhone());
			addressInfo.setMobile1(Split[0]);		
			addressInfo.setMobile2(Split[1]);		
			addressInfo.setMobile3(Split[2]);		
			
			Split = SlimBearUtil.splitAddress(member.getAddress());
			addressInfo.setPostcode(Split[0]);
			addressInfo.setDefaultAddr(Split[1]);
			addressInfo.setRemainAddr(Split[2]);
			
		}
		else if(addrUID != null) {
			addressInfo = hunService.getAddrFixInfo(addrUID);
		}
	
		return  addressInfo;
	}
	

	@PostMapping("register/coupon")
	public HashMap<String, String> registerCoupon(Authentication authentication, @RequestParam String code) {
		HashMap<String, String> response = new HashMap<String, String>();
		if(authentication == null) {
			response.put("failed", "사용자 정보가 없습니다");
			return response;
		}
		
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
	

		CouponDTO Coupon =  memberService.getCoupon(code);
		
		if(Coupon == null) {
			response.put("failed", "존재하지 않는 쿠폰 번호입니다.");
			return response;
		}
		
		MemberCouponDTO memCoupon =  memberService.getMemberCouponByUID(Coupon.getUid());
		if(memCoupon != null) {
			response.put("failed", "이미 사용한 쿠폰 번호입니다.");
		}else {
			
			memCoupon = new MemberCouponDTO();
			memCoupon.setCoup_uid(Coupon.getUid());
			memCoupon.setMem_uid(user.getUid());
			
			Date expireDate = new Date(System.currentTimeMillis() + (Coupon.getExpi_days() * 86400000));
			memCoupon.setExpi_date(expireDate);
			memberService.registerCoupon(memCoupon);
		
			response.put("success", "쿠폰이 정상적으로 등록되었습니다.");
		}
		
		return response;
		
	}

}

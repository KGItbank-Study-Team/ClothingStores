package com.kgitbank.slimbear.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kgitbank.slimbear.common.SlimBearUtil;
import com.kgitbank.slimbear.dto.MemberDTO;
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

}

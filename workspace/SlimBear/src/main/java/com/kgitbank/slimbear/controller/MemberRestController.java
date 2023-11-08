package com.kgitbank.slimbear.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.service.MemberServiceImpl;

@RestController
@RequestMapping("member")
public class MemberRestController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
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
}

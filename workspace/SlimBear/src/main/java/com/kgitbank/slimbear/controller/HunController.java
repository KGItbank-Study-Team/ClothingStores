package com.kgitbank.slimbear.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.security.SecurityUser;

@Controller
public class HunController {

	@RequestMapping("member/myPage")
	public String myPage(Authentication authentication) {

		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "mypage";
	}
	
	@RequestMapping("member/myPage/orderList")
	public String orderList(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "order_list";
	}
	
	@RequestMapping("member/myPage/orderList/pastList")
	public String pastList(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "pastlist";
	}
	
	@RequestMapping("member/myPage/modify")
	public String modify(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "modify";
	}
	
	@RequestMapping("member/myPage/modify/refund")
	public String refund(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "refund";
	}
	
	@RequestMapping("member/myPage/modify/quit")
	public String quit(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "quit";
	}
	
	@RequestMapping("member/myPage/mileage")
	public String mileage(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "mileage";
	}
	
	@RequestMapping("member/myPage/deposits")
	public String deposits(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "deposits";
	}
	
	@RequestMapping("member/myPage/coupon")
	public String coupon(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "coupon";
	}
	
	@RequestMapping("member/myPage/wishList")
	public String wishList(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "wish_list";
	}
	
	@RequestMapping("member/myPage/boardList")
	public String boardList(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "board_list";
	}
	
	@RequestMapping("member/myPage/addr")
	public String addr(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "addr";
	}
	
	@RequestMapping("member/myPage/addr/addrFix")
	public String addrFix(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "addrfix";
	}
	
	@RequestMapping("member/myPage/addr/addrRegister")
	public String addrRegister(Authentication authentication) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		return "addrregister";
	}
}

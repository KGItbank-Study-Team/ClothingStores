package com.kgitbank.slimbear.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.security.SecurityUser;
import com.kgitbank.slimbear.service.HunServiceImpl;
import com.kgitbank.slimbear.vo.AddrVO;
import com.kgitbank.slimbear.vo.CouponVO;
import com.kgitbank.slimbear.vo.DepositsVO;
import com.kgitbank.slimbear.vo.MemberBoardVO;
import com.kgitbank.slimbear.vo.MileageVO;
import com.kgitbank.slimbear.vo.ModifyVO;
import com.kgitbank.slimbear.vo.MyPageVO;
import com.kgitbank.slimbear.vo.OrderListVO;
import com.kgitbank.slimbear.vo.RefundVO;
import com.kgitbank.slimbear.vo.WishListVO;

@Controller
public class HunController {

	@Autowired
	private HunServiceImpl hunService;
	
	@RequestMapping("member/myPage")
	public String myPage(Authentication authentication, Model model) {

		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
	    MyPageVO vo = hunService.getMyPageInfo(user.getUid());
		model.addAttribute("info", vo);
		
		return "mypage";
	}
	
	@RequestMapping("member/myPage/orderList")
	public String orderList(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
		List<OrderListVO> vo = hunService.getOrderListInfo(user.getUid());
		model.addAttribute("orderList", vo);
		
		return "order_list";
	}
	
	@RequestMapping("member/myPage/orderList/pastList")
	public String pastList(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
		List<OrderListVO> vo = hunService.getPastListInfo(user.getUid());
		model.addAttribute("pastorderList", vo);
		
		return "pastlist";
	}
	
	@RequestMapping("member/myPage/modify")
	public String modify(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
		ModifyVO vo = hunService.getModifyInfo(user.getUid());
		model.addAttribute("modi", vo);
		
		return "modify";
	}
	
	@RequestMapping("member/myPage/modify/refund")
	public String refund(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
		RefundVO vo = hunService.getRefundInfo(user.getUid());
		model.addAttribute("info", vo);
		
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
	public String mileage(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
		MileageVO vo = hunService.getMileageInfo(user.getUid());
		model.addAttribute("mile", vo);
		
		return "mileage";
	}
	
	@RequestMapping("member/myPage/deposits")
	public String deposits(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
		DepositsVO vo = hunService.getDepositsInfo(user.getUid());
		model.addAttribute("depo", vo);
		
		return "deposits";
	}
	
	@RequestMapping("member/myPage/coupon")
	public String coupon(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
		List<CouponVO> vo = hunService.getCouponListInfo(user.getUid());
		model.addAttribute("couponList", vo);
		
		System.out.println(vo);
		
		return "coupon";
	}
	
	@RequestMapping("member/myPage/wishList")
	public String wishList(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
		List<WishListVO> vo = hunService.getWishListInfo(user.getUid());
		model.addAttribute("wishList", vo);
		return "wish_list";
	}
	
	@RequestMapping("member/myPage/boardList")
	public String boardList(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
		List<MemberBoardVO> vo = hunService.getMemberBoardInfo();
		model.addAttribute("boardList", vo);
		return "board_list";
	}
	
	@RequestMapping("member/myPage/addr")
	public String addr(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		System.out.println(user.getUid());
		System.out.println(user.getUsername());
		
		List<AddrVO> vo = hunService.getAddrInfo(user.getUid());
		model.addAttribute("addrList", vo);
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

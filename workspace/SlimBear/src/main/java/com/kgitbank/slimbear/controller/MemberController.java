package com.kgitbank.slimbear.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.common.SlimBearEnum.MEMBER_TYPE;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.MemberOrderAddressDTO;
import com.kgitbank.slimbear.security.SecurityUser;
import com.kgitbank.slimbear.service.MemberService;
import com.kgitbank.slimbear.service.SocialService;
import com.kgitbank.slimbear.vo.AddrVO;
import com.kgitbank.slimbear.vo.CouponVO;
import com.kgitbank.slimbear.vo.MemberBoardVO;
import com.kgitbank.slimbear.vo.MileageVO;
import com.kgitbank.slimbear.vo.ModifyVO;
import com.kgitbank.slimbear.vo.MyPageVO;
import com.kgitbank.slimbear.vo.OrderVO;
import com.kgitbank.slimbear.vo.WishListVO;
import com.kgitbank.slimbear.vo.reviewListVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SocialService SocialService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	
	@RequestMapping("member/join")
	public String join(MemberDTO member) {
		
		member.setStatus(MEMBER_TYPE.SLIMBEAR.toString());

		if(memberService.join(member)) {
			
			return "redirect:/";
		}else {
		
			return "redirect:/app/join";
		}
	}
	
	@RequestMapping("member/myPage")
	public String myPage(Authentication authentication, Model model) {

		SecurityUser user = (SecurityUser) authentication.getPrincipal();
	
		MyPageVO vo = memberService.getMyPageInfo(user.getUid());
		model.addAttribute("info", vo);

		return "mypage";
	}

	@RequestMapping("member/myPage/orderList")
	public String orderList(Authentication authentication, Model model) {
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
	
		return "order_list";
	}
	
	@RequestMapping("member/myPage/orderList/search")
	@ResponseBody
	public Map<String, Object> orderListSearch(Authentication authentication
								, String searchType
								, Long searchStartDate
								, Long searchendDate) {

		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		
		Date startDate = searchStartDate == null ? null : new Date(searchStartDate);
		Date endDate = searchendDate == null ? null : new Date(searchendDate);
		
		if(searchType == null || searchType.equals("all")) {
			searchType = null;
		}
		

		List<OrderVO> list = memberService.getOrderListInfo(user.getUid(), searchType, startDate, endDate);
		
		HashMap<String, Object> res = new HashMap<String, Object>();
		res.put("data", list);
		return res;
	}
	
	@RequestMapping("member/myPage/orderList/cancel")
	public String orderCancel(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		
		
		return "ordercancel";
	}
	
	@RequestMapping("member/myPage/orderList/return")
	public String orderReturn(Authentication authentication, Model model) {
		
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
	
		
		return "orderreturn";
	}
	
	@RequestMapping("member/myPage/orderList/detail")
	public String orderDetail(Authentication authentication, @RequestParam Long orderUID, Model model) {
		
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
	
		model.addAttribute("order", memberService.getOrderDetailInfo(orderUID));
		
		return "orderdetail";
	}
	@RequestMapping("member/myPage/modify")
	public String modify(Authentication authentication, Model model) {

		SecurityUser user = (SecurityUser) authentication.getPrincipal();

		ModifyVO vo = memberService.getModifyInfo(user.getUid());
		model.addAttribute("modi", vo);

		return "modify";
	}
	
	@RequestMapping("member/myPage/modify/update")
	public String modifyUpdate(ModifyVO modInfo, Authentication authentication, Model model) {

		SecurityUser user = (SecurityUser) authentication.getPrincipal();

		memberService.updateMemberInfo(user.getUid(), modInfo);
	
		return "redirect:/app/member/myPage/modify";
	}

	@RequestMapping("member/myPage/modify/quit")
	public String quit(Authentication authentication) {
		return "quit";
	}

	@RequestMapping("member/myPage/mileage")
	public String mileage(Authentication authentication, Model model) {

		SecurityUser user = (SecurityUser) authentication.getPrincipal();


		MileageVO vo = memberService.getMileageInfo(user.getUid());
		List<MileageVO> v = memberService.getMileageListInfo(user.getUid());
		
		model.addAttribute("mile", vo);
		model.addAttribute("reserveList", v);

		return "mileage";
	}

	@RequestMapping("member/myPage/coupon")
	public String coupon(Authentication authentication, Model model) {

		SecurityUser user = (SecurityUser) authentication.getPrincipal();


		List<CouponVO> vo = memberService.getCouponListInfo(user.getUid());
		model.addAttribute("couponList", vo);

		return "coupon";
	}

	@RequestMapping("member/myPage/wishList")
	public String wishList(Authentication authentication, Model model) {

		SecurityUser user = (SecurityUser) authentication.getPrincipal();


		List<WishListVO> vo = memberService.getWishListInfo(user.getUid());
		model.addAttribute("wishList", vo);

		

		return "wish_list";
	}
	
	//위시리스트 삭제
	@PostMapping("member/myPage/wishList/delete")
	public String deleteWishItems(@RequestParam("uids") String uids) {
	    try {
	        // uids를 ',' 기준으로 분리하여 삭제
	        String[] uidArray = uids.split(",");
	        for (String uid : uidArray) {
	            memberService.deleteWish(Long.parseLong(uid));
	        }
	        return "redirect:/app/member/myPage/wishList";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "redirect:/app/member/myPage/wishList";
	    }
	}


	// 문의게시판 
	@RequestMapping("member/myPage/boardList")
	public String boardList(Authentication authentication, Model model) {

		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		String writerID = user.getUsername();


		List<MemberBoardVO> vo = memberService.getMemberBoardInfo(writerID);
		
		
		
		model.addAttribute("boardList", vo);
		return "board_list";
	}
	
	@RequestMapping("member/myPage/reviewList")
	public String reviewList(
	    @RequestParam(value = "page", defaultValue = "1") int page,
	    @RequestParam(value = "perPage", defaultValue = "5") int perPage,
	    Authentication authentication, Model model) {
	    
	    SecurityUser user = (SecurityUser) authentication.getPrincipal();
	    String userID = user.getUsername();

	    int start = (page - 1) * perPage;
	    int end = perPage;

	    List<reviewListVO> vo = memberService.getReviewListInfoPaging(userID, start, end);

	    model.addAttribute("reviewList", vo);

	    // 추가: 현재 페이지와 총 페이지 수를 모델에 추가
	    int totalReviews = memberService.getTotalReviewCount(userID);
	    int totalPages = (int) Math.ceil((double) totalReviews / perPage);

	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);

	    return "review_list";
	}

	@RequestMapping("member/myPage/addr")
	public String addr(Authentication authentication, Model model) {

		SecurityUser user = (SecurityUser) authentication.getPrincipal();


		List<AddrVO> vo = memberService.getAddrInfo(user.getUid());
		model.addAttribute("addrList", vo);	

		return "addr";
	}

	@RequestMapping("member/myPage/addr/fix")
	public String addrFix(Authentication authentication,@RequestParam("addrUID")long addrUID, Model model) {

		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		
		
		
		AddrVO vo = memberService.getAddrFixInfo(addrUID);
		model.addAttribute("fix", vo);
		
		
		
		return "addrfix";
	}
	
	@PostMapping("member/myPage/addr/fix")
	public String fix(Authentication authentication,
			@RequestParam("addressUID") long addressUID,
    		@RequestParam String name,
    		@RequestParam("recipient") String ma_rcv_name,
            @RequestParam("address1") String addressZip1,
            @RequestParam("address2") String addressAddr1,
            @RequestParam("address3") String addressAddr2,
    		@RequestParam("nomal_phone1") String nomal_phone1,
    		@RequestParam("nomal_phone2") String nomal_phone2,
    		@RequestParam("nomal_phone3") String nomal_phone3,
    		@RequestParam("phone1") String phone1,
    		@RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3 ){
		
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
        
        
        
        MemberOrderAddressDTO addr = new MemberOrderAddressDTO();
        addr.setUid(addressUID);
        addr.setMem_uid(user.getUid());
        addr.setName(name);
        addr.setRecipient(ma_rcv_name);
        addr.setAddress(addressZip1 + " | " + addressAddr1 + " | " + addressAddr2);
		addr.setNomal_phone(nomal_phone1 + "-" + nomal_phone2 + "-" + nomal_phone3);
		addr.setPhone(phone1 + "-" + phone2 + "-" + phone3);
        
		
		
		
		memberService.updateAddress(user.getUid(), addr);
		
		return "redirect:/app/member/myPage/addr";
	}

	
	@RequestMapping("member/myPage/addr/register")
	public String addrRegister(Authentication authentication, MemberOrderAddressDTO address) {

		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		
		
		
		return "addrregister";
		
	}
	
	@PostMapping("member/myPage/addr/register")
	public String register(Authentication authentication,
    		@RequestParam String name,
    		@RequestParam("recipient") String ma_rcv_name,
            @RequestParam("address1") String addressZip1,
            @RequestParam("address2") String addressAddr1,
            @RequestParam("address3") String addressAddr2,
    		@RequestParam("nomal_phone1") String nomal_phone1,
    		@RequestParam("nomal_phone2") String nomal_phone2,
    		@RequestParam("nomal_phone3") String nomal_phone3,
    		@RequestParam("phone1") String phone1,
    		@RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3 ){
		
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
        
        
        
        MemberOrderAddressDTO addr = new MemberOrderAddressDTO();
        addr.setMem_uid(user.getUid());
        addr.setName(name);
        addr.setRecipient(ma_rcv_name);
        addr.setAddress(addressZip1 + " | " + addressAddr1 + " | " + addressAddr2);
		addr.setNomal_phone(nomal_phone1 + "-" + nomal_phone2 + "-" + nomal_phone3);
		addr.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		
		memberService.insertAddress(user.getUid(), addr);
		
		return "redirect:/app/member/myPage/addr";
	}

	@PostMapping("member/myPage/addr")
	public String deleteSelectedAddresses(@RequestParam(name = "wish_idx", required = false) List<Long> addressUIDs) {
	    if (addressUIDs != null && !addressUIDs.isEmpty()) {
	        for (Long addressUID : addressUIDs) {
	            memberService.deleteAddress(addressUID);
	        }
	    }
	    return "redirect:/app/member/myPage/addr";
	}

	
	@PostMapping("/findId") // 아이디 찾기
	public String findId(@RequestParam String name, @RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "phone", required = false) String phone, Model model) {
		MemberDTO member = memberService.findId(name, email, phone);
		if (member != null) {
			model.addAttribute("member", member);
			return "/findId_result";
		} else {
			model.addAttribute("error", "아이디를 찾을 수 없습니다. 다시 입력해주세요.");
			return "/find_id"; // 실패 시 해당 페이지로 이동
		}
	}

	@PostMapping("/findPassword")
	public ResponseEntity<String> findPassword(@RequestParam String name, @RequestParam String id,
	        @RequestParam(name = "email", required = false) String email,
	        @RequestParam(name = "phone", required = false) String phone,
	        @RequestParam(name = "verificationCode", required = false) String enteredCode,
	        Model model, HttpSession httpSession) {
	    MemberDTO member = null;
	    member = memberService.findPassword(name, id, email, phone);
	    
	    if (member != null) {
	        // 회원이 존재하면 인증코드를 발급하고 세션에 회원 정보를 저장
	        String verificationCode;

	        if (phone != null && !phone.isEmpty()) {
	            verificationCode = SocialService.generateTemporaryVerificationCode();
	            SocialService.sendVerificationCodeByPhone(phone, verificationCode, httpSession);
	        } else if (email != null && !email.isEmpty()) {
	            try {
	                verificationCode = SocialService.generateTemporaryVerificationCode();
	                SocialService.sendVerificationCodeByEmail(email, verificationCode, "슬림베어 비밀번호 찾기 인증 코드 발급",
	                        "인증 코드: " + verificationCode, httpSession);

	                // Verification code를 성공적으로 발송했다고 응답
	                return ResponseEntity.ok("success");
	            } catch (Exception e) {
	                e.printStackTrace();
	                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to send verification code.");
	            }
	        } else {
	            model.addAttribute("error", "휴대폰 번호 또는 이메일을 입력하세요.");
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to send verification code.");
	        }

	        // 찾은 회원 정보를 저장
	        model.addAttribute("member", member);
	        return ResponseEntity.ok("success"); // 인증 코드 입력 페이지로 이동
	    } else {
	        model.addAttribute("error", "회원정보를 찾을 수 없습니다. 다시 입력해주세요.");
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to send verification code.");
	    }
	}
	
	
	@PostMapping("/sendVerificationCode")
    @ResponseBody
    public ResponseEntity<String> sendVerificationCode(
            @RequestParam String method,
            @RequestParam String target,
            HttpSession httpSession) {

        try {
            String verificationCode;

			// 인증 코드 발급 로직
			if ("1".equals(method)) {
				// 이메일로 발급
				verificationCode = SocialService.generateTemporaryVerificationCode();
				SocialService.sendVerificationCodeByEmail(target, verificationCode, "슬림베어 비밀번호 찾기 인증 코드 발급",
						"인증 코드: " + verificationCode, httpSession);
			} else if ("2".equals(method)) {
				// 휴대폰으로 발급
				verificationCode = SocialService.generateTemporaryVerificationCode();
				SocialService.sendVerificationCodeByPhone(target, verificationCode, httpSession);
			} else {
				return ResponseEntity.badRequest().body("Invalid method parameter.");
			}

			// 인증 코드 발급 성공시 클라이언트에게 응답
			return ResponseEntity.ok("Verification code sent successfully.");
		} catch (Exception e) {
			e.printStackTrace();
			// 에러 발생시 클라이언트에게 응답
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to send verification code.");
		}
	}

	@PostMapping("/verifyCode") // 인증 코드 확인
	public ResponseEntity<String> verifyCode(@RequestParam String method, @RequestParam String enteredCode,
			HttpSession httpSession, Model model) {
		// 세션에서 이메일과 인증 코드 가져오기
		// 세션에서 이메일과 인증 코드 Map 가져오기
		String verificationCode = (String) httpSession.getAttribute("verificationCode");
		String target = (String) httpSession.getAttribute("emailAddress");
		
		// 이메일과 인증 코드 가져오기
		String temporaryPassword;
		if (verificationCode != null && verificationCode.equals(enteredCode)) {
			// 임시 비밀번호 발급 로직
			temporaryPassword = SocialService.generateTemporaryPassword();
			if ("1".equals(method)) {
				// 이메일로 발급
				memberService.replacePasswordByEmail(target, passwordEncoder.encode(temporaryPassword));
				try {
					SocialService.sendEmail(target, "슬림베어 임시 비밀번호 발급", temporaryPassword);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else if ("2".equals(method)) {
				// 휴대폰으로 발급
				SocialService.sendTemporaryPassword(target, temporaryPassword);
				memberService.replacePasswordByPhone(target, passwordEncoder.encode(temporaryPassword));
			}
			httpSession.removeAttribute(target);
			httpSession.removeAttribute("emailAddress");
			httpSession.removeAttribute(verificationCode);
			httpSession.removeAttribute("verificationCode");
			
			return ResponseEntity.ok("success");
		} else {
			// 인증 코드 확인 실패 시 다시 입력 페이지로 이동
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Verification failed");
		}
	}
}

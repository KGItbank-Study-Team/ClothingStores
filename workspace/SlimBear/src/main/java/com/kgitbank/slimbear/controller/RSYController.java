package com.kgitbank.slimbear.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.dao.MemberDAO;
import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.service.RSYServiceImpl;
import com.kgitbank.slimbear.service.SocialService;

@Controller
public class RSYController {
	@Autowired
	private RSYServiceImpl RSYService;
	@Autowired
	private SocialService SocialService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private MemberDAO MemberDAO;

//	@RequestMapping("product/category") // 상품 목록
//	public String categoryPage01(@RequestParam long category,
//			@RequestParam(name = "order", required = false) String order,
//			@RequestParam(name = "currentPage", defaultValue = "1", required = false) int currentPage, Integer offset,
//			Integer pageSize, Model model) {
//
//		if (offset == null) {
//			offset = 0;
//		}
//		pageSize = 12; // 페이지 당 아이템 수
//
//		// 페이징에 관련된 정보 추가
//		int totalItems = RSYService.getTotalItems(category); // 전체아이템 수
//		int totalPages = (int) Math.ceil((double) totalItems / pageSize); // 전체 페이지 수
//
//		List<ProductDTO> productList = RSYService.getProductListByCategory(category, order, currentPage, offset,
//				pageSize);
//
//		model.addAttribute("order", order);
//		model.addAttribute("currentPage", currentPage);
//		model.addAttribute("totalPages", totalPages);
//		model.addAttribute("productList", productList);
//		model.addAttribute("totalItems", totalItems);

	@RequestMapping("product/category") // 상품 목록
	public String categoryPage01(@RequestParam long category,
			@RequestParam(name = "order", required = false) String order,
			@RequestParam(name = "currentPage", defaultValue = "1", required = false) int currentPage, Integer offset,
			Integer pageSize, Model model) {

		if (offset == null) {
			offset = 0;
		}
		pageSize = 12; // 페이지 당 아이템 수

		// 페이징에 관련된 정보 추가
		int totalItems = RSYService.getTotalItems(category); // 전체아이템 수
		int totalPages = (int) Math.ceil((double) totalItems / pageSize); // 전체 페이지 수
		int pageBlockSize = 5; // 보여질 페이지 블록 크기

		// 현재 페이지 블록의 시작 페이지와 끝 페이지 계산
		int startPage = ((currentPage - 1) / pageBlockSize) * pageBlockSize + 1;
		int endPage = Math.min(startPage + pageBlockSize - 1, totalPages);

		// 다음 페이지 블록이 있는지 여부
		boolean hasNextBlock = endPage < totalPages;

		List<ProductDTO> productList = RSYService.getProductListByCategory(category, order, currentPage, offset,
				pageSize);

		model.addAttribute("order", order);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("hasNextBlock", hasNextBlock);
		model.addAttribute("productList", productList);
		model.addAttribute("totalItems", totalItems);

		List<CategoryDTO> categoryList = RSYService.getSubCategoryListByTopCtgUid(category);

		model.addAttribute("categoryList", categoryList);

		List<ProductDTO> bestProductList = RSYService.getBestProductListByCategory(category);

		model.addAttribute("bestProductList", bestProductList);

		CategoryDTO topCategory = RSYService.getCategoryByUid(category);
		model.addAttribute("category", topCategory);

		System.out.println(categoryList);
		return "category";
	}

	@PostMapping("/findId") // 아이디 찾기
	public String findId(@RequestParam String name, @RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "phone", required = false) String phone, Model model) {
		MemberDTO member = RSYService.findId(name, email, phone);
		if (member != null) {
			model.addAttribute("member", member);
			return "/findId_result";
		} else {
			model.addAttribute("error", "아이디를 찾을 수 없습니다. 다시 입력해주세요.");
			return "/find_id"; // 실패 시 해당 페이지로 이동
		}
	}

//	@PostMapping("/findPassword") // 비밀번호 찾기
//	public String findPassword(@RequestParam String name, @RequestParam String id,
//			@RequestParam(name = "email", required = false) String email,
//			@RequestParam(name = "phone", required = false) String phone,
//			Model model) {
//
//		String temporaryPassword = name + "회원님의 임시 비밀번호는 " + generateTemporaryPassword() + " 입니다.";
//		String subject = "슬림베어 임시 비밀번호 발급";
//		// 이메일 발송
//		String resultMessage;
//
//		MemberDTO member = RSYService.findPassword(name, id, email, phone);
//		if (member != null) {
//	        model.addAttribute("member", member);
//	        System.out.println(phone);
//	        System.out.println(email);
//	        // 휴대폰 번호가 비어있지 않으면 문자 발송
//	        if (phone != null && !phone.isEmpty()) {
//	            SocialService.sendTemporaryPassword(phone, temporaryPassword);
//	        }
//
//	        // 이메일이 비어있지 않으면 이메일 발송
//	        if (email != null && !email.isEmpty()) {
//	            try {
//	                resultMessage = SocialService.sendEmail(email, subject, temporaryPassword);
//	                model.addAttribute("messageSent", resultMessage.equals("Email sent successfully!"));
//	            } catch (MessagingException e) {
//	                e.printStackTrace();
//	                return "error-pages/emailSendError";  // 에러 페이지 경로를 정확하게 지정
//	            }
//	        }
//
//	        return "/find_password_result";
//
//	    } else {
//	        model.addAttribute("error", "회원정보를 찾을 수 없습니다. 다시 입력해주세요.");
//	        return "/find_password"; // 실패 시 해당 페이지로 이동
//	    }
//
//	}

	@PostMapping("/findPassword")
	public String findPassword(@RequestParam String name, @RequestParam String id,
			@RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "phone", required = false) String phone,
			@RequestParam(name = "verificationCode", required = false) String enteredCode, Model model,
			HttpSession httpSession) {

		String verificationCode;

		if (phone != null && !phone.isEmpty()) {
			verificationCode = SocialService.generateTemporaryVerificationCode();
			SocialService.sendVerificationCodeByPhone(phone, verificationCode, httpSession);
		} else if (email != null && !email.isEmpty()) {
			try {
				verificationCode = SocialService.generateTemporaryVerificationCode();
				SocialService.sendVerificationCodeByEmail(email, verificationCode, "슬림베어 비밀번호 찾기 인증 코드 발급",
						"인증 코드: " + verificationCode, httpSession);
			} catch (Exception e) {
				e.printStackTrace();
				return "error-pages/emailSendError";
			}
		} else {
			model.addAttribute("error", "휴대폰 번호 또는 이메일을 입력하세요.");
			return "/find_password";
		}

		MemberDTO member = RSYService.findPassword(name, id, email, phone);
		if (member != null) {
			model.addAttribute("member", member);
			model.addAttribute("verificationCode", verificationCode);
			return "/verifyCode"; // 인증 코드 입력 페이지로 이동
		} else {
			model.addAttribute("error", "회원정보를 찾을 수 없습니다. 다시 입력해주세요.");
			return "/find_password";
		}
	}

	@PostMapping("/sendVerificationCode")
	@ResponseBody
	public ResponseEntity<String> sendVerificationCode(@RequestParam String method, @RequestParam String target,
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
	public String verifyCode(@RequestParam String method, @RequestParam String enteredCode, HttpSession httpSession,
			Model model) {
		// 세션에서 이메일과 인증 코드 가져오기
		// 세션에서 이메일과 인증 코드 Map 가져오기
		String verificationCode = (String) httpSession.getAttribute("verificationCode");
		String target = (String) httpSession.getAttribute("emailAddress");
		System.out.println(target);
		// 이메일과 인증 코드 가져오기
		String temporaryPassword;
		if (verificationCode != null && verificationCode.equals(enteredCode)) {
			// 임시 비밀번호 발급 로직
			temporaryPassword = SocialService.generateTemporaryPassword();
			if ("1".equals(method)) {
				// 이메일로 발급
				try {
					SocialService.sendEmail(target, "슬림베어 임시 비밀번호 발급", temporaryPassword);

					RSYService.replacePasswordByEmail(target, passwordEncoder.encode(temporaryPassword));
					return "/find_password_result"; // 비밀번호 찾기 완료 페이지로 이동
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else if ("2".equals(method)) {
				// 휴대폰으로 발급
				SocialService.sendTemporaryPassword(target, temporaryPassword);
				RSYService.replacePasswordByPhone(target, passwordEncoder.encode(temporaryPassword));

				return "/find_password_result"; // 비밀번호 찾기 완료 페이지로 이동
			}
			return "/find_password_result"; // 비밀번호 찾기 완료 페이지로 이동
		} else {
			// 인증 코드 확인 실패 시 다시 입력 페이지로 이동
			return "/find_password";
		}
	}

}

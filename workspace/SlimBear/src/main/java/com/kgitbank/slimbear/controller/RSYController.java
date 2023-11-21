package com.kgitbank.slimbear.controller;

import java.security.SecureRandom;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

		List<ProductDTO> productList = RSYService.getProductListByCategory(category, order, currentPage, offset,
				pageSize);

		model.addAttribute("order", order);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("productList", productList);
		model.addAttribute("totalItems", totalItems);

		List<CategoryDTO> categoryList = RSYService.getSubCategoryListByTopCtgUid(category);

		model.addAttribute("categoryList", categoryList);

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

	@PostMapping("/findPassword") // 비밀번호 찾기
	public String findPassword(@RequestParam String name, @RequestParam String id,
			@RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "phone", required = false) String phone,
			Model model) {

		String temporaryPassword = name + "회원님의 임시 비밀번호는 " + generateTemporaryPassword() + " 입니다.";
		String subject = "슬림베어 임시 비밀번호 발급";
		// 이메일 발송
		String resultMessage;

		MemberDTO member = RSYService.findPassword(name, id, email, phone);
		if (member != null) {
	        model.addAttribute("member", member);
	        System.out.println(phone);
	        System.out.println(email);
	        // 휴대폰 번호가 비어있지 않으면 문자 발송
	        if (phone != null && !phone.isEmpty()) {
	            SocialService.sendTemporaryPassword(phone, temporaryPassword);
	        }

	        // 이메일이 비어있지 않으면 이메일 발송
	        if (email != null && !email.isEmpty()) {
	            try {
	                resultMessage = SocialService.sendEmail(email, subject, temporaryPassword);
	                model.addAttribute("messageSent", resultMessage.equals("Email sent successfully!"));
	            } catch (MessagingException e) {
	                e.printStackTrace();
	                return "error-pages/emailSendError";  // 에러 페이지 경로를 정확하게 지정
	            }
	        }

	        return "/find_password_result";

	    } else {
	        model.addAttribute("error", "회원정보를 찾을 수 없습니다. 다시 입력해주세요.");
	        return "/find_password"; // 실패 시 해당 페이지로 이동
	    }

	}

	// 임시 비밀번호 생성
	private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	private static final int PASSWORD_LENGTH = 10;

	public static String generateTemporaryPassword() {
		SecureRandom random = new SecureRandom();
		StringBuilder password = new StringBuilder();

		for (int i = 0; i < PASSWORD_LENGTH; i++) {
			int randomIndex = random.nextInt(CHARACTERS.length());
			password.append(CHARACTERS.charAt(randomIndex));
		}

		return password.toString();
	}
}

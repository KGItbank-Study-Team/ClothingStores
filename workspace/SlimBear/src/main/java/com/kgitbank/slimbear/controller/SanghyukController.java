package com.kgitbank.slimbear.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.service.SangyhyukServiceImpl;

@Controller
public class SanghyukController {
	
	@Autowired
	private SangyhyukServiceImpl sanghService;
	
	/* 상품 상세 데이터 CONTROLLER */
	@RequestMapping("product")
	public String productPage(@RequestParam("p")long productUid, HttpSession session, Model model)  {
		
		// 제품 상세 정보 가져오기
		ProductDTO product = sanghService.getProductByUid(productUid);	
		System.out.println(product);
		// 잘못된 UID일 경우 메인페이지로
		if(product == null) {
			return "redirct:/";
		}
			
		// 모든 제품 리뷰 가져오기
		List<ReviewDTO> reviewList = sanghService.getReviewList();
		System.out.println(reviewList);
		
		// 제품의 옵션 가져오기
		List<ProductDetailDTO> productDetailList = sanghService.getProductDetailList(productUid);
		
		// 제품의 inquiry 가져오기
		List<InquiryDTO> inquiryList = sanghService.getInquiryListByProdUid(productUid);
		System.out.println(inquiryList);
		model.addAttribute("product", product);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("productDetailList", productDetailList);
		model.addAttribute("inquiryList", inquiryList);

		return "productInfo"; // .jsp 생략
	}

	// 장바구니에 상품 추가
	@RequestMapping("/add/cart/{uid}")
	public @ResponseBody String insertInCart(@RequestParam("uid") int mem_uid, HttpSession session) {
		MemberDTO member = (MemberDTO) session.getAttribute("uid");
		String id = member.getId(); // 회원의 아이디를 받아옴. -> 회원의 장바구니 검사해여지.
		
		CartDTO cartDTO = new CartDTO();
		cartDTO.setMem_uid(mem_uid);
		cartDTO.setProd_code(prod_code);
		boolean isAreadyExisted=sanghService.findProducts(cartDTO);
		System.out.println("isAreadyExisted"+isAreadyExisted);
		if(isAreadyExisted==true) {
			return "alreay_existed";
		} else {
			sanghService.insertInCart(cartDTO);
			return "add_success";
		}
	}
}
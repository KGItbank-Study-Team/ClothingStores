package com.kgitbank.slimbear.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.service.ProductServiceImpl;
import com.kgitbank.slimbear.service.SangyhyukServiceImpl;

@Controller
public class SanghyukController {
	
	/* 리뷰 데이터 CONTROLLER */
	@Autowired
	private SangyhyukServiceImpl sanghService;
	
//	@RequestMapping("product")
//	public String reviewPage(HttpSession session, Model model) throws Exception {
//		List<ReviewDTO> reviewList = sanghService.getReviewList();
//		
//		System.out.println(reviewList);
//		model.addAttribute("reviews", reviewList);
//		return "productInfo"; // .jsp 생략
//	}
	
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
		
		model.addAttribute("product", product);
		model.addAttribute("reviewList", reviewList);

		return "productInfo"; // .jsp 생략
	}
}

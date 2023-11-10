package com.kgitbank.slimbear.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.service.SangyhyukServiceImpl;

@Controller
public class SanghyukController {
	
	@Autowired
	private SangyhyukServiceImpl sanghService;
	
	@RequestMapping("board/review")
	public String reviewPage(HttpSession session, Model model) {
		List<ReviewDTO> list = sanghService.getReviewList();
		
		ReviewDTO revie = new ReviewDTO();
		

		model.addAttribute("reviewList", list);
		
		return "review_page"; 
	}
}

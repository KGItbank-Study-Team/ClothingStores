package com.kgitbank.slimbear.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.admin.dto.RSYAdminDTO;
import com.kgitbank.slimbear.admin.service.RSYAdminServiceImpl;
import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.service.SangyhyukServiceImpl;

@Controller
public class RSYAdminController {

	@Autowired
	private SangyhyukServiceImpl sanghService;
	
	@Autowired
	private RSYAdminServiceImpl rsyAdminService;
	
	
	//리뷰관리페이지
	@RequestMapping("home/board/review")
	public String boardReview(Model model) {
		
		model.addAttribute("reviewList", sanghService.getReviewList());
		return "tables-board-review";
	}	
	@GetMapping("review/list")
	@ResponseBody
	public List<ReviewDTO> boardReviewList(){
		
		List<ReviewDTO> reviewList = sanghService.getReviewList();
		
		return reviewList;
	}	
	@RequestMapping("review/getComment")
	@ResponseBody
	public RSYAdminDTO boardReviewGetComment(@RequestParam(name="reviewUID" , required=false)Long reviewUID) {
	
		RSYAdminDTO comment = rsyAdminService.getComment(reviewUID);
		return comment;
	}	
//	@PostMapping("review/setComment")
//	public String boardReviewSetComment()
	
	@RequestMapping("home/board/review/detail")
	public String reviewPage(@RequestParam(name = "reviewUID", required = false) Long reviewUID, Model model) {
	    if (reviewUID != null) {
	    	ReviewDTO review = rsyAdminService.getReviewByReviewUid(reviewUID);
	        if (review == null) {
	            return "redirect:home/board/review";
	        } else {
	            RSYAdminDTO comment = rsyAdminService.getComment(reviewUID);
	            model.addAttribute("review", review);
	            model.addAttribute("comment", comment);
	            return "review-detail";
	        }
	    } else {
	        return "redirect:home/board/review";
	    }
	}	
	@RequestMapping("review/addOrUpdateComment")
	@ResponseBody
	public ResponseEntity<String> addOrUpdateComment(@RequestParam Long reviewUID, @RequestParam String commentTitle, @RequestParam String commentContent, @RequestParam String mem_id ) {
		 
		try {
            rsyAdminService.addOrUpdateComment(reviewUID, commentTitle, commentContent, mem_id);
            return ResponseEntity.ok("답글이 성공적으로 추가/수정되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("답글 추가/수정 중에 오류가 발생했습니다.");
        }			      
	}
	
	
	//문의관리페이지
	



	
}

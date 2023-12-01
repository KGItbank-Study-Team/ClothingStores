package com.kgitbank.slimbear.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.admin.dto.RSYAdminDTO;
import com.kgitbank.slimbear.admin.service.RSYAdminServiceImpl;
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.service.SangyhyukServiceImpl;
import com.kgitbank.slimbear.service.YangBoardServiceImpl;
import com.kgitbank.slimbear.vo.ReviewVO;

@Controller
public class RSYAdminController {

	@Autowired
	private SangyhyukServiceImpl sanghService;

	@Autowired
	private YangBoardServiceImpl yangService;
	@Autowired
	private RSYAdminServiceImpl rsyAdminService;

	// 리뷰관리페이지
	@RequestMapping("home/board/review")
	public String boardReview(Model model) {

		model.addAttribute("reviewList", sanghService.getReviewList());
		return "tables-board-review";
	}

	@GetMapping("review/list")
	@ResponseBody
	public List<ReviewVO> boardReviewList() {
		List<ReviewVO> reviewList = rsyAdminService.getReviewList();
		return reviewList;
	}

	@RequestMapping("review/getComment")
	@ResponseBody
	public RSYAdminDTO boardReviewGetComment(@RequestParam(name = "reviewUID", required = false) Long reviewUID) {
		RSYAdminDTO comment = rsyAdminService.getComment(reviewUID);
		return comment;
	}

	@RequestMapping("review/addOrUpdateComment")
	@ResponseBody
	public ResponseEntity<String> addOrUpdateComment(@RequestParam Long reviewUID, @RequestParam String commentTitle,
			@RequestParam String commentContent, @RequestParam String mem_id) {
		try {
			rsyAdminService.addOrUpdateComment(reviewUID, commentTitle, commentContent, mem_id);
			return ResponseEntity.ok("답글이 성공적으로 추가/수정되었습니다.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("답글 추가/수정 중에 오류가 발생했습니다.");
		}
	}

	// 문의관리페이지
	@RequestMapping("home/board/inquiry")
	public String boardInquiry(Model model) {

		model.addAttribute("inquiryList", yangService.getInquiryListAll());
		return "tables-board-inquiry";
	}

	@GetMapping("inquiry/list")
	@ResponseBody
	public List<InquiryDTO> boardInquiryList() {
		List<InquiryDTO> inquiryList = yangService.getInquiryListAll();
		return inquiryList;
	}
	@RequestMapping("inquiry/getAnswer")
	@ResponseBody
	public InquiryAnswerDTO boardinquiryGetAnswer(@RequestParam(name = "uid", required = false) Long uid) {
		InquiryAnswerDTO annswer = yangService.getAnswerDetail(uid);
		return annswer;
	}
	@RequestMapping("inquiry/addOrUpdateAnswer")
	@ResponseBody
	public ResponseEntity<String> addOrUpdateAnswer(@RequestParam Long inqr_uid, @RequestParam String answerTitle,
			@RequestParam String answerContent, @RequestParam String mem_id) {
		try {
			System.out.println(inqr_uid);
			System.out.println(answerTitle);
			System.out.println(answerContent);
			System.out.println(mem_id);
			rsyAdminService.addOrUpdateAnswer(inqr_uid, answerTitle, answerContent, mem_id);
			return ResponseEntity.ok("답글이 성공적으로 추가/수정되었습니다.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("답글 추가/수정 중에 오류가 발생했습니다.");
		}
	}
}

package com.kgitbank.slimbear.admin.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.admin.dto.RSYAdminDTO;
import com.kgitbank.slimbear.admin.service.RSYAdminServiceImpl;
import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.NoticeDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;
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
		Date reg_date = new Date();
		try {
			System.out.println(inqr_uid);
			System.out.println(answerTitle);
			System.out.println(answerContent);
			System.out.println(mem_id);
			System.out.println(reg_date);
			rsyAdminService.addOrUpdateAnswer(inqr_uid, answerTitle, answerContent, mem_id, reg_date);
			return ResponseEntity.ok("답글이 성공적으로 추가/수정되었습니다.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("답글 추가/수정 중에 오류가 발생했습니다.");
		}
	}

//    @PostMapping("inquiry/hideData")
//    @ResponseBody
//    public ResponseEntity<String> hideData(@RequestBody InquiryDTO data) {
//        // 클라이언트로부터 전달받은 데이터를 이용하여 숨김 작업 수행
//        rsyAdminService.hideData(data);
//        return ResponseEntity.ok("숨김이 완료되었습니다.");
//    }

	@DeleteMapping("inquiry/deleteData")
	@ResponseBody
	public ResponseEntity<String> deleteData(@RequestBody InquiryDTO data) {
		// 클라이언트로부터 전달받은 데이터를 이용하여 삭제 수행
		System.out.println(data);
		rsyAdminService.deleteInquiry(data);
		return ResponseEntity.ok("삭제가 완료되었습니다.");
	}

	@DeleteMapping("review/deleteData")
	@ResponseBody
	public ResponseEntity<String> deleteData(@RequestBody ReviewDTO data) {
		// 클라이언트로부터 전달받은 데이터를 이용하여 삭제 수행
		System.out.println(data);
		rsyAdminService.deleteReview(data);
		return ResponseEntity.ok("삭제가 완료되었습니다.");
	}

	// 공지사항관리
	@RequestMapping("home/board/notice")
	public String boardNotice(Model model) {

		model.addAttribute("noticeList", rsyAdminService.getNoticeList());
		return "tables-board-notice";
	}

	@GetMapping("notice/list")
	@ResponseBody
	public List<NoticeDTO> boardNoticeList() {
		List<NoticeDTO> noticeList = rsyAdminService.getNoticeList();
		return noticeList;
	}
	
	@DeleteMapping("notice/deleteData")
	@ResponseBody
	public ResponseEntity<String> deleteData(@RequestBody NoticeDTO data) {
		// 클라이언트로부터 전달받은 데이터를 이용하여 삭제 수행
		System.out.println(data);
		rsyAdminService.deleteNotice(data);
		return ResponseEntity.ok("삭제가 완료되었습니다.");
	}

	// faq관리
	@RequestMapping("home/board/faq")
	public String boardFaq(Model model) {

		model.addAttribute("faqList", rsyAdminService.getFaqList());
		return "tables-board-faq";
	}

	@GetMapping("faq/list")
	@ResponseBody
	public List<FaqDTO> boardFaqList() {
		List<FaqDTO> faqList = rsyAdminService.getFaqList();
		return faqList;
	}
	@DeleteMapping("faq/deleteData")
	@ResponseBody
	public ResponseEntity<String> deleteData(@RequestBody FaqDTO data) {
		// 클라이언트로부터 전달받은 데이터를 이용하여 삭제 수행
		System.out.println(data);
		rsyAdminService.deleteFaq(data);
		return ResponseEntity.ok("삭제가 완료되었습니다.");
	}

}

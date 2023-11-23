package com.kgitbank.slimbear.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.NoticeDTO;
import com.kgitbank.slimbear.service.YangBoardServiceImpl;

@Controller
public class YangController {
	@Autowired
	private YangBoardServiceImpl boardService;

	// 공지사항
	@RequestMapping("/board/notice")
	public String getBoardNoticeList(Model model) {
		model.addAttribute("notices", boardService.getNoticeList(0));
		return "notice";
	}

	// 공지사항 상세페이지조회
	@RequestMapping("/board/notice/detail/{uid}")
	public String getNoticeDetail(@PathVariable Long uid, Model model) {
		NoticeDTO notices = boardService.getNoticeDetail(uid);
		model.addAttribute("notices", notices);
		return "board_notice";
	}

	@RequestMapping("/article/notice")
	public String getBoardNotice(Model model) {
		model.addAttribute("notices", boardService.getNoticeList(0));
		return "board_notice";
	}

	// 문의사항
	@RequestMapping("/board/inquiry")
	public String getBoardInquiryList(
			@RequestParam(name = "category_no", required = false, defaultValue = "0") String categoryNo, Model model) {
		List<InquiryDTO> inquiries;
		switch (categoryNo) {
		case "1":
			inquiries = boardService.getInquiryList("DELIVERY");
			break;
		case "2":
			inquiries = boardService.getInquiryList("DELIVERY_C");
			break;
		default:
			inquiries = boardService.getInquiryList("PRODUCT");
		}
		model.addAttribute("inquiries", inquiries);
		return "inquiry";
	}

	// 문의사항 상세페이지조회
	@RequestMapping("/board/inquiry/detail/{uid}")
	public String getInquiryDetail(@PathVariable Long uid, Model model) {
		InquiryDTO inquiries = boardService.getInquiryDetail(uid);
		model.addAttribute("inquiries", inquiries);
		return "board_inquiry";
	}

	// 문의게시글 작성
	@PostMapping("/board/inquiry")
	public String submitInquiry(@ModelAttribute InquiryDTO inquiryDTO) {
		// Spring Security를 통해 현재 로그인한 사용자의 ID 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
	    
		// 문의사항에 따른 TYPE값 설정
		if ("상품 문의합니다 ♡".equals(inquiryDTO.getTitle())) {
			inquiryDTO.setType("PRODUCT");
		} else if ("배송 문의합니다 ♡".equals(inquiryDTO.getTitle())) {
			inquiryDTO.setType("DELIVERY");
		} else if ("불량/오배송 문의합니다 ♡".equals(inquiryDTO.getTitle())) {
			inquiryDTO.setType("DELIVERY_C");
		}

		// 현재 로그인한 사용자의 ID를 MemberDTO의 name으로 설정
	    inquiryDTO.setName(currentUserName);

		// reg_date 설정(현재 시간)
		inquiryDTO.setReg_date(new Date());

		// DAO로 전달
		boardService.insertInquiry(inquiryDTO);

		// 다른 처리나 페이지로 리다이렉트 등을 수행할 수 있음
		return "redirect:/app/board/inquiry";
	}

	// 문의게시글 삭제 작성
	@RequestMapping(value = "/board/inquiry/detail/delete/{uid}", method = RequestMethod.GET)
	public String deleteInquiry(@PathVariable("uid") Long uid) {
	    // Inquiry 삭제
	    boardService.deleteInquiry(uid);
	    // Inquiry 목록 페이지로 리디렉션
	    return "redirect:/app/board/inquiry";
	}
	
	

	// 문의사항 수정페이지
	@GetMapping("/board/inquiry/detail/update/{uid}")
	public String showUpdateForm(@PathVariable Long uid, Model model) {
	    // 여기에서 기존 게시물 정보를 가져와서 수정 폼에 전달하는 로직을 추가하세요
	    InquiryDTO existingInquiry = boardService.getInquiryDetail(uid);
	    model.addAttribute("inquiries", existingInquiry);

	    // 수정 폼을 보여주는 뷰 페이지 경로를 반환
	    return "board_update";
	}
	// 문의사항 수정처리
	@PostMapping("/board/inquiry/detail/update/{uid}")
	public String updateInquiry(@PathVariable Long uid, @ModelAttribute InquiryDTO updatedInquiry) {
	    // 기존 게시물 정보를 가져오기
	    InquiryDTO existingInquiry = boardService.getInquiryDetail(uid);

	    // 가져온 정보에서 수정이 필요한 부분만 업데이트
	    existingInquiry.setContent(updatedInquiry.getContent());
	    if (updatedInquiry.getStatus() != null) {
	        existingInquiry.setStatus(updatedInquiry.getStatus());
	    }
	    // 수정된 정보를 DAO를 통해 업데이트
	    boardService.updateInquiry(existingInquiry);

	    // 수정 완료 후 리다이렉트 등 필요한 처리 수행
	    return "redirect:/app/board/inquiry/detail/" + uid;
	}
	
	
	
	
	// 문의사항 수정 페이지
//    @RequestMapping("/board/inquiry/detail/update/{uid}")
//    public String getInquiryEdit(@PathVariable Long uid, Model model) {
//        // InquiryDTO를 가져와 모델에 추가
//        InquiryDTO inquiries = boardService.getInquiryDetail(uid);
//        model.addAttribute("inquiries", inquiries);
//        return "board_update"; // 수정 페이지로 이동
//    }
//    
//    // 문의게시글 수정 작성
//    // 게시물 수정 처리
//    @PostMapping("/board/inquiry/detail/update/{uid}")
//    public String submitUpdatedInquiry(@PathVariable Long uid, @ModelAttribute InquiryDTO updatedInquiry) {
//        // Spring Security를 통해 현재 로그인한 사용자의 ID 가져오기
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        String currentUserId = authentication.getName();
//
//        // 기존 게시물 정보 조회
//        InquiryDTO existingInquiry = boardService.getInquiryDetail(uid);
//
//        // 현재 로그인한 사용자의 ID를 writer_id로 설정
//        updatedInquiry.setWriter_id(currentUserId);
//
//        // 수정된 내용으로 기존 게시물 업데이트
//        existingInquiry.setContent(updatedInquiry.getContent());
//        existingInquiry.setStatus(updatedInquiry.getStatus());
//
//        // DAO로 전달하여 수정 처리
//        boardService.updateInquiry(existingInquiry);
//
//        // 다른 처리나 페이지로 리다이렉트 등을 수행할 수 있음
//        return "redirect:/app/board/inquiry/detail/" + uid;
//    }

    
//    @PostMapping("/board/inquiry/detail/update/{uid}")
//    public String updateInquiry(@PathVariable("uid") Long uid, @ModelAttribute InquiryDTO updatedInquiry) {
//        // 기존 게시물 정보 조회
//        InquiryDTO existingInquiry = boardService.getInquiryDetail(uid);
//
//        // 수정된 내용으로 기존 게시물 업데이트
//        existingInquiry.setContent(updatedInquiry.getContent());
//        existingInquiry.setStatus(updatedInquiry.getStatus());
//        
//        // 게시물 업데이트
//        boardService.updateInquiry(existingInquiry);
//
//        // 수정 후 상세 페이지로 리디렉션
//        return "redirect:/app/board/inquiry/detail/" + uid;
//    }
	
	
	
	
	// 자주묻는질문
	@RequestMapping("/board/faq")
	public String getBoardFaqList(
			@RequestParam(name = "category_no", required = false, defaultValue = "0") String categoryNo, Model model) {
		List<FaqDTO> faqs;

		switch (categoryNo) {
		case "1":
			faqs = boardService.getFaqListByType("PRODUCT_R");
			break;
		case "2":
			faqs = boardService.getFaqListByType("DELIVERY_R");
			break;
		case "3":
			faqs = boardService.getFaqListByType("CHANGE_R");
			break;
		case "4":
			faqs = boardService.getFaqListByType("ETC_R");
			break;
		case "5":
			faqs = boardService.getFaqListByType("SHOWROOM_R");
			break;
		default:
			faqs = boardService.getFaqList();
		}

		model.addAttribute("faqs", faqs);
//        model.addAttribute("boardUsers", boardService.getBoardUserList());

		return "faq";
	}

	// 게시글 작성
	@GetMapping(value = "/board/write")
	public String getBoardWriteForm() {
		return "board_write";
	}

	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String postBoardWrite(@ModelAttribute InquiryDTO inquiryDTO) {
		boardService.insertInquiry(inquiryDTO);
		return "redirect:/board/inquiry";
	}

}

package com.kgitbank.slimbear.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kgitbank.slimbear.common.SlimBearS3;
import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.NoticeDTO;
import com.kgitbank.slimbear.service.YangBoardServiceImpl;

@Controller
public class YangController {
	@Autowired
	private YangBoardServiceImpl boardService;
	@Autowired
	private SlimBearS3 slimbearS3;
	
	// 공지사항목록
	@RequestMapping("/board/notice")
	public String getBoardNoticeList(
    		@RequestParam(name = "currentPage", defaultValue = "1", required = false) int currentPage, Integer offset, Integer pageSize, Model model) {
		
		if (offset == null) {
			offset = 0;
		}
		pageSize = 15; // 페이지 당 아이템 수
		
		// 페이징에 관련된 정보 추가
		int totalItems = boardService.getTotalNotice(); // 전체아이템 수
		int totalPages = (int) Math.ceil((double) totalItems / pageSize); // 전체 페이지 수
		int pageBlockSize = 5; // 보여질 페이지 블록 크기

		// 현재 페이지 블록의 시작 페이지와 끝 페이지 계산
		int startPage = ((currentPage - 1) / pageBlockSize) * pageBlockSize + 1;
		int endPage = Math.min(startPage + pageBlockSize - 1, totalPages);

		// 다음 페이지 블록이 있는지 여부
		boolean hasNextBlock = endPage < totalPages;
		
		// 서비스 메서드 호출 시에 offset과 pageSize를 전달
	    List<NoticeDTO> notices = boardService.getNoticeList((currentPage - 1) * pageSize, pageSize, currentPage);
		
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("hasNextBlock", hasNextBlock);
        model.addAttribute("totalItems", totalItems);
        // 'notices' 변수를 모델에 추가
        model.addAttribute("notices", notices);
//		model.addAttribute("notices", boardService.getNoticeList(0));
		return "notice";
	}
	
	// 공지사항 상세페이지조회
	@RequestMapping("/board/notice/detail/{uid}")
	public String getNoticeDetail(@PathVariable Long uid, Model model) {
		NoticeDTO notices = boardService.enterNoticeDetail(uid);
		model.addAttribute("notices", notices);
		return "board_notice";
	}
	
	@RequestMapping("/article/notice")
	public String getBoardNotice(Model model) {
		model.addAttribute("notices", boardService.getNoticeList(0, null, 0));
		return "board_notice";
	}
	
	// 문의사항 목록
	@RequestMapping("/board/inquiry")
    public String getBoardInquiryList(
    		@RequestParam(name = "category_no", required = false, defaultValue = "PRODUCT") String categoryNo, 
    		@RequestParam(name = "currentPage", defaultValue = "1", required = false) int currentPage, Integer offset, Integer pageSize, Model model) {
		
		if (offset == null) {
			offset = 0;
		}
		pageSize = 15; // 페이지 당 아이템 수
		
		// 페이징에 관련된 정보 추가
		int totalItems = boardService.getTotalInquiry(categoryNo); // 전체아이템 수
		int totalPages = (int) Math.ceil((double) totalItems / pageSize); // 전체 페이지 수
		int pageBlockSize = 5; // 보여질 페이지 블록 크기

		// 현재 페이지 블록의 시작 페이지와 끝 페이지 계산
		int startPage = ((currentPage - 1) / pageBlockSize) * pageBlockSize + 1;
		int endPage = Math.min(startPage + pageBlockSize - 1, totalPages);

		// 다음 페이지 블록이 있는지 여부
		boolean hasNextBlock = endPage < totalPages;
		
		 List<InquiryDTO> inquiries;
		switch (categoryNo) {
        case "DELIVERY":
            inquiries = boardService.getInquiryList("DELIVERY", offset, pageSize, currentPage);
            break;
        case "DELIVERY_C":
            inquiries = boardService.getInquiryList("DELIVERY_C", offset, pageSize, currentPage);
            break;
        default:
            inquiries = boardService.getInquiryList("PRODUCT", offset, pageSize, currentPage);
		}
		
        model.addAttribute("inquiries", inquiries);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("hasNextBlock", hasNextBlock);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("categoryNo", categoryNo); // 카테고리 정보도 전달
        return "inquiry";
    }
	
	// 문의사항 상세페이지조회
	@RequestMapping("/board/inquiry/detail/{uid}")
	public String getInquiryDetail(@PathVariable Long uid, Model model) {
		InquiryDTO inquiries = boardService.getInquiryDetail(uid);
		model.addAttribute("inquiries", inquiries);
		return "board_inquiry";
	}
	
	// 문의사항 답변게시글 상세페이지조회
	@RequestMapping("/board/inquiry/answer/detail/{uid}")
	public String getAnswerDetail(@PathVariable Long uid, Model model) {
		InquiryAnswerDTO answer = boardService.getAnswerDetail(uid);
		model.addAttribute("answer", answer);
		return "board_answer";
	}
	
	// 문의게시글 작성
	@PostMapping("/board/inquiry")
	public String submitInquiry(@ModelAttribute InquiryDTO inquiryDTO,
			@RequestParam("attachImage1") MultipartFile attachImage1,
            @RequestParam("attachImage2") MultipartFile attachImage2,
            @RequestParam("attachImage3") MultipartFile attachImage3,
            @RequestParam("attachImage4") MultipartFile attachImage4,
            RedirectAttributes redirectAttributes) {
		
	    // Spring Security를 통해 현재 로그인한 사용자의 ID 가져오기
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String currentUserId = authentication.getName();
	    
	    inquiryDTO.setWriter_id(currentUserId);
	    inquiryDTO.setReg_date(new Date());
	    // 파일을 업로드하고 경로를 받아오는 로직 추가
	    if (!attachImage1.isEmpty()) {
	        String filePath1 = slimbearS3.saveImage(attachImage1);
	        inquiryDTO.setAttach_image1(filePath1);
	    }

	    if (!attachImage2.isEmpty()) {
	        String filePath2 = slimbearS3.saveImage(attachImage2);
	        inquiryDTO.setAttach_image2(filePath2);
	    }

	    if (!attachImage3.isEmpty()) {
	        String filePath3 = slimbearS3.saveImage(attachImage3);
	        inquiryDTO.setAttach_image3(filePath3);
	    }

	    if (!attachImage4.isEmpty()) {
	        String filePath4 = slimbearS3.saveImage(attachImage4);
	        inquiryDTO.setAttach_image4(filePath4);
	    }
	    // DAO로 전달
	    boardService.insertInquiry(inquiryDTO);
	    
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
	
	// 문의게시글 검색
	@GetMapping("/board/inquiryS")
	public String searchInquiries(
	        @RequestParam(name = "search_key", required = false) String searchKey,
	        @RequestParam(name = "searchs", required = false) String searchs,
	        Model model) {
		
		// 로그로 값 확인
	    System.out.println("search_key: " + searchKey);
	    System.out.println("searchs: " + searchs);

	    // null 체크 및 빈 문자열(trim) 체크
	    if (searchKey != null && searchs != null && !searchs.trim().isEmpty()) {
	        Map<String, String> searchMap = new HashMap<>();
	        searchMap.put("searchKey", searchKey);
	        searchMap.put("searchs", searchs);
	        List<InquiryDTO> inquiryList = boardService.getInquiryListBySearch(searchMap);
	        model.addAttribute("inquiries", inquiryList);
	    } else {
	        // 검색 조건이 부족하면 모든 목록을 보여줍니다.
	        List<InquiryDTO> inquiries = boardService.getInquiryListAll();
	        model.addAttribute("inquiries", inquiries);
	    }
	    
	    return "inquiry"; // 실제 뷰
	}
	
	
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

		return "faq";
	}
	
	
	// 게시글 작성 페이지
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

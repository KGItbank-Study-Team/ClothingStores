package com.kgitbank.slimbear.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.service.YangBoardServiceImpl;

@Controller
public class YangController {
	@Autowired
	private YangBoardServiceImpl boardService;

	// 공지사항
	@RequestMapping("/board/notice")
	public String getBoardNoticeList(Model model) {
		model.addAttribute("boards", boardService.getBoardNoticeList());
		model.addAttribute("boardUsers", boardService.getBoardUserList());
		return "notice"; // 뷰 이름 설정
	}

	@RequestMapping("/article/notice")
	public String getBoardNotice(Model model) {
		model.addAttribute("boards", boardService.getBoardNoticeList());
		return "board_notice";
	}

	// 문의사항
	@RequestMapping("/board/inquiry")
	public String getBoardInquiryList(
			@RequestParam(name = "category_no", required = false, defaultValue = "0") String categoryNo, Model model) {
		List<InquiryDTO> inquiries;

		switch (categoryNo) {
		case "1":
			inquiries = boardService.getBoardInquiryListByType("배송문의");
			break;
		case "2":
			inquiries = boardService.getBoardInquiryListByType("배송 전 변경/취소");
			break;
		default:
			inquiries = boardService.getBoardInquiryListByType("상품문의");
		}
		model.addAttribute("inquiries", inquiries);
		model.addAttribute("boardUsers", boardService.getBoardUserList());

		return "inquiry";
	}

	/*
	 * @RequestMapping("/board/inquiry") public String
	 * getBoardInquiryList(@RequestParam(name = "category_no", required = false,
	 * defaultValue = "0") String categoryNo, Model model) { List<InquiryDTO>
	 * inquiries;
	 * 
	 * switch (categoryNo) { case "1": // 추가적인 로직이 필요하다면
	 * boardService.getBoardInquiry2List()로 변경 inquiries =
	 * boardService.getBoardInquiryList(); break; case "2": // 추가적인 로직이 필요하다면
	 * boardService.getBoardInquiry3List()로 변경 inquiries =
	 * boardService.getBoardInquiryList(); break; default: inquiries =
	 * boardService.getBoardInquiryList(); } model.addAttribute("inquiries",
	 * inquiries); model.addAttribute("boardUsers",
	 * boardService.getBoardUserList());
	 * 
	 * return "inquiry"; }
	 */

	// 자주묻는질문
    @RequestMapping("/board/faq")
    public String getBoardFaqList(@RequestParam(name = "category_no", required = false, defaultValue = "0") String categoryNo, Model model) {
    	List<FaqDTO> faqs;
    	switch(categoryNo) {
    	case "1":
    		faqs = boardService.getBoardFaqListByType("상품관련");
			break;
    	case "2":
    		faqs = boardService.getBoardFaqListByType("배송관련");
			break;
    	case "3":
    		faqs = boardService.getBoardFaqListByType("교환/반품관련");
			break;
    	case "4":
    		faqs = boardService.getBoardFaqListByType("기타관련");
			break;
    	case "5":
    		faqs = boardService.getBoardFaqListByType("쇼룸관련");
			break;
		default:
			faqs = boardService.getBoardFaqList();
    	}
    	model.addAttribute("faqs", faqs);
    	
    	return "faq";
    }

	/*
	 * @RequestMapping("/board/faq") public String getBoardFaqList(
	 * 
	 * @RequestParam(name = "category_no", required = false, defaultValue = "0")
	 * String categoryNo, Model model) { List<FaqDTO> faqs; switch (categoryNo) {
	 * case "1": faqs = boardService.getBoardFaqListByType("2"); break; case "2":
	 * faqs = boardService.getBoardFaqListByType("3"); break; case "3": faqs =
	 * boardService.getBoardFaqListByType("4"); break; case "4": faqs =
	 * boardService.getBoardFaqListByType("5"); break; case "5": faqs =
	 * boardService.getBoardFaqListByType("6"); break; default: faqs =
	 * boardService.getBoardFaqList(); } model.addAttribute("faqs", faqs);
	 * model.addAttribute("boardUsers", boardService.getBoardUserList());
	 * 
	 * return "faqs"; }
	 */

	/*
	 * @RequestMapping("/board/faq") public String
	 * getBoardFaqList(@RequestParam(name = "category_no", required = false,
	 * defaultValue = "0") String categoryNo, Model model) {
	 * ArrayList<BoardFaqListVO> boards;
	 * 
	 * try { switch(categoryNo) { case "1": boards =
	 * boardService.getBoardFaq1List(); break; case "2": boards =
	 * boardService.getBoardFaq2List(); break; case "3": boards =
	 * boardService.getBoardFaq3List(); break; case "4": boards =
	 * boardService.getBoardFaq4List(); break; case "5": boards =
	 * boardService.getBoardFaq5List(); break; default: boards =
	 * boardService.getBoardFaqList(); } model.addAttribute("boards", boards); }
	 * catch (Exception e) { e.printStackTrace(); model.addAttribute("errorMessage",
	 * "조회 중 오류가 발생했습니다."); } return "faq"; }
	 */
    
    
    
	// 게시글쓰기
	@RequestMapping("/board/write")
	public String getBoardWrite(Model model) {
		model.addAttribute("boards", boardService.getBoardWrite());
		return "board_write"; // 뷰 이름 설정
	}

}

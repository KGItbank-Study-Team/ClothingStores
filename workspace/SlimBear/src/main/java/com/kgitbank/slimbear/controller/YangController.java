package com.kgitbank.slimbear.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
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
	
	@RequestMapping("/article/notice")
	public String getBoardNotice(Model model) {
		model.addAttribute("notices", boardService.getNoticeList(0));
		return "board_notice";
	}
	
	
	// 문의사항
	@RequestMapping("/board/inquiry")
    public String getBoardInquiryList(@RequestParam(name = "category_no", required = false, defaultValue = "0") String categoryNo, Model model) {
        List<InquiryDTO> inquiries;
        List<NoticeDTO> notices;
        switch (categoryNo) {
            case "1":
                inquiries = boardService.getInquiryList("DELIVERY");
                notices = boardService.getInquiryNList("DELIVERY");
                break;
            case "2":
                inquiries = boardService.getInquiryList("DELIVERY_C");
                notices = boardService.getInquiryNList("DELIVERY_C");
                break;
            default:
                inquiries = boardService.getInquiryList("PRODUCT");
                notices = boardService.getInquiryNList("PRODUCT");
        }
        model.addAttribute("inquiries", inquiries);
        model.addAttribute("notices", notices);
        return "inquiry";
    }
	
	
	// 게시글 작성
	@PostMapping("/app/board/inquiry")
    public String submitInquiry(@ModelAttribute InquiryDTO inquiryDTO) {
        // 상품 문의할 경우 TYPE값 설정
        if ("상품 문의합니다 ♡".equals(inquiryDTO.getTitle())) {
            inquiryDTO.setType("PRODUCT");
        }
        // 배송 문의할 경우 TYPE값 설정
        else if ("배송 문의합니다 ♡".equals(inquiryDTO.getTitle())) {
            inquiryDTO.setType("DELIVERY");
        }
        // 불량/오배송 문의할 경우 TYPE값 설정
        else if ("불량/오배송 문의합니다 ♡".equals(inquiryDTO.getTitle())) {
            inquiryDTO.setType("DELIVERY_C");
        }
        
        // reg_date 설정(현재 시간)
        inquiryDTO.setReg_date(new Date());
        // TITLE값을 CONTENT에 설정
        inquiryDTO.setContent(inquiryDTO.getTitle());
        // DAO로 전달
        boardService.insertInquiry(inquiryDTO);
        // 다른 처리나 페이지로 리다이렉트 등을 수행할 수 있음
        return "redirect:/app/board/inquiry/";
    }
	

	
	// 자주묻는질문
	@RequestMapping("/board/faq")
    public String getBoardFaqList(@RequestParam(name = "category_no", required = false, defaultValue = "0") String categoryNo, Model model) {
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
	
	
	/*
	 * @RequestMapping("/board/faq") public String getBoardFaqList(Model model) {
	 * List<FaqDTO> faqs = faqDAO.getFaqList(); model.addAttribute("faqs", faqs);
	 * return "faq"; }
	 */
	
	
	/*
	 * @RequestMapping("/board/faq") public String getBoardFaqList(
	 * 
	 * @RequestParam(name = "category_no", required = false, defaultValue = "0")
	 * String categoryNo, Model model) { List<FaqDTO> faqs; switch (categoryNo) {
	 * case "1": faqs = boardService.getBoardFaqListByType("PRODUCT_R"); break; case
	 * "2": faqs = boardService.getBoardFaqListByType("DELIVERY_R"); break; case
	 * "3": faqs = boardService.getBoardFaqListByType("CHANGE_R"); break; case "4":
	 * faqs = boardService.getBoardFaqListByType("ETC_R"); break; case "5": faqs =
	 * boardService.getBoardFaqListByType("SHOWROOM_R"); break; default: faqs =
	 * boardService.getBoardFaqList(); } model.addAttribute("faqs", faqs);
	 * 
	 * return "faq"; }
	 */

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
	@GetMapping(value = "/board/write")
    public String getBoardWriteForm() {
        return "board_write";
    }

    @RequestMapping(value = "/board/write", method = RequestMethod.POST)
    public String postBoardWrite(@ModelAttribute InquiryDTO inquiryDTO) {
        boardService.insertInquiry(inquiryDTO);
        return "redirect:/board/inquiry";
    }
	
	/*
	 * @RequestMapping("/board/write") public String getBoardWrite(Model model) {
	 * model.addAttribute("boards", boardService.getBoardWrite()); return
	 * "board_write"; // 뷰 이름 설정 }
	 */

}

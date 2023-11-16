package com.kgitbank.slimbear.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.service.YangBoardServiceImpl;

@Controller
public class YangController {
	@Autowired
	private YangBoardServiceImpl boardService;
//	@Autowired
//	private InquiryDAO inquiryDAO;
//	@Autowired
//	private FaqDAO faqDAO;

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
	// 한번 변경해본 코드
	@RequestMapping("/board/inquiry")
    public String getBoardInquiryList(@RequestParam(name = "category_no", required = false, defaultValue = "0") String categoryNo,
            Model model) {
        List<InquiryDTO> inquiries;

        switch (categoryNo) {
            case "1":
                inquiries = boardService.getInquiryListByType("DELIVERY");
                break;
            case "2":
                inquiries = boardService.getInquiryListByType("DELIVERY_C");
                break;
            default:
                inquiries = boardService.getInquiryListByType("PRODUCT");
        }

        model.addAttribute("inquiries", inquiries);
//        model.addAttribute("boardUsers", boardService.getBoardUserList());

        return "inquiry";
    }
	
	// 두번 변경해본 코드
	/*
	 * public String getBoardInquiryList(Model model) { // 전체 상품문의 조회
	 * List<InquiryDTO> inquiries = inquiryDAO.getInquiryList();
	 * model.addAttribute("inquiries", inquiries);
	 * 
	 * // 특정 prod_uid에 해당하는 상품문의 조회 long prodUid = 123L; // 원하는 prod_uid 값으로 변경
	 * List<InquiryDTO> inquiriesByProdUid =
	 * inquiryDAO.getInquiryListByProdUid(prodUid);
	 * model.addAttribute("inquiriesByProdUid", inquiriesByProdUid);
	 * 
	 * return "inquiry"; // 여러분이 사용하는 JSP 페이지의 이름을 반환합니다. }
	 */


	// 기존 코드
	/*
	 * @RequestMapping("/board/inquiry") public String getBoardInquiryList(
	 * 
	 * @RequestParam(name = "category_no", required = false, defaultValue = "0")
	 * String categoryNo, Model model) { List<InquiryDTO> inquiries;
	 * 
	 * switch (categoryNo) { case "1": inquiries =
	 * boardService.getBoardInquiryListByType("DELIVERY"); break; case "2":
	 * inquiries = boardService.getBoardInquiryListByType("DELIVERY_C"); break;
	 * default: inquiries = boardService.getBoardInquiryListByType("PRODUCT"); }
	 * model.addAttribute("inquiries", inquiries); model.addAttribute("boardUsers",
	 * boardService.getBoardUserList());
	 * 
	 * return "inquiry"; }
	 */

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

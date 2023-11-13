package com.kgitbank.slimbear.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.service.YangBoardServiceImpl;
import com.kgitbank.slimbear.vo.BoardFaqListVO;
import com.kgitbank.slimbear.vo.BoardInquiryListVO;

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
//    @RequestMapping("/board/inquiry")
//    public String getBoardInquiryList(Model model) {
//        model.addAttribute("boards", boardService.getBoardInquiryList());
//        model.addAttribute("boardUsers", boardService.getBoardUserList());
//        return "inquiry"; // 뷰 이름 설정
//    }
//    @RequestMapping("/board/inquiry/delivery")
//    public String getBoardInquiry2List(Model model) {
//        model.addAttribute("boards", boardService.getBoardInquiry2List());
//        model.addAttribute("boardUsers", boardService.getBoardUserList());
//        return "inquiry";
//    }
//    @RequestMapping("/board/inquiry/bipolar")
//    public String getBoardInquiry3List(Model model) {
//        model.addAttribute("boards", boardService.getBoardInquiry3List());
//        model.addAttribute("boardUsers", boardService.getBoardUserList());
//        return "inquiry";
//    }
//    
//    @RequestMapping("/article/inquiry")
//    public String getBoardInquiry(Model model) {
//    	model.addAttribute("boards", boardService.getBoardInquiryList());
//    	return "board_inquiry";
//    }
    @RequestMapping("/board/inquiry")
    public String getBoardInquiryList(@RequestParam(name = "category_no", required = false, defaultValue = "0") String categoryNo, Model model) {
    	ArrayList<BoardInquiryListVO> boards;
    	
    	try {
    		switch(categoryNo) {
    		case "1":
    			boards = boardService.getBoardInquiry2List();
    			break;
    		case "2":
    			boards = boardService.getBoardInquiry3List();
    			break;
    		default:
    			boards = boardService.getBoardInquiryList();
    		}
    		model.addAttribute("boards", boards);
    		model.addAttribute("boardUsers", boardService.getBoardUserList());
    	} catch (Exception e) {
	    	// 예외 처리 로직을 추가
    		// 실제로는 로그에 기록하거나 적절한 예외 처리를 수행해야 합니다.
	    	e.printStackTrace();
	    	// 예외가 발생한 경우에 대한 사용자에게 보여줄 메시지 등을 추가할 수 있습니다.
	    	model.addAttribute("errorMessage", "조회 중 오류가 발생했습니다.");
	    }
        return "inquiry";
    }
    
    
    // 자주묻는질문
    @RequestMapping("/board/faq")
    public String getBoardFaqList(@RequestParam(name = "category_no", required = false, defaultValue = "0") String categoryNo, Model model) {
    	ArrayList<BoardFaqListVO> boards;
    	
    	try {
	    	switch(categoryNo) {
		    	case "1":
		            boards = boardService.getBoardFaq1List();
		            break;
		        case "2":
		            boards = boardService.getBoardFaq2List();
		            break;
		        case "3":
		            boards = boardService.getBoardFaq3List();
		            break;
		        case "4":
		            boards = boardService.getBoardFaq4List();
		            break;
		        case "5":
		            boards = boardService.getBoardFaq5List();
		            break;
		        default:
		            boards = boardService.getBoardFaqList();
		    }
	    	model.addAttribute("boards", boards);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	model.addAttribute("errorMessage", "조회 중 오류가 발생했습니다.");
	    }
        return "faq";
    }
    
    
    // 게시글쓰기
    @RequestMapping("/board/write")
    public String getBoardWrite(Model model) {
        model.addAttribute("boards", boardService.getBoardWrite());
        return "board_write"; // 뷰 이름 설정
    }
    
}

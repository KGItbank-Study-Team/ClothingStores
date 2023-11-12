package com.kgitbank.slimbear.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.slimbear.service.YangBoardServiceImpl;

@Controller
public class YangController {
    @Autowired
    private YangBoardServiceImpl boardService;

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
    
    
    @RequestMapping("/board/inquiry")
    public String getBoardInquiryList(Model model) {
        model.addAttribute("boards", boardService.getBoardInquiryList());
        model.addAttribute("boardUsers", boardService.getBoardUserList());
        return "inquiry"; // 뷰 이름 설정
    }
    @RequestMapping("/board/inquiry/delivery")
    public String getBoardInquiry2List(Model model) {
        model.addAttribute("boards", boardService.getBoardInquiry2List());
        model.addAttribute("boardUsers", boardService.getBoardUserList());
        return "inquiry";
    }
    @RequestMapping("/board/inquiry/bipolar")
    public String getBoardInquiry3List(Model model) {
        model.addAttribute("boards", boardService.getBoardInquiry3List());
        model.addAttribute("boardUsers", boardService.getBoardUserList());
        return "inquiry";
    }
    
    @RequestMapping("/article/inquiry")
    public String getBoardInquiry(Model model) {
    	model.addAttribute("boards", boardService.getBoardInquiryList());
    	return "board_inquiry";
    }
    
    
    @RequestMapping("/board/faq")
    public String getBoardFaqList(Model model) {
        model.addAttribute("boards", boardService.getBoardFaqList());
        return "faq"; // 뷰 이름 설정
    }
    
    
    @RequestMapping("/board/write")
    public String getBoardWrite(Model model) {
        model.addAttribute("boards", boardService.getBoardWrite());
        return "board_write"; // 뷰 이름 설정
    }
    
}

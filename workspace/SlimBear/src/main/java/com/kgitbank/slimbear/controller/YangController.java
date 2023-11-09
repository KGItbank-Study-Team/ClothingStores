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
    public String getBoardList(Model model) {
  
        model.addAttribute("boards", boardService.getBoardList());
      
        return "notice"; // 뷰 이름 설정
    }
    
    @RequestMapping("/board/inquiry")
    public String getBoardList2(Model model) {
  
        model.addAttribute("boards", boardService.getBoardList());
      
        return "inquiry"; // 뷰 이름 설정
    }
    
    @RequestMapping("/board/faq")
    public String getFaqBoardList(Model model) {
  
        model.addAttribute("boards", boardService.getFaqBoardList());
      
        return "faq"; // 뷰 이름 설정
    }
    
    @RequestMapping("/board/boardcontent")
    public String getBoardContentList3(Model model) {
  
        model.addAttribute("boards", boardService.getBoardList());
      
        return "boardcontent"; // 뷰 이름 설정
    }
}

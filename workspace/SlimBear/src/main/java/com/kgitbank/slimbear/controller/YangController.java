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

    @RequestMapping("/board/list")
    public String getBoardList(Model model) {
  
        model.addAttribute("boards", boardService.getBoardList());
      
        return "notice"; // 뷰 이름 설정
    }
}

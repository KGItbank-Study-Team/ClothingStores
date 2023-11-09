package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.vo.BoardVO;
import com.kgitbank.slimbear.vo.FaqVO;

@Service
public class YangBoardServiceImpl {

	public ArrayList<BoardVO> getBoardList() {
        ArrayList<BoardVO> boards = new ArrayList<>();
        
	     // 임시 데이터 생성
	    for (int i = 1; i <= 5; i++) {
	        BoardVO board = new BoardVO();
	        board.setNo(i);
	        board.setMaintitle("Notice");
	        board.setTitle("제목 " + i);
	        board.setName("작성자 " + i);
	        board.setRegDate(new Date(System.currentTimeMillis()));
	        board.setContent("내용 " + i);
//	        board.setId(i);;
//	        board.setHit(100 + i);
//	        board.setVote(5 - i);
//	        board.setPoint(i * 10);
	        
	        boards.add(board);
	    }
    
	    return boards;
    }
	
	public ArrayList<FaqVO> getFaqBoardList() {
        ArrayList<FaqVO> boards = new ArrayList<>();
        
        for (int i = 1; i <= 5; i++) {
	        FaqVO board = new FaqVO();
	        board.setTitle("배송관련 " + i);
	        board.setSubtitle("이거 왜이럼 " + i + " ?");
	        board.setContent("내용 작성 " + i);
	        
	        boards.add(board);
	    }
        
        return boards;
    }
		
}
	


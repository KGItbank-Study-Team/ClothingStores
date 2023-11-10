package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.vo.BoardFaqVO;
import com.kgitbank.slimbear.vo.BoardInquiryVO;
import com.kgitbank.slimbear.vo.BoardNoticeVO;

@Service
public class YangBoardServiceImpl {

	public ArrayList<BoardNoticeVO> getBoardNoticeList() {
        ArrayList<BoardNoticeVO> boards = new ArrayList<>();
        
	     // 임시 데이터 생성
	    for (int i = 1; i <= 5; i++) {
	        BoardNoticeVO board = new BoardNoticeVO();
	        board.setNo(i);
	        board.setTitle("제목 " + i);
	        board.setName("작성자 " + i);
	        board.setReg_date(new Date(System.currentTimeMillis()));
	        board.setContent("내용 " + i);
//	        board.setId(i);;
//	        board.setHit(100 + i);
//	        board.setVote(5 - i);
//	        board.setPoint(i * 10);
	        
	        boards.add(board);
	    }
    
	    return boards;
    }
	
	public ArrayList<BoardInquiryVO> getBoardInquiryList(){
		ArrayList<BoardInquiryVO> boards = new ArrayList<>();
		
		for (int i = 1; i <= 5; i++) {
			BoardInquiryVO board = new BoardInquiryVO();
			board.setNo(i);
			board.setTitle("상품문의 " + i);
			board.setWriter_id("작성자 " + i);
			board.setReg_date(new Date(System.currentTimeMillis()));
			board.setContent("내용 " + i);
			
			boards.add(board);
		}
		
		return boards;
	}
	
	public ArrayList<BoardFaqVO> getBoardFaqList() {
        ArrayList<BoardFaqVO> boards = new ArrayList<>();
        
        for (int i = 1; i <= 5; i++) {
	        BoardFaqVO board = new BoardFaqVO();
	        board.setQuestion("배송관련 " + i);
	        board.setAnswer("이거 왜이럼 " + i + " ?");
	        board.setContent("내용 작성 " + i);
	        
	        boards.add(board);
	    }
        
        return boards;
    }
	
	
}
	


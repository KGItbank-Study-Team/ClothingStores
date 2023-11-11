package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.vo.BoardFaqListVO;
import com.kgitbank.slimbear.vo.BoardInquiryListVO;
import com.kgitbank.slimbear.vo.BoardNoticeListVO;

@Service
public class YangBoardServiceImpl {

	// 공지사항
	public ArrayList<BoardNoticeListVO> getBoardNoticeList() {
        ArrayList<BoardNoticeListVO> boards = new ArrayList<>();
        
	     // 임시 데이터 생성
	    for (int i = 10; i >= 1; i--) {
	        BoardNoticeListVO board = new BoardNoticeListVO();
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
	
	// 문의게시판
	public ArrayList<BoardInquiryListVO> getBoardInquiryList(){
		ArrayList<BoardInquiryListVO> boards = new ArrayList<>();
		
		for (int i = 10; i >= 1; i--) {
			BoardInquiryListVO board = new BoardInquiryListVO();
			board.setNo(i);
			board.setTitle("상품문의 " + i);
			board.setWriter_id("작성자 " + i);
			board.setReg_date(new Date(System.currentTimeMillis()));
			board.setContent("내용 " + i);
			
			boards.add(board);
		}
		return boards;
	}
	public ArrayList<BoardInquiryListVO> getBoardInquiry2List(){
		ArrayList<BoardInquiryListVO> boards = new ArrayList<>();
		
		for (int i = 10; i >= 1; i--) {
			BoardInquiryListVO board = new BoardInquiryListVO();
			board.setNo(i);
			board.setTitle("배송문의 " + i);
			board.setWriter_id("작성자 " + i);
			board.setReg_date(new Date(System.currentTimeMillis()));
			board.setContent("내용 " + i);
			
			boards.add(board);
		}
		return boards;
	}
	public ArrayList<BoardInquiryListVO> getBoardInquiry3List(){
		ArrayList<BoardInquiryListVO> boards = new ArrayList<>();
		
		for (int i = 10; i >= 1; i--) {
			BoardInquiryListVO board = new BoardInquiryListVO();
			board.setNo(i);
			board.setTitle("배송 전 변경/취소 " + i);
			board.setWriter_id("작성자 " + i);
			board.setReg_date(new Date(System.currentTimeMillis()));
			board.setContent("내용 " + i);
			
			boards.add(board);
		}
		return boards;
	}
	
	
	// FAQ
	public ArrayList<BoardFaqListVO> getBoardFaqList() {
        ArrayList<BoardFaqListVO> boards = new ArrayList<>();
        
        for (int i = 10; i >= 1; i--) {
	        BoardFaqListVO board = new BoardFaqListVO();
	        board.setQuestion("배송관련 " + i);
	        board.setAnswer("이거 왜이럼 " + i + " ?");
	        board.setContent("내용 작성 " + i);
	        
	        boards.add(board);
	    }
        return boards;
    }

	
	// 게시글작성
	public Object getBoardWrite() {
		
		return null;
	}
}
	


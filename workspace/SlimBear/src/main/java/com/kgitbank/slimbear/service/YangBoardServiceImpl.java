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
	    for (int i = 6; i >= 1; i--) {
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
	public ArrayList<BoardInquiryListVO> getBoardInquiryList(){		// 상품문의
		ArrayList<BoardInquiryListVO> boards = new ArrayList<>();
		
		for (int i = 5; i >= 1; i--) {
			BoardInquiryListVO board = new BoardInquiryListVO();
			board.setNo(i);
			board.setInquiry_title("상품문의");
			board.setTitle("상품문의 " + i);
			board.setWriter_id("작성자 " + i);
			board.setReg_date(new Date(System.currentTimeMillis()));
			board.setContent("내용 " + i);
			
			boards.add(board);
		}
		return boards;
	}
	public ArrayList<BoardInquiryListVO> getBoardInquiry2List(){	// 배송문의
		ArrayList<BoardInquiryListVO> boards = new ArrayList<>();
		
		for (int i = 2; i >= 1; i--) {
			BoardInquiryListVO board = new BoardInquiryListVO();
			board.setNo(i);
			board.setInquiry_title("배송문의");
			board.setTitle_ment("입금확인 후 영업일 기준(주말, 공휴일 제외)으로 준비되어 출고됩니다:)");
			board.setTitle("배송문의 " + i);
			board.setWriter_id("작성자 " + i);
			board.setReg_date(new Date(System.currentTimeMillis()));
			board.setContent("내용 " + i);
			
			boards.add(board);
		}
		return boards;
	}
	public ArrayList<BoardInquiryListVO> getBoardInquiry3List(){	// 배송 전 변경/취소
		ArrayList<BoardInquiryListVO> boards = new ArrayList<>();
		
		for (int i = 1; i >= 1; i--) {
			BoardInquiryListVO board = new BoardInquiryListVO();
			board.setNo(i);
			board.setInquiry_title("배송 전 변경/취소");
			board.setTitle_ment("실시간으로 배송작업이 이루어지고 있습니다. 변경/취소/추가 문의는 당일 \"낮 10시\" 이전에 요청하셔야 처리가 가능합니다 ♡");
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
			board.setTitle_ment("자주 묻는 질문 안내드립니다♡");
	        board.setQuestion("전체보기 " + i);
	        board.setAnswer("전체내용 " + i + " ?");
	        board.setContent("내용 작성 " + i);
	        
	        boards.add(board);
	    }
        return boards;
    }
	public ArrayList<BoardFaqListVO> getBoardFaq1List() {
        ArrayList<BoardFaqListVO> boards = new ArrayList<>();
        
        for (int i = 10; i >= 1; i--) {
	        BoardFaqListVO board = new BoardFaqListVO();
			board.setTitle_ment("자주 묻는 질문 안내드립니다♡");
	        board.setQuestion("상품관련 " + i);
	        board.setAnswer("신상품 할인 기간을 알고 싶어요 " + i + " ?");
	        board.setContent("내용 작성 " + i);
	        
	        boards.add(board);
	    }
        return boards;
    }
	public ArrayList<BoardFaqListVO> getBoardFaq2List() {
        ArrayList<BoardFaqListVO> boards = new ArrayList<>();
        
        for (int i = 10; i >= 1; i--) {
	        BoardFaqListVO board = new BoardFaqListVO();
			board.setTitle_ment("자주 묻는 질문 안내드립니다♡");
	        board.setQuestion("배송관련 " + i);
	        board.setAnswer("무료 배송 가능한가요 " + i + " ?");
	        board.setContent("내용 작성 " + i);
	        
	        boards.add(board);
	    }
        return boards;
    }
	public ArrayList<BoardFaqListVO> getBoardFaq3List() {
        ArrayList<BoardFaqListVO> boards = new ArrayList<>();
        
        for (int i = 10; i >= 1; i--) {
	        BoardFaqListVO board = new BoardFaqListVO();
			board.setTitle_ment("자주 묻는 질문 안내드립니다♡");
	        board.setQuestion("교환/반품관련 " + i);
	        board.setAnswer("교환/반품 시 배송비는 어떻게 하나요 " + i + " ?");
	        board.setContent("내용 작성 " + i);
	        
	        boards.add(board);
	    }
        return boards;
    }
	public ArrayList<BoardFaqListVO> getBoardFaq4List() {
        ArrayList<BoardFaqListVO> boards = new ArrayList<>();
        
        for (int i = 10; i >= 1; i--) {
	        BoardFaqListVO board = new BoardFaqListVO();
			board.setTitle_ment("자주 묻는 질문 안내드립니다♡");
	        board.setQuestion("기타관련 " + i);
	        board.setAnswer("현금영수증 신청은 어떻게 하나요 " + i + " ?");
	        board.setContent("내용 작성 " + i);
	        
	        boards.add(board);
	    }
        return boards;
    }
	public ArrayList<BoardFaqListVO> getBoardFaq5List() {
        ArrayList<BoardFaqListVO> boards = new ArrayList<>();
        
        for (int i = 10; i >= 1; i--) {
	        BoardFaqListVO board = new BoardFaqListVO();
			board.setTitle_ment("자주 묻는 질문 안내드립니다♡");
	        board.setQuestion("쇼룸관련 " + i);
	        board.setAnswer("결제수단은 어떻게 될까요 " + i + " ?");
	        board.setContent("내용 작성 " + i);
	        
	        boards.add(board);
	    }
        return boards;
    }
	
	
	// 유저 게시글
	public ArrayList<BoardInquiryListVO> getBoardUserList(){	
		ArrayList<BoardInquiryListVO> boardUsers = new ArrayList<>();
		
		for (int i = 10; i >= 1; i--) {
			BoardInquiryListVO boardUser = new BoardInquiryListVO();
			boardUser.setNo(i);
			boardUser.setTitle("유저게시글 " + i);
			boardUser.setWriter_id("유저작성자 " + i);
			boardUser.setReg_date(new Date(System.currentTimeMillis()));
			boardUser.setContent("내용 " + i);
			
			boardUsers.add(boardUser);
		}
		return boardUsers;
	}
	
	// 게시글작성
	public Object getBoardWrite() {
		
		return null;
	}
}
	


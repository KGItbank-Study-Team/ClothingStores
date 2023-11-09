package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.vo.BoardVO;

@Service
public class YangBoardServiceImpl {

	public ArrayList<BoardVO> getBoardList() {
       
        ArrayList<BoardVO> boards = new ArrayList<>();
        
	     // 임시 데이터 생성
        
	    for (int i = 1; i <= 5; i++) {
	        BoardVO board = new BoardVO();
	        board.setNo(i);
	        board.setTitle("제목 " + i);
	        board.setName("작성자 " + i);
	        board.setRegDate(new Date(System.currentTimeMillis()));
//	        board.setId(i);;
//	        board.setHit(100 + i);
//	        board.setVote(5 - i);
//	        board.setPoint(i * 10);
	        
	        boards.add(board);
	    }
    
    return boards;
    }
}

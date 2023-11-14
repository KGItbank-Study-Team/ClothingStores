package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.FaqDAO;
import com.kgitbank.slimbear.dao.InquiryDAO;
import com.kgitbank.slimbear.dao.NoticeDAO;
import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.NoticeDTO;
import com.kgitbank.slimbear.vo.BoardFaqListVO;
import com.kgitbank.slimbear.vo.BoardInquiryListVO;

@Service
public class YangBoardServiceImpl {

	@Autowired
    private NoticeDAO noticeDAO;
	@Autowired
	private InquiryDAO inquiryDAO;
	@Autowired
	private FaqDAO faqDAO;

    // 공지사항
	public List<NoticeDTO> getBoardNoticeList() {
        List<NoticeDTO> notices = noticeDAO.getNoticeList();

        return notices;
//        return new ArrayList<>(notices);
    }
	/*
	 * public ArrayList<BoardNoticeListVO> getBoardNoticeList() {
	 * ArrayList<BoardNoticeListVO> boards = new ArrayList<>();
	 * 
	 * // 임시 데이터 생성 for (int i = 6; i >= 1; i--) { BoardNoticeListVO board = new
	 * BoardNoticeListVO(); board.setNo(i); board.setTitle("제목 " + i);
	 * board.setName("작성자 " + i); board.setReg_date(new
	 * Date(System.currentTimeMillis())); board.setContent("내용 " + i); //
	 * board.setId(i);; // board.setHit(100 + i); // board.setVote(5 - i); //
	 * board.setPoint(i * 10);
	 * 
	 * boards.add(board); } return boards; }
	 */
	
	
	// 문의게시판
	public List<InquiryDTO> getBoardInquiryListByType(String type) {
        List<InquiryDTO> inquiries = inquiryDAO.getInquiryList();

        // Filter inquiries based on the specified type
        List<InquiryDTO> filteredInquiries = inquiries.stream()
                .filter(inquiry -> inquiry.getType().equals(type))
                .collect(Collectors.toList());
        return filteredInquiries;
    }
	public List<InquiryDTO> getBoardInquiryList() {
		List<InquiryDTO> inquiries = inquiryDAO.getInquiryList();
        return inquiries;
    }
	
	
	/*
	 * public ArrayList<BoardInquiryListVO> getBoardInquiryList(){ // 상품문의
	 * ArrayList<BoardInquiryListVO> boards = new ArrayList<>();
	 * 
	 * for (int i = 5; i >= 1; i--) { BoardInquiryListVO board = new
	 * BoardInquiryListVO(); board.setNo(i); board.setInquiry_title("상품문의");
	 * board.setTitle("상품문의 " + i); board.setWriter_id("작성자 " + i);
	 * board.setReg_date(new Date(System.currentTimeMillis()));
	 * board.setContent("내용 " + i);
	 * 
	 * boards.add(board); } return boards; }
	 * 
	 * public List<InquiryDTO> getBoardInquiry2List(){ List<InquiryDTO> inquiries =
	 * inquiryDAO.getInquiryList(); return inquiries; }
	 * 
	 * public ArrayList<BoardInquiryListVO> getBoardInquiry2List(){ // 배송문의
	 * ArrayList<BoardInquiryListVO> boards = new ArrayList<>();
	 * 
	 * for (int i = 2; i >= 1; i--) { BoardInquiryListVO board = new
	 * BoardInquiryListVO(); board.setNo(i); board.setInquiry_title("배송문의");
	 * board.setTitle_ment("입금확인 후 영업일 기준(주말, 공휴일 제외)으로 준비되어 출고됩니다:)");
	 * board.setTitle("배송문의 " + i); board.setWriter_id("작성자 " + i);
	 * board.setReg_date(new Date(System.currentTimeMillis()));
	 * board.setContent("내용 " + i);
	 * 
	 * boards.add(board); } return boards; }
	 * 
	 * public ArrayList<BoardInquiryListVO> getBoardInquiry3List(){ // 배송 전 변경/취소
	 * ArrayList<BoardInquiryListVO> boards = new ArrayList<>();
	 * 
	 * for (int i = 1; i >= 1; i--) { BoardInquiryListVO board = new
	 * BoardInquiryListVO(); board.setNo(i); board.setInquiry_title("배송 전 변경/취소");
	 * board.
	 * setTitle_ment("실시간으로 배송작업이 이루어지고 있습니다. 변경/취소/추가 문의는 당일 \"낮 10시\" 이전에 요청하셔야 처리가 가능합니다 ♡"
	 * ); board.setTitle("배송 전 변경/취소 " + i); board.setWriter_id("작성자 " + i);
	 * board.setReg_date(new Date(System.currentTimeMillis()));
	 * board.setContent("내용 " + i);
	 * 
	 * boards.add(board); } return boards; }
	 */
	
	
	// FAQ
	public List<FaqDTO> getBoardFaqListByType(String type) {
        List<FaqDTO> faqs = faqDAO.getFaqList();

        // Filter inquiries based on the specified type
        List<FaqDTO> filteredFaqs = faqs.stream()
                .filter(faq -> faq.getType().equals(type))
                .collect(Collectors.toList());
        return filteredFaqs;
    }
	public List<FaqDTO> getBoardFaqList() {
		List<FaqDTO> faqs = faqDAO.getFaqList();
        return faqs;
    }
	
	
	/*
	 * public ArrayList<BoardFaqListVO> getBoardFaqList() {
	 * ArrayList<BoardFaqListVO> boards = new ArrayList<>();
	 * 
	 * for (int i = 10; i >= 1; i--) { BoardFaqListVO board = new BoardFaqListVO();
	 * board.setTitle_ment("자주 묻는 질문 안내드립니다♡"); board.setQuestion("전체보기 " + i);
	 * board.setAnswer("전체내용 " + i + " ?"); board.setContent("내용 작성 " + i);
	 * 
	 * boards.add(board); } return boards; } public ArrayList<BoardFaqListVO>
	 * getBoardFaq1List() { ArrayList<BoardFaqListVO> boards = new ArrayList<>();
	 * 
	 * for (int i = 10; i >= 1; i--) { BoardFaqListVO board = new BoardFaqListVO();
	 * board.setTitle_ment("자주 묻는 질문 안내드립니다♡"); board.setQuestion("상품관련 " + i);
	 * board.setAnswer("신상품 할인 기간을 알고 싶어요 " + i + " ?");
	 * board.setContent("신상품 업데이트 후 3일 동안 5% 할인 가격으로 판매됩니다. " + i);
	 * 
	 * boards.add(board); } return boards; } public ArrayList<BoardFaqListVO>
	 * getBoardFaq2List() { ArrayList<BoardFaqListVO> boards = new ArrayList<>();
	 * 
	 * for (int i = 10; i >= 1; i--) { BoardFaqListVO board = new BoardFaqListVO();
	 * board.setTitle_ment("자주 묻는 질문 안내드립니다♡"); board.setQuestion("배송관련 " + i);
	 * board.setAnswer("무료 배송 가능한가요 " + i + " ?");
	 * board.setContent("슬림베어는 항시 무료배송입니다. " + i);
	 * 
	 * boards.add(board); } return boards; } public ArrayList<BoardFaqListVO>
	 * getBoardFaq3List() { ArrayList<BoardFaqListVO> boards = new ArrayList<>();
	 * 
	 * for (int i = 10; i >= 1; i--) { BoardFaqListVO board = new BoardFaqListVO();
	 * board.setTitle_ment("자주 묻는 질문 안내드립니다♡"); board.setQuestion("교환/반품관련 " + i);
	 * board.setAnswer("교환/반품 시 배송비는 어떻게 하나요 " + i + " ?");
	 * board.setContent("▶반품 : 환불 금액에서 배송비 차감 후 환불해 드려요. " + i);
	 * 
	 * boards.add(board); } return boards; } public ArrayList<BoardFaqListVO>
	 * getBoardFaq4List() { ArrayList<BoardFaqListVO> boards = new ArrayList<>();
	 * 
	 * for (int i = 10; i >= 1; i--) { BoardFaqListVO board = new BoardFaqListVO();
	 * board.setTitle_ment("자주 묻는 질문 안내드립니다♡"); board.setQuestion("기타관련 " + i);
	 * board.setAnswer("현금영수증 신청은 어떻게 하나요 " + i + " ?");
	 * board.setContent("고객님께서 주문서 작성 시 현금영수증 신청 직접 가능합니다. " + i);
	 * 
	 * boards.add(board); } return boards; } public ArrayList<BoardFaqListVO>
	 * getBoardFaq5List() { ArrayList<BoardFaqListVO> boards = new ArrayList<>();
	 * 
	 * for (int i = 10; i >= 1; i--) { BoardFaqListVO board = new BoardFaqListVO();
	 * board.setTitle_ment("자주 묻는 질문 안내드립니다♡"); board.setQuestion("쇼룸관련 " + i);
	 * board.setAnswer("결제수단은 어떻게 될까요 " + i + " ?");
	 * board.setContent("카드결제 또는 계좌이체가 가능합니다. " + i);
	 * 
	 * boards.add(board); } return boards; }
	 */
	 
	 
	
	
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
	


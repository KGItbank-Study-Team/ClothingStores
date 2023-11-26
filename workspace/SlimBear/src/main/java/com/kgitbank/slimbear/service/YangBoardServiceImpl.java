package com.kgitbank.slimbear.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.FaqDAO;
import com.kgitbank.slimbear.dao.InquiryDAO;
import com.kgitbank.slimbear.dao.NoticeDAO;
import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.NoticeDTO;

@Service
public class YangBoardServiceImpl {

	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private InquiryDAO inquiryDAO;
	@Autowired
	private FaqDAO faqDAO;
	
	// 공지사항
	public List<NoticeDTO> getNoticeList(int priority) {
		return noticeDAO.getNoticeList(priority);
	}
	
	// 공지사항 상세페이지조회
    public NoticeDTO getNoticeDetail(Long id) {
        return noticeDAO.getNoticeDetail(id);
    }
	
	// 문의게시판
    public List<InquiryDTO> getInquiryList(String type) {
        return inquiryDAO.getInquiryList(type);
    }
    
    // 문의게시판 답변
    public List<InquiryDTO> getInquiryListByProdUid(long prodUid) {
        return inquiryDAO.getInquiryListByProdUid(prodUid);
    }
	
    // 문의게시판 등록
	public void insertInquiry(InquiryDTO inquiryDTO) {
		inquiryDAO.insertInquiry(inquiryDTO);
	}
	
	// 문의게시판 상세페이지조회
    public InquiryDTO getInquiryDetail(Long id) {
    	InquiryDTO inquiry = inquiryDAO.getInquiryDetail(id);
        // 비밀글이고, 현재 로그인한 사용자와 게시물 작성자가 다를 경우
        if (inquiry.getSecure() == 1 && !isCurrentUserAuthor(inquiry.getWriter_id())) {
        	throw new AccessDeniedException("안돼 돌아가"); // 또는 다른 방식으로 예외 처리를 할 수 있음
        }
        return inquiry;
    }
    // 현재 로그인한 사용자가 작성자인지 확인하는 메서드
    private boolean isCurrentUserAuthor(String writerId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUserName = authentication.getName();
        return currentUserName.equals(writerId);
    }
	
    // 문의게시판 삭제
    public void deleteInquiry(Long id) {
        inquiryDAO.deleteInquiry(id);
    }
    
    // 문의게시판 수정페이지조회
    public InquiryDTO getInquiryUpdate(Long id) {
        return inquiryDAO.getInquiryDetail(id);
    }
    // 문의게시판 수정
    public void updateInquiry(InquiryDTO inquiry) {
    	inquiryDAO.updateInquiry(inquiry);
    }
    
	
	// FAQ
	public List<FaqDTO> getFaqList() {
        return faqDAO.getFaqList();
    }
	
	public List<FaqDTO> getFaqListByType(String type) {
        return faqDAO.getFaqListByType(type);
	}
	
//	public List<FaqDTO> getBoardFaqList() {
//		List<FaqDTO> faqs = faqDAO.getFaqList();
//		return faqs;
//	}
	
	
	// 게시글 검색
//	public List<InquiryDTO> searchInquiry(int boardNo, int page, String searchDate, String searchKey, String searchKeyword) {
//        // 페이지당 게시물 수와 검색 시작 위치 계산
//        int pageSize = 10; // 페이지당 게시물 수
//        int start = (page - 1) * pageSize;
//
//        // 검색 조건에 따른 쿼리 생성
//        String query = "SELECT * FROM inquiry WHERE board_no = #{boardNo}";
//
//        // 검색 날짜에 따라 쿼리에 조건 추가
//        if (!"all".equals(searchDate)) {
//            query += " AND DATE_SUB(NOW(), INTERVAL 1 " + searchDate.toUpperCase() + ") <= reg_date";
//        }
//
//        // 검색 키워드에 따라 쿼리에 조건 추가
//        if (searchKeyword != null && !searchKeyword.isEmpty()) {
//            switch (searchKey) {
//                case "subject":
//                    query += " AND title LIKE CONCAT('%', #{searchKeyword}, '%')";
//                    break;
//                case "content":
//                    query += " AND content LIKE CONCAT('%', #{searchKeyword}, '%')";
//                    break;
//                case "writer_name":
//                    query += " AND writer_id LIKE CONCAT('%', #{searchKeyword}, '%')";
//                    break;
//                // 다른 검색 키에 따른 조건 추가
//            }
//        }
//
//        // 페이징 쿼리 추가
//        query += " ORDER BY reg_date DESC LIMIT #{start}, #{pageSize}";
//
//        // MyBatis 매퍼에 전달할 파라미터 설정
//        Map<String, Object> paramMap = new HashMap<>();
//        paramMap.put("boardNo", boardNo);
//        paramMap.put("start", start);
//        paramMap.put("pageSize", pageSize);
//        paramMap.put("searchKeyword", searchKeyword);
//
//        // 조회된 결과 반환
//        return inquiryDAO.searchInquiry(paramMap);
//    }
	
	
}

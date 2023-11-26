package com.kgitbank.slimbear.service;

import java.util.List;

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
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.NoticeDTO;

@Service
public class YangBoardServiceImpl {

	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private InquiryDAO inquiryDAO;
	@Autowired
    private MemberService memberService;
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
	    try {
	        InquiryDTO inquiry = inquiryDAO.getInquiryDetail(id);

	        // 게시글이 null이면 경고창을 띄우고 실행 취소
	        if (inquiry == null) {
	            showAccessDeniedWarning();
	            return null;
	        }

	        // 비밀글이고, 현재 로그인한 사용자와 게시물 작성자가 다를 경우
	        if (inquiry.getSecure() == 1 && !isCurrentUserAuthor(inquiry.getWriter_id())) {
	            // 비밀글이면서 현재 사용자가 작성자가 아닌 경우 비밀글을 숨김
	            showAccessDeniedWarning();
	            inquiry.setContent("비밀글로 숨겨진 내용입니다.");
	            // 다른 필요한 처리를 추가할 수 있음
	        }

	        return inquiry;
	    } catch (AccessDeniedException e) {
	        showAccessDeniedWarning();
	        return null;
	    }
	}
	
	
	
	
//	public InquiryDTO getInquiryDetail(Long id) {
//        try {
//            InquiryDTO inquiry = inquiryDAO.getInquiryDetail(id);
//
//            // 비밀글이고, 현재 로그인한 사용자와 게시물 작성자가 다를 경우
//            if (inquiry.getSecure() == 1 && !isCurrentUserAuthor(inquiry.getWriter_id())) {
//                // 여기서 예외를 던지지 않고, 경고창을 띄우도록 처리
//                showAccessDeniedWarning();
//                // 또는 다른 방식으로 경고창을 띄우는 로직을 추가할 수 있음
//                return null;  // 예외를 던지지 않았으므로 null을 반환하거나 다른 처리를 수행
//            }
//
//            return inquiry;
//        } catch (AccessDeniedException e) {
//            showAccessDeniedWarning();
//            return null;  // 예외를 던지지 않았으므로 null을 반환하거나 다른 처리를 수행
//        }
//    }
	// 경고창을 띄우는 메서드
    private void showAccessDeniedWarning() {
        // 여기에 경고창을 띄우는 로직을 추가
        // 예를 들어, 웹 페이지에서는 JavaScript를 사용하여 경고창을 띄울 수 있습니다.
        // 또는 Spring MVC에서는 Model을 활용하여 경고 메시지를 전달할 수 있습니다.
    }
	 // 현재 로그인한 사용자가 작성자인지 확인하는 메서드
    private boolean isCurrentUserAuthor(String writerName) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUserName = authentication.getName();
        MemberDTO currentUser = memberService.getMemberById(currentUserName);

        // 현재 사용자의 이름과 작성자의 이름을 비교
        if (currentUser == null || !currentUser.getName().equals(writerName)) {
            showAccessDeniedWarning();
            return false;
        }

        return true;
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

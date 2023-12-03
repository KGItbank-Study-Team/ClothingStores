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
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
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
	public List<NoticeDTO> getNoticeList(Integer offset, Integer pageSize, int currentPage) {
		offset = (currentPage - 1) * pageSize;

		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("currentPage", currentPage);
		paramMap.put("offset", offset);
		paramMap.put("pageSize", pageSize);

		System.out.println(paramMap);
        return noticeDAO.getNoticeList(paramMap);
//		return noticeDAO.getNoticeList(priority);
	}
	public int getTotalNotice() {
    	int total = noticeDAO.getTotalNotice();
    	System.out.println(total);
    	return total;
    }
	
	// 공지사항 상세페이지조회
    public NoticeDTO enterNoticeDetail(Long id) {
        return noticeDAO.enterNoticeDetail(id);
    }
	
	// 문의게시판
    public List<InquiryDTO> getInquiryList(String type, Integer offset, Integer pageSize, int currentPage) {
    	
		offset = (currentPage - 1) * pageSize;

		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("type", type);
		paramMap.put("currentPage", currentPage);
		paramMap.put("offset", offset);
		paramMap.put("pageSize", pageSize);

		System.out.println(paramMap);
        return inquiryDAO.getInquiryList(paramMap);
    }
    public int getTotalInquiry(String type) {
    	int total = inquiryDAO.getTotalInquiry(type);
    	System.out.println(total);
    	return total;
    }
    
    // 문의게시판 전체목록
    public List<InquiryDTO> getInquiryListAll() {
        return inquiryDAO.getInquiryListAll();
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
	            inquiry.setContent("비밀글로 작성자 외엔 확인할 수 없는 내용입니다.");
	            // 다른 필요한 처리를 추가할 수 있음
	        }
	        // 해당 문의에 대한 답변 검색
            List<InquiryAnswerDTO> answers = inquiryDAO.getInquiryAnswerList(id);
            inquiry.setAnswers(answers);

	        return inquiry;
	    } catch (AccessDeniedException e) {
	        showAccessDeniedWarning();
	        return null;
	    }
	}
	
	// 경고창을 띄우는 메서드
    private void showAccessDeniedWarning() {
    	System.out.println("경고");
    }
    
    // 현재 로그인한 사용자가 작성자인지 확인하는 메서드
    private boolean isCurrentUserAuthor(String writerId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();  // 현재 인증된 사용자 정보 가져오기
        String currentUserId = authentication.getName();  // 현재 사용자의 ID 가져오기
        
        // 현재 사용자의 ID와 작성자의 ID를 비교
        if (currentUserId == null || !currentUserId.equals(writerId)) {
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
    
    // 문의게시글 검색 기능 추가
    public List<InquiryDTO> getInquiryListBySearch(Map<String, String> searchMap) {
    	System.out.println(searchMap);
        return inquiryDAO.getInquiryListBySearch(searchMap);
    }
    
    
    // 문의게시판 답변게시글 목록
    public List<InquiryDTO> getInquiryListWithAnswers(String type, Integer offset, Integer pageSize, int currentPage) {
    	offset = (currentPage - 1) * pageSize;

		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("type", type);
		paramMap.put("currentPage", currentPage);
		paramMap.put("offset", offset);
		paramMap.put("pageSize", pageSize);

		System.out.println(paramMap);
		
        List<InquiryDTO> inquiries = inquiryDAO.getInquiryList(paramMap);
        
        for (InquiryDTO inquiry : inquiries) {
            // 각 문의에 대한 답변 목록을 가져와서 설정
            List<InquiryAnswerDTO> answers = inquiryDAO.getInquiryAnswers(inquiry.getUid());
            inquiry.setAnswers(answers);
        }
        
        return inquiries;
    }
    // 문의게시판 답변게시글 조회
	public InquiryAnswerDTO getAnswerDetail(Long uid) {
		try {
			InquiryAnswerDTO inquiryAnswer = inquiryDAO.getAnswerDetail(uid);

	        // 게시글이 null이면 경고창을 띄우고 실행 취소
	        if (inquiryAnswer == null) {
	            showAccessDeniedWarning();
	            return null;
	        }
	        
	        // 비밀글이고, 현재 로그인한 사용자와 게시물 작성자가 다를 경우
	        if (inquiryAnswer.getSecure() == 1 && !isCurrentUserAuthor(inquiryAnswer.getMem_id())) {
	            // 비밀글이면서 현재 사용자가 작성자가 아닌 경우 비밀글을 숨김
	            showAccessDeniedWarning();
	            inquiryAnswer.setContent("비밀글로 작성자 외엔 확인할 수 없는 내용입니다.");
	            // 다른 필요한 처리를 추가할 수 있음
	        }
	        return inquiryAnswer;
	    } catch (AccessDeniedException e) {
	        showAccessDeniedWarning();
	        return null;
	    }
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
	
	
	
	
}

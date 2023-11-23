package com.kgitbank.slimbear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
        return inquiryDAO.getInquiryDetail(id);
    }
	
    // 문의게시판 삭제
    public void deleteInquiry(Long id) {
        inquiryDAO.deleteInquiry(id);
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


}

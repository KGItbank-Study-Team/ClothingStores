package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.FaqDAO;
import com.kgitbank.slimbear.dao.InquiryDAO;
import com.kgitbank.slimbear.dao.NoticeDAO;
import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.NoticeDTO;
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
	public List<NoticeDTO> getNoticeList(int priority) {
		return noticeDAO.getNoticeList(priority);
	}
	
	/*
	 * public List<NoticeDTO> getBoardNoticeList() { List<NoticeDTO> notices =
	 * noticeDAO.getNoticeList();
	 * 
	 * return notices; }
	 */
	
	
	// 문의게시판
    public List<InquiryDTO> getInquiryList(String type) {
        return inquiryDAO.getInquiryList(type);
    }

	
	public void insertInquiry(InquiryDTO inquiryDTO) {
		inquiryDAO.insertInquiry(inquiryDTO);
	}
	
//	public List<InquiryDTO> getBoardInquiryListByType(String type) {
//		List<InquiryDTO> inquiries = inquiryDAO.getInquiryList();
//
//		// Filter inquiries based on the specified type
//		List<InquiryDTO> filteredInquiries = inquiries.stream().filter(inquiry -> inquiry.getType().equals(type))
//				.collect(Collectors.toList());
//		return filteredInquiries;
//	}
//
//	public List<InquiryDTO> getBoardInquiryList() {
//		List<InquiryDTO> inquiries = inquiryDAO.getInquiryList();
//		return inquiries;
//	}
	
	
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
	
	
	// 유저 게시글 (나중에 지울예정)
	public ArrayList<BoardInquiryListVO> getBoardUserList() {
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

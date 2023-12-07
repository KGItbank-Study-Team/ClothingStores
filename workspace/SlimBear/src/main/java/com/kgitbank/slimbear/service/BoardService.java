package com.kgitbank.slimbear.service;

import java.util.List;
import java.util.Map;

import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.NoticeDTO;

public interface BoardService {

	// 공지사항
	List<NoticeDTO> getNoticeList(Integer offset, Integer pageSize, int currentPage);

	int getTotalNotice();

	// 공지사항 상세페이지조회
	NoticeDTO enterNoticeDetail(Long id);

	// 문의게시판
	List<InquiryDTO> getInquiryList(String type, Integer offset, Integer pageSize, int currentPage);

	int getTotalInquiry(String type);

	// 문의게시판 전체목록
	List<InquiryDTO> getInquiryListAll();

	// 문의게시판 답변
	List<InquiryDTO> getInquiryListByProdUid(long prodUid);

	// 문의게시판 등록
	void insertInquiry(InquiryDTO inquiryDTO);

	// 문의게시판 상세페이지조회
	InquiryDTO getInquiryDetail(Long id);

	// 문의게시판 삭제
	void deleteInquiry(Long id);

	// 문의게시판 수정페이지조회
	InquiryDTO getInquiryUpdate(Long id);

	// 문의게시판 수정
	void updateInquiry(InquiryDTO inquiry);

	// 문의게시글 검색 기능 추가
	List<InquiryDTO> getInquiryListBySearch(Map<String, String> searchMap);

	// 문의게시판 답변게시글 목록
	List<InquiryDTO> getInquiryListWithAnswers(String type, Integer offset, Integer pageSize, int currentPage);

	// 문의게시판 답변게시글 조회
	InquiryAnswerDTO getAnswerDetail(Long uid);

	// FAQ
	List<FaqDTO> getFaqList();

	List<FaqDTO> getFaqListByType(String type);

}
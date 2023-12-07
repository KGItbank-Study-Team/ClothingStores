package com.kgitbank.slimbear.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.admin.dto.BannerTextDTO;
import com.kgitbank.slimbear.admin.dto.BannerTopDTO;
import com.kgitbank.slimbear.admin.dto.RSYAdminDTO;
import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.NoticeDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.vo.ReviewVO;

@Repository
public class RSYAdminDAO {
	@Autowired
	protected SqlSessionTemplate template;

	// 답글 조회
	public RSYAdminDTO getComment(Long reviewUID) {
		return template.selectOne("com.slimbear.mapper.Board.SELECT_COMMENT_BY_REVIEW_UID", reviewUID);
	}

	// 리뷰 리스트 조회
	public List<ReviewVO> getReviewList() {
		return template.selectList("com.slimbear.mapper.Board.SELECT_REVIEW_LIST_ADMIN");
	}

	// 답글 리스트 조회
	public List<RSYAdminDTO> getCommentList() {
		return template.selectList("com.slimbear.mapper.Board.SELECT_REVIEWCOMENT_LIST");
	}

	// 리뷰 하나만 꺼내쓰기
	public ReviewDTO getReviewByReviewUid(Long reviewUID) {
		return template.selectOne("com.slimbear.mapper.Board.SELECT_REVIEW_BY_REVIEW_UID", reviewUID);
	}

	// 리뷰 데이터 삽입
	public int insertComment(RSYAdminDTO comment) {
		return template.insert("com.slimbear.mapper.Board.INSERT_COMMENT", comment);
	}

	// 리뷰 답글 수정/등록
	public int addOrUpdateComment(RSYAdminDTO comment) {
		return template.insert("com.slimbear.mapper.Board.ADD_OR_UPDATE_COMMENT", comment);
	}

	// 문의 리스트 조회
	public List<InquiryDTO> getInquiryList() {
		return template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRY_LIST_ADMIN");
	}

	// 문의 답글 수정/등록
	public int addOrUpdateAnswer(InquiryAnswerDTO answer) {
		return template.insert("com.slimbear.mapper.Board.ADD_OR_UPDATE_ANSWER", answer);
	}

	// 리뷰 답변 상태 수정
	public void setAnswerStatus(Long inqr_uid) {
		template.update("com.slimbear.mapper.Board.UPDATE_ANSWER_STATUS", inqr_uid);
	}

	// 문의 답변 상태 수정
	public void setCommentStatus(Long reviewUID) {
		template.update("com.slimbear.mapper.Board.UPDATE_COMMENT_STATUS", reviewUID);
	}

	// 문의 숨김
	// 문의 삭제
	public void deleteInquiry(Long uid) {
		template.delete("com.slimbear.mapper.Board.DELETE_INQUIRY", uid);
	}

	public void deleteReview(Long uid) {
		template.delete("com.slimbear.mapper.Board.DELETE_REVIEW", uid);
	}

	// Notice 리스트 조회
	public List<NoticeDTO> getNoticeList() {
		return template.selectList("com.slimbear.mapper.Board.SELECT_NOTICE_LIST_ALL");
	}

	// Notice 상세조회
	public NoticeDTO getNotice(Long uid) {
		return template.selectOne("com.slimbear.mapper.Board.SELECT_NOTICE_DETAIL", uid);
	}

	// Notice 추가
	public int addNotice(NoticeDTO notice) {
		return template.insert("com.slimbear.mapper.Board.INSERT_NOTICE_ADMIN", notice);
	}

	// Notice 수정
	public int updateNotice(NoticeDTO notice) {
		return template.update("com.slimbear.mapper.Board.UPDATE_NOTICE_ADMIN", notice);
	}

	// Notice 삭제
	public void deleteNotice(Long uid) {
		template.delete("com.slimbear.mapper.Board.DELETE_NOTICE", uid);
	}

	// faq 리스트 조회
	public List<FaqDTO> getFaqList() {
		return template.selectList("com.slimbear.mapper.Board.SELECT_FAQ_LIST");
	}

	// Notice 상세조회
	public FaqDTO getFaq(Long uid) {
		return template.selectOne("com.slimbear.mapper.Board.SELECT_FAQ_DETAIL_ADMIN", uid);
	}

	// Notice 추가
	public int addFaq(FaqDTO faq) {
		return template.insert("com.slimbear.mapper.Board.INSERT_FAQ", faq);
	}

	// Notice 수정
	public int updateFaq(FaqDTO faq) {
		return template.update("com.slimbear.mapper.Board.UPDATE_FAQ", faq);
	}

	// Faq 삭제
	public void deleteFaq(Long uid) {
		template.delete("com.slimbear.mapper.Board.DELETE_FAQ", uid);
	}

	// BannerTop리스트가져오기
	public List<BannerTopDTO> getBannerTopList() {
		return template.selectList("com.slimbear.mapper.Page.SELECT_BANNER_TOP");
	}

	// BannerTop 상세조회
	public BannerTopDTO getBannerTop(Long uid) {
		return template.selectOne("com.slimbear.mapper.Page.SELECT_BANNER_TOP_DETAIL", uid);
	}

	// BannerTop 수정
	public int updateBannerTop(BannerTopDTO top) {
		return template.update("com.slimbear.mapper.Page.UPDATE_BANNER_TOP", top);
	}

	// BannerText리스트가져오기
	public List<BannerTextDTO> getBannerTextList() {
		return template.selectList("com.slimbear.mapper.Page.SELECT_BANNER_TEXT_ADMIN");
	}

	// BannerText 상세조회
	public BannerTextDTO getBannerText(Long uid) {
		return template.selectOne("com.slimbear.mapper.Page.SELECT_BANNER_TEXT_DETAIL", uid);
	}

	// BannerText 수정
	public int updateBannerText(BannerTextDTO uid) {
		return template.update("com.slimbear.mapper.Page.UPDATE_BANNER_TEXT", uid);
	}

	// BannerTop 삭제
	public void deleteTop(Long uid) {
		template.delete("com.slimbear.mapper.Page.DELETE_TOP", uid);
	}

	// BannerText 삭제
	public void deleteText(Long uid) {
		template.delete("com.slimbear.mapper.Page.DELETE_TEXT", uid);
	}

	// 배너이미지 추가
	public int addTop(BannerTopDTO top) {
		return template.insert("com.slimbear.mapper.Page.INSERT_TOP", top);
	}

	// 배너텍스트 추가
	public int addText(BannerTextDTO text) {
		return template.insert("com.slimbear.mapper.Page.INSERT_TEXT", text);
	}
}

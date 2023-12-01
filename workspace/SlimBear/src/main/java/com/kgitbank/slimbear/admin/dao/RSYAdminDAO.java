package com.kgitbank.slimbear.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.admin.dto.RSYAdminDTO;
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
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
}

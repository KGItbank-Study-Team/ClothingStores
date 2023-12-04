package com.kgitbank.slimbear.admin.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.admin.dao.RSYAdminDAO;
import com.kgitbank.slimbear.admin.dto.RSYAdminDTO;
import com.kgitbank.slimbear.dto.FaqDTO;
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.NoticeDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.vo.ReviewVO;

@Service
public class RSYAdminServiceImpl {

	@Autowired
	private RSYAdminDAO rsyAdminDAO;

	public RSYAdminDTO getComment(Long reviewUID) {

		RSYAdminDTO comment = rsyAdminDAO.getComment(reviewUID);
		return comment;
	}

	public List<ReviewVO> getReviewList() {

		List<ReviewVO> reviewList = rsyAdminDAO.getReviewList();
		for (ReviewVO review : reviewList) {
			RSYAdminDTO content = rsyAdminDAO.getComment(review.getUid());
			if (content != null && !content.getContent().trim().isEmpty()) {
				review.setStatus("SUCCESS");
			} else if (content == null) {
				review.setStatus("WAIT");
			}
		}
		return reviewList;
	}

	public List<RSYAdminDTO> getCommentList() {

		List<RSYAdminDTO> commentList = rsyAdminDAO.getCommentList();
		return commentList;
	}

	public ReviewDTO getReviewByReviewUid(Long reviewUID) {

		ReviewDTO review = rsyAdminDAO.getReviewByReviewUid(reviewUID);
		return review;
	}

	// 리뷰답글
	public void addOrUpdateComment(Long reviewUID, String commentTitle, String commentContent, String mem_id) {
		RSYAdminDTO comment = new RSYAdminDTO();
		comment.setReview_uid(reviewUID);
		comment.setTitle(commentTitle);
		comment.setContent(commentContent);
		comment.setMem_id(mem_id);

		rsyAdminDAO.addOrUpdateComment(comment);
	}

	// 문의답글
	public void addOrUpdateAnswer(Long inqr_uid, String title, String content, String mem_id, Date reg_date) {
		InquiryAnswerDTO answer = new InquiryAnswerDTO();
		answer.setInqr_uid(inqr_uid);
		answer.setTitle(title);
		answer.setContent(content);
		answer.setMem_id(mem_id);
		answer.setReg_date(reg_date);

		rsyAdminDAO.setAnswerStatus(inqr_uid);
		rsyAdminDAO.addOrUpdateAnswer(answer);
	}

	// 문의숨김
	// 문의삭제
	public void deleteInquiry(InquiryDTO data) {
		Long uid = data.getUid();
		rsyAdminDAO.deleteInquiry(uid);
	}

	// 리뷰삭제
	public void deleteReview(ReviewDTO data) {
		Long uid = data.getUid();
		rsyAdminDAO.deleteReview(uid);
	}

	// 공지사항
	public List<NoticeDTO> getNoticeList() {
		return rsyAdminDAO.getNoticeList();
	}

	public NoticeDTO getNotice(Long uid) {
		return rsyAdminDAO.getNotice(uid);
	}

	// 공지추가
	public void addNotice(String title, String content, int priority, String type, String main_image) {
		NoticeDTO notice = new NoticeDTO();
		Date date = new Date();

		notice.setTitle(title);
		notice.setContent(content);
		notice.setPriority(priority);
		notice.setType(type);
		notice.setMain_image(main_image);
		notice.setReg_date(date);

		rsyAdminDAO.addNotice(notice);
	}

	// 공지수정
	public void updateNotice(Long uid, String title, String content, int priority, String type, String main_image) {
		NoticeDTO notice = new NoticeDTO();
		Date date = new Date();

		notice.setUid(uid);
		notice.setTitle(title);
		notice.setContent(content);
		notice.setPriority(priority);
		notice.setType(type);
		notice.setMain_image(main_image);
		notice.setReg_date(date);

		rsyAdminDAO.updateNotice(notice);
	}

	// 공지삭제
	public void deleteNotice(NoticeDTO data) {
		Long uid = data.getUid();
		rsyAdminDAO.deleteNotice(uid);
	}

	// faq
	public List<FaqDTO> getFaqList() {
		return rsyAdminDAO.getFaqList();
	}

	// faq삭제
	public void deleteFaq(FaqDTO data) {
		Long uid = data.getUid();
		rsyAdminDAO.deleteFaq(uid);
	}
}

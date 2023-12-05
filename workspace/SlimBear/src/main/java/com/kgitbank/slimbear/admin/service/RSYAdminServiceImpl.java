package com.kgitbank.slimbear.admin.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.slimbear.admin.dao.RSYAdminDAO;
import com.kgitbank.slimbear.admin.dto.BannerTextDTO;
import com.kgitbank.slimbear.admin.dto.BannerTopDTO;
import com.kgitbank.slimbear.admin.dto.RSYAdminDTO;
import com.kgitbank.slimbear.common.SlimBearS3;
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
	@Autowired
	private SlimBearS3 s3;

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

	// 문의 리스트
	public List<InquiryDTO> getInquiryList() {
		return rsyAdminDAO.getInquiryList();
	}

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
	public void addNotice(String title, String content, int priority, String type, MultipartFile main_image) {
		NoticeDTO notice = new NoticeDTO();
		Date date = new Date();

		notice.setTitle(title);
		notice.setContent(content);
		notice.setPriority(priority);
		notice.setType(type);
		notice.setMain_image(s3.saveImage(main_image));
		notice.setReg_date(date);

		rsyAdminDAO.addNotice(notice);
	}

	// 공지수정
	public void updateNotice(Long uid, String title, String content, int priority, String type,
			MultipartFile main_image) {
		NoticeDTO notice = new NoticeDTO();
		Date date = new Date();

		notice.setUid(uid);
		notice.setTitle(title);
		notice.setContent(content);
		notice.setPriority(priority);
		notice.setType(type);
		notice.setMain_image(s3.saveImage(main_image));
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

	public FaqDTO getFaq(Long uid) {
		return rsyAdminDAO.getFaq(uid);
	}

	// faq삭제
	public void deleteFaq(FaqDTO data) {
		Long uid = data.getUid();
		rsyAdminDAO.deleteFaq(uid);
	}

	// 공지추가
	public void addFaq(String question, String answer, String type) {
		FaqDTO faq = new FaqDTO();

		faq.setQuestion(question);
		faq.setAnswer(answer);
		faq.setType(type);

		rsyAdminDAO.addFaq(faq);
	}

	// 공지수정
	public void updateFaq(Long uid, String question, String answer, String type) {
		FaqDTO faq = new FaqDTO();

		faq.setUid(uid);
		faq.setQuestion(question);
		faq.setAnswer(answer);
		faq.setType(type);

		rsyAdminDAO.updateFaq(faq);
	}

	// 배너 탑 리스트
	public List<BannerTopDTO> getBannerTopList() {

		List<BannerTopDTO> bannerTopList = rsyAdminDAO.getBannerTopList();
		return bannerTopList;
	}

	// 배너 탑 개별
	public BannerTopDTO getBannerTop(Long uid) {
		return rsyAdminDAO.getBannerTop(uid);
	}

	// 배너 이미지 수정
	public void updateBannerTop(Long uid, MultipartFile image, Long prod_uid) {
		BannerTopDTO bannerTop = new BannerTopDTO();

		bannerTop.setUid(uid);
		bannerTop.setImage(s3.saveImage(image));
		bannerTop.setProd_uid(prod_uid);

		rsyAdminDAO.updateBannerTop(bannerTop);
	}

	// 배너 텍스트 리스트
	public List<BannerTextDTO> getBannerTextList() {

		List<BannerTextDTO> bannerTextList = rsyAdminDAO.getBannerTextList();
		return bannerTextList;
	}

	// 배너 텍스트 개별
	public BannerTextDTO getBannerText(Long uid) {
		return rsyAdminDAO.getBannerText(uid);
	}

	// 배너 텍스트 수정
	public void updateBannerText(Long uid, String banner_text) {
		BannerTextDTO bannerText = new BannerTextDTO();

		bannerText.setUid(uid);
		bannerText.setBannerText(banner_text);

		rsyAdminDAO.updateBannerText(bannerText);
	}
}

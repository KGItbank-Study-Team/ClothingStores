package com.kgitbank.slimbear.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.admin.dao.RSYAdminDAO;
import com.kgitbank.slimbear.admin.dto.RSYAdminDTO;
import com.kgitbank.slimbear.dao.ReviewDAO;
import com.kgitbank.slimbear.dto.ReviewDTO;

@Service
public class RSYAdminServiceImpl {

	@Autowired
	private RSYAdminDAO rsyAdminDAO;

	public RSYAdminDTO getComment(Long reviewUID) {

		RSYAdminDTO comment = rsyAdminDAO.getComment(reviewUID);
		return comment;
	}

	public ReviewDTO getReviewByReviewUid(Long reviewUID) {

		ReviewDTO review = rsyAdminDAO.getReviewByReviewUid(reviewUID);
		return review;
	}
	
	public void addOrUpdateComment(Long reviewUID, String commentTitle, String commentContent, String mem_id) {
		RSYAdminDTO comment = new RSYAdminDTO();
		comment.setReview_uid(reviewUID);
		comment.setTitle(commentTitle);
		comment.setContent(commentContent);
		comment.setMem_id(mem_id);
		rsyAdminDAO.addOrUpdateComment(comment);
	}
}

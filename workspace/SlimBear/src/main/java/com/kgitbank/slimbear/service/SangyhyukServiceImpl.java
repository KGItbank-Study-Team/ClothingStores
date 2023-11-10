package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.ReviewDAO;
import com.kgitbank.slimbear.dto.ReviewDTO;

@Service
public class SangyhyukServiceImpl {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	public List<ReviewDTO> getReviewList(){
		return reviewDAO.getReviewList();
	}
	
	public void insertReview(ReviewDTO review) {
		reviewDAO.insertReview(review);
	}
}

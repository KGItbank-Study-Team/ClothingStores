package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dao.ReviewDAO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;

@Service
public class SangyhyukServiceImpl {
	
	/* 리뷰 데이터 SERVICE */
	@Autowired
	private ReviewDAO reviewDAO;
	
	public List<ReviewDTO> getReviewList() throws Exception {
		return reviewDAO.getReviewList();
	}
	
	public void insertReview(ReviewDTO review) {
		reviewDAO.insertReview(review);
	}
	
	
	/* 상품 상세 데이터 SERVICE */
	@Autowired
	private ProductDAO prodDAO;
	
	public List<ProductDTO> getHotProductList() throws Exception {
		return prodDAO.getProductList();
	}
	
	public ProductDTO getProductByUid(long uid) {
		return prodDAO.getProductByUid(uid);
	}
}
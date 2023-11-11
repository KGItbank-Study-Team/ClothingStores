package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.ReviewDTO;

@Repository
public class ReviewDAO {

	@Autowired
	protected SqlSessionTemplate template;
	 	
	public ReviewDTO getReviewById(long uid) {
		ReviewDTO reviewId = new ReviewDTO();
		reviewId.setUid(uid);
		return template.selectOne("");
	}
	
	// 리뷰 리스트 받아오기
	public List<ReviewDTO> getReviewList() { 
		return template.selectList("com.slimbear.mapper.Board.SELECT_REVIEW_LIST"); // 패키지풀네임.id
	}
	
	// 데이터 넣기
	public int insertReview(ReviewDTO review) {
		return template.insert("com.slimbear.mapper.Board.INSERT_REVIEW", review);
	}
}

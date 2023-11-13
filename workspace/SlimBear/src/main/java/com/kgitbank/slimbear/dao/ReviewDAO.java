package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.ReviewDTO;

import lombok.Delegate;

@Repository
public class ReviewDAO {

	@Autowired
	protected SqlSessionTemplate template;
	 	
	public ReviewDTO getReviewById(long uid) {
		ReviewDTO review = new ReviewDTO();
		review.setUid(uid);
		return template.selectOne("");
	}
	
	// 리뷰 리스트 조회
	public List<ReviewDTO> getReviewList() { 
		return template.selectList("com.slimbear.mapper.Board.SELECT_REVIEW_LIST"); // 패키지풀네임.id
	}
	
	// 최신순으로 리뷰 리스트 받아오기
	public List<ReviewDTO> getReviewListRecent() {
		return template.selectList("com.slimbear.mapper.Board.SELECT_REVIEW_RECENT");
	}
	
	// 리뷰 데이터 삽입
	public int insertReview(ReviewDTO review) {
		return template.insert("com.slimbear.mapper.Board.INSERT_REVIEW", review);
	}
	
	// 리뷰 업데이트
	public int updateReview(ReviewDTO review) {
		return template.update("com.slimbear.mapper.Board.UPDATE_REVIEW", review);
	}
	
	// 리뷰 데이터 삭제
	public int deleteReview(long uid) {
		ReviewDTO review = new ReviewDTO();
		review.setUid(uid);
		return template.delete("com.slimbear.mapper.Board.DELETE_REVIEW", review);
	}
}
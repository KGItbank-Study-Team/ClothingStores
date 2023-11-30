package com.kgitbank.slimbear.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.ReviewDTO;

@Repository
public class ReviewDAO {

	@Autowired
	protected SqlSessionTemplate template;

	public ReviewDTO getReviewById(long uid) {
		ReviewDTO review = new ReviewDTO();
		review.setUid(uid);
		return template.selectOne("");
	}

	// 특정 회원이 작성한 리뷰 조회
	public List<ReviewDTO> getReviewListByUserId(String userID) {
		return template.selectList("com.slimbear.mapper.Board.SELECT_BY_USER_ID", userID);
	}

	// 리뷰 리스트 조회
	public List<ReviewDTO> getReviewList() {
		return template.selectList("com.slimbear.mapper.Board.SELECT_REVIEW_LIST"); // 패키지풀네임.id
	}

	// 최신순으로 리뷰 리스트 받아오기
	public List<ReviewDTO> getReviewListRecent() {
		return template.selectList("com.slimbear.mapper.Board.SELECT_REVIEW_RECENT");
	}

	// 특정 상품 uid 리뷰 조회
	public List<ReviewDTO> getReviewListByUid(long uid) {
		return template.selectList("com.slimbear.mapper.Board.SELECT_BY_PRODCODE", uid);
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

	// 리뷰페이징
	public List<ReviewDTO> getReviewListByUserIdPaging(String userID, int start, int end) {
	    String query = "com.slimbear.mapper.Board.SELECT_BY_USER_ID_PAGING";
	    
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("userID", userID);
	    parameterMap.put("start", start);
	    parameterMap.put("end", end);

	    return template.selectList(query, parameterMap);
	}

	// 추가: 총 리뷰 수를 반환하는 메서드
	public int getTotalReviewCount(String userID) {
	    String query = "com.slimbear.mapper.Board.COUNT_TOTAL_REVIEWS";
	    return template.selectOne(query, userID);
	}



}
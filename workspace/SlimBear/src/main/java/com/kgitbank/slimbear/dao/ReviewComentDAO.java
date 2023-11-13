package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.NoticeDTO;
import com.kgitbank.slimbear.dto.ReviewComentDTO;

@Repository
public class ReviewComentDAO {
	@Autowired
	protected SqlSessionTemplate template;
	
	// ReviewComent 리스트 조회
	public List<ReviewComentDTO> getNoticeList() { 
		return template.selectList("com.slimbear.mapper.Board.SELECT_REVIEWCOMENT_LIST"); // 패키지풀네임.id
	}

	// ReviewComent 데이터 삽입
	public int insertNotice(ReviewComentDTO reviewComent) {
		return template.insert("com.slimbear.mapper.Board.INSERT_REVIEWCOMENT", reviewComent);
	}
	
	// ReviewComent 업데이트
	public int updateNotice(ReviewComentDTO reviewComent) {
		return template.update("com.slimbear.mapper.Board.UPDATE_REVIEWCOMENT", reviewComent);
	}
	
	// ReviewComent 데이터 삭제
	public int deleteNotice(long review_uid) {
		ReviewComentDTO reviewComent = new ReviewComentDTO();
		reviewComent.setReview_uid(review_uid);
		return template.delete("com.slimbear.mapper.Board.DELETE_REVIEWCOMENT", review_uid);
	}
}

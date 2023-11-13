package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.InquiryAnswerDTO;

@Repository
public class InquiryAnswerDAO {

	@Autowired
	protected SqlSessionTemplate template;
	
	// InquiryAnswer 리스트 조회
	public List<InquiryAnswerDTO> getInquiryAnswerList() { 
		return template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRYANSWER_LIST"); // 패키지풀네임.id
	}

	// InquiryAnswer 데이터 삽입
	public int insertInquiryAnswer(InquiryAnswerDTO InquiryAnswer) {
		return template.insert("com.slimbear.mapper.Board.INSERT_INQUIRYANSWER", InquiryAnswer);
	}
	
	// InquiryAnswer 데이터 삭제
	public int deleteInquiryAnswer(long uid) {
		InquiryAnswerDTO inquiryAnswer = new InquiryAnswerDTO();
		inquiryAnswer.setInqr_uid(uid);
		return template.delete("com.slimbear.mapper.Board.DELETE_INQUIRYANSWER", inquiryAnswer);
	}
	
	// InquiryAnswer 업데이트
	public int updateInquiryAnswer(InquiryAnswerDTO InquiryAnswer) {
		return template.update("com.slimbear.mapper.Board.UPDATE_INQUIRYANSWER", InquiryAnswer);
	}
}

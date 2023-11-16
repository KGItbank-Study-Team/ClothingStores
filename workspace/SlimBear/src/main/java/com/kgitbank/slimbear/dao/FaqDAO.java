package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.FaqDTO;


@Repository
public class FaqDAO {

	@Autowired
	protected SqlSessionTemplate template;
	
	// FAQ 리스트 조회
	public List<FaqDTO> getFaqList() { 
		return template.selectList("com.slimbear.mapper.Board.SELECT_FAQ_LIST"); // 패키지풀네임.id
	}
	// 특정 type으로 필터링된 상품문의 리스트 조회
    public List<FaqDTO> getFaqListByType(String type) { 
    	FaqDTO Faq = new FaqDTO();
		Faq.setType(type);
        return template.selectList("com.slimbear.mapper.Board.SELECT_FAQ_LIST_BY_TYPE", Faq);
    }

	// FAQ 데이터 삽입
	public int insertFaq(FaqDTO faq) {
		return template.insert("com.slimbear.mapper.Board.INSERT_FAQ", faq);
	}
	
	// FAQ 업데이트
	public int updateFaq(FaqDTO faq) {
		return template.update("com.slimbear.mapper.Board.UPDATE_FAQ", faq);
	}
	
	// FAQ 데이터 삭제
	public int deleteFaq(long uid) {
		FaqDTO faq = new FaqDTO();
		faq.setUid(uid);
		return template.delete("com.slimbear.mapper.Board.DELETE_FAQ", faq);
	}
}
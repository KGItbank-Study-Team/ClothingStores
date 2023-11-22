package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.InquiryDTO;

@Repository
public class InquiryDAO {
	@Autowired
	protected SqlSessionTemplate template;
	
	// 상품문의 리스트 조회
	public List<InquiryDTO> getInquiryList(String type) {
		InquiryDTO Inquiry = new InquiryDTO();
		Inquiry.setType(type);
		return template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRY_LIST", Inquiry); // 패키지풀네임.id
	}
	
	// 문의게시글 상세페이지조회
	public InquiryDTO getInquiryDetail(Long id) {
	    return template.selectOne("com.slimbear.mapper.Board.SELECT_INQUIRY_DETAIL", id);
	}
	
	
	// 특정 prod_uid 상품문의 조회
    public List<InquiryDTO> getInquiryListByProdUid(long prodUid) {
        return template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRY_PRODUID", prodUid);
    }

	// 상품문의 데이터 삽입
	public int insertInquiry(InquiryDTO inquiry) {
		return template.insert("com.slimbear.mapper.Board.INSERT_INQUIRY", inquiry);
		
	}
	
	// 상품문의 업데이트
	public int updateInquiry(InquiryDTO inquiry) {
		return template.update("com.slimbear.mapper.Board.UPDATE_INQUIRY", inquiry);
	}
	
	// 상품문의 데이터 삭제
	public int deleteInquiry(long uid) {
		InquiryDTO Inquiry = new InquiryDTO();
		Inquiry.setUid(uid);
		return template.delete("com.slimbear.mapper.Board.DELETE_INQUIRY", Inquiry);
	}
}
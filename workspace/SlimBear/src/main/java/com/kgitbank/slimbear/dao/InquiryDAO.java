package com.kgitbank.slimbear.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;

@Repository
public class InquiryDAO {
	@Autowired
	protected SqlSessionTemplate template;
	
	// 상품문의 리스트 조회
//	public List<InquiryDTO> getInquiryList(String type) {
//		InquiryDTO Inquiry = new InquiryDTO();
//		Inquiry.setType(type);
//		return template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRY_LIST", Inquiry); // 패키지풀네임.id
//	}
	public List<InquiryDTO> getInquiryList(String type) {
        List<InquiryDTO> inquiries = template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRY_LIST", type);

        // 각 문의게시글에 대한 답변목록 설정
        for (InquiryDTO inquiry : inquiries) {
            List<InquiryAnswerDTO> answers = getInquiryAnswers(inquiry.getUid());
            inquiry.setAnswers(answers);
        }
        return inquiries;
    }
	// 문의 전체 리스트
	public List<InquiryDTO> getInquiryListAll() {
        List<InquiryDTO> inquiries = template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRY_LIST_ALL");
        return inquiries;
    }
	
	// 문의 prod_uid 조회
	public List<InquiryDTO> getInquiryListByProdUid(Long prodUid) {
		return template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRY_UID_BY_PRODUID", prodUid);
	}
	
	// 회원 문의 게시글 조회
	public List<InquiryDTO> getUserInquiryList(String writer) {
		return template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRY_USER", writer); 
	}
	
	// 문의게시글 상세페이지조회
	public InquiryDTO getInquiryDetail(Long id) {
	    return template.selectOne("com.slimbear.mapper.Board.SELECT_INQUIRY_DETAIL", id);
	}
	// 질문에 대한 답변 목록 조회
    public List<InquiryAnswerDTO> getInquiryAnswerList(Long id) {
        return template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRYANSWER_LIST", id);
    }
	
	
	
	// 문의게시글 삭제
	public int deleteInquiry(Long uid) {
        return template.delete("com.slimbear.mapper.Board.DELETE_INQUIRY", uid);
    }
	
	// 특정 prod_uid 상품문의 조회
    public List<InquiryDTO> getInquiryListByProdUid(long prodUid) {
        return template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRY_UID_BY_PRODUID", prodUid);
    }
    
	// 상품문의 데이터 삽입
	public int insertInquiry(InquiryDTO inquiry) {
		return template.insert("com.slimbear.mapper.Board.INSERT_INQUIRY", inquiry);
	}
	
	// 상품문의 업데이트
	public int updateInquiry(InquiryDTO inquiry) {
		return template.update("com.slimbear.mapper.Board.UPDATE_INQUIRY", inquiry);
	}
	
	// 게시글 검색 기능
    public List<InquiryDTO> getInquiryListBySearch(Map<String, String> searchMap) {
        return template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRY_LIST_BY_SEARCH", searchMap);
    }
	
    // 문의게시글 답변게시글
    public List<InquiryAnswerDTO> getInquiryAnswers(Long inqr_uid) {
        return template.selectList("com.slimbear.mapper.Board.SELECT_INQUIRY_ANSWERS", inqr_uid);
    }
	public InquiryAnswerDTO getAnswerDetail(Long uid) {
		return template.selectOne("com.slimbear.mapper.Board.SELECT_INQUIRY_ANSWERS", uid);
	}
	
	
	
}
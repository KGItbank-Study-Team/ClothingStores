package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.NoticeDTO;

@Repository
public class NoticeDAO {
	
	@Autowired
	protected SqlSessionTemplate template;
	
		// Notice 리스트 조회
		public List<NoticeDTO> getNoticeList(int priority) { 
			NoticeDTO notice = new NoticeDTO();
			notice.setPriority(priority);
			return template.selectList("com.slimbear.mapper.Board.SELECT_NOTICE_LIST", notice); // 패키지풀네임.id
		}
		
		// Notice 게시글 상세페이지조회
		public NoticeDTO getNoticeDetail(Long uid) {// 조회수 증가 쿼리 실행
//	        template.selectOne("com.slimbear.mapper.Board.SELECT_NOTICE_DETAIL", uid);
//		    return template.selectOne("com.slimbear.mapper.Board.SELECT_NOTICE_DETAIL", uid);
			 // 조회수 증가 쿼리 실행
	        int updatedRows = template.update("com.slimbear.mapper.Board.INCREASE_NOTICE_VIEW_COUNT", uid);

	        if (updatedRows > 0) {
	            // 조회수가 증가한 경우에만 상세 조회 수행
	            return template.selectOne("com.slimbear.mapper.Board.SELECT_NOTICE_DETAIL", uid);
	        } else {
	            // 조회수 증가에 실패한 경우 예외 또는 적절한 처리를 수행
	            throw new RuntimeException("Failed to increase view count for notice with uid: " + uid);
	        }
	    }
		
		
		/*
		 * // Inquiry 리스트에서 조회 public List<NoticeDTO> getInquiryNList(String type) {
		 * NoticeDTO notice = new NoticeDTO(); notice.setType(type); return
		 * template.selectList("com.slimbear.mapper.Board.SELECT_NOTICE_LIST", notice);
		 * // 패키지풀네임.id }
		 */
		

		// Notice 데이터 삽입
		public int insertNotice(NoticeDTO notice) {
			return template.insert("com.slimbear.mapper.Board.INSERT_NOTICE", notice);
		}
		
		// Notice 업데이트
		public int updateNotice(NoticeDTO notice) {
			return template.update("com.slimbear.mapper.Board.UPDATE_NOTICE", notice);
		}
		
		// Notice 데이터 삭제
		public int deleteNotice(long uid) {
			NoticeDTO notice = new NoticeDTO();
			notice.setUid(uid);
			return template.delete("com.slimbear.mapper.Board.DELETE_NOTICE", notice);
		}
}

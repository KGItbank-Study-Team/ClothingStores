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
		public List<NoticeDTO> getNoticeList() { 
			return template.selectList("com.slimbear.mapper.Board.SELECT_NOTICE_LIST"); // 패키지풀네임.id
		}

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

package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.MemberCouponDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.dto.WishDTO;

@Repository
public class WishDAO {
	@Autowired
	protected SqlSessionTemplate template;

	public List<WishDTO> getWishListByMemberUID(long memberUID) {
		MemberDTO info = new MemberDTO();
		info.setUid(memberUID);
		return template.selectList("com.slimbear.mapper.Member.SELECT_WISH_LIST_BY_MEMBER_UID", info);
	}
	
	public void insertInWish(WishDTO wish) {
		long uid = selectMaxUid();
		wish.setUid(uid);
		template.insert("com.slimbear.mapper.Member.INSERT_WISH", wish);
	}
	
	public int updateWishList(WishDTO wish) {
		return template.update("com.slimbear.mapper.Member.UPDATE_WISH", wish);
	}
	
	public int deleteWish(long uid) {
		WishDTO wish = new WishDTO();
		wish.setUid(uid);
		return template.delete("com.slimbear.mapper.Member.DELETE_WISH", wish);
	}
	
	public int selectCountInWish(WishDTO wish) {
		int result = template.selectOne("com.slimbear.mapper.Member.SELECT_COUNT_IN_WISH", wish);
		return result;
	}
	
	private long selectMaxUid() {
		long uid = template.selectOne("com.slimbear.mapper.Member.SELECT_MAX_UID_WISH");
		return uid;
	}
}
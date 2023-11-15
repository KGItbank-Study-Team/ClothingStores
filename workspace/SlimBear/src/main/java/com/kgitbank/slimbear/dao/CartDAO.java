package com.kgitbank.slimbear.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.MemberDTO;


@Repository //스프링에서 dao로 인식
public class CartDAO {
	@Autowired
	protected SqlSessionTemplate template;//SqlSessionTemplate 을 사용해서 데이터베이스 접근
	
	public List<CartDTO> getCartListByMemberUID(long memberUID) {//회원 uid를 기반으로 장바구니 목록을 조회
		MemberDTO info = new MemberDTO();
		info.setUid(memberUID);
		return template.selectList("com.slimbear.mapper.Member.SELECT_CART_LIST_BY_MEMBER_UID", info);
	}

	public int insertAddress(CartDTO cart) {
		return template.insert("com.slimbear.mapper.Member.INSERT_CART", cart);
	}
	
	public int updateAddress(CartDTO cart) {//이거 adress>> cart로 바꿔줭
		return template.update("com.slimbear.mapper.Member.UPDATE_CART", cart);
	}
	public int deleteCartItem(Long cartUId) {//장바구니에 있는거 삭제 
		return template.update("com.slimbear.mapper.Member.DELETE_CART", cartUId);
	   
	}
	public int updateCartItemQuantity(Long cartUId, int newQuantity) {// 장바구니에 있는거 수량 업데이
		HashMap<String, String> info = new HashMap<String, String>();
		info.put("uid", cartUId.toString());
		info.put("cnt", String.valueOf(newQuantity));
		return template.update("com.slimbear.mapper.Member.UPDATE_CART_CNT", info);
	}

}

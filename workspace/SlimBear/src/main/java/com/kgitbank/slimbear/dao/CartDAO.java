package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.WishDTO;


@Repository
public class CartDAO {
	@Autowired
	protected SqlSessionTemplate template;
	
	public List<CartDTO> getCartListByMemberUID(long memberUID) {
		MemberDTO info = new MemberDTO();
		info.setUid(memberUID);
		return template.selectList("com.slimbear.mapper.Member.SELECT_CART_LIST_BY_MEMBER_UID", info);
	}

	public int insertAddress(CartDTO cart) {
		return template.insert("com.slimbear.mapper.Member.INSERT_CART", cart);
	}
	
	public int updateAddress(CartDTO cart) {
		return template.update("com.slimbear.mapper.Member.UPDATE_CART", cart);
	}
}

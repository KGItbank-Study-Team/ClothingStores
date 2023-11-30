
package com.kgitbank.slimbear.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;


@Repository //스프링에서 dao로 인식
public class CartDAO {
	@Autowired
	protected SqlSessionTemplate template;//SqlSessionTemplate 을 사용해서 데이터베이스 접근
	
	public List<CartDTO> getCartListByMemberUID(long memberUID) {//회원 uid를 기반으로 장바구니 목록을 조회
		MemberDTO info = new MemberDTO();
		info.setUid(memberUID);
		return template.selectList("com.slimbear.mapper.Member.SELECT_CART_LIST_BY_MEMBER_UID", info);
	}
	
	/* 상품 번호의 개수를 조회 */
	// 쿼리 결과가 1보다 크면 true, 그 외에는 false
	public int selectCountInCart(CartDTO cart) {
		int result = template.selectOne("com.slimbear.mapper.Member.SELECT_COUNT_IN_CART", cart);
		return result;
	}
	
	/* 동일 상품 갯수(결제 버튼 클릭 시 사용) */
	public int equalProdCnt(CartDTO cart) {
		return template.selectOne("com.slimbear.mapper.Member.SELECT_CNT_EQUALS_PROD", cart);
	}
	
	private long selectMaxUid() {
		long uid = template.selectOne("com.slimbear.mapper.Member.SELECT_MAX_UID_CART");
		return uid;
	}
	/* 상품 추가 */
	public void insertInCart(CartDTO cart) {
		long uid = selectMaxUid();
		cart.setUid(uid);
		template.insert("com.slimbear.mapper.Member.INSERT_CART", cart);
	}
	public void addToCart(long memUid, String prodCode, int quantity) {
        HashMap<String, Object> info = new HashMap<>();
        info.put("memUid", memUid);
        info.put("prodCode", prodCode);
        info.put("quantity", quantity);
        template.insert("com.slimbear.mapper.Member.INSERT_CART_INFO", info);
    }
	
	public int updateAddress(CartDTO cart) { // 이거 adress>> cart로 바꿔줭
		return template.update("com.slimbear.mapper.Member.UPDATE_CART", cart);
	}
	public int deleteCartItem(Long cartUId) { // 장바구니에 있는거 삭제 
		return template.update("com.slimbear.mapper.Member.DELETE_CART", cartUId);
	   
	}
	public int updateCartItemQuantity(Long cartUId, int newQuantity) {// 장바구니에 있는거 수량 업데이
		HashMap<String, String> info = new HashMap<String, String>();
		info.put("uid", cartUId.toString());
		info.put("cnt", String.valueOf(newQuantity));
		return template.update("com.slimbear.mapper.Member.UPDATE_CART_CNT", info);
	}
	public List<ProductDetailDTO> getproductdetail(){
		return template.selectList("com.slimbear.mapper.Member.SELECT_PRODUCTDETAIL_RECENT");
	}
	 public void updateCartItemOptions(long uid, String updatedProdCode) {
	        HashMap<String, String> info = new HashMap<>();
	        info.put("uid", String.valueOf(uid));
	        info.put("prodCode", updatedProdCode);
	        template.update("com.slimbear.mapper.Member.UPDATE_CART_OPTIONS", info);
	    }
	
	 public void addChangedOptions(long uid, String updatedProdCode) {
		    HashMap<String, String> info = new HashMap<>();
		    info.put("uid", String.valueOf(uid));
		    info.put("prodCode", updatedProdCode);
		    template.update("com.slimbear.mapper.Member.ADD_CHANGED_OPTIONS", info);
		}
	 public void addCartItem(Long cartUid, Long productUid, String color, String size) {
	        HashMap<String, Object> info = new HashMap<>();
	        info.put("cartUid", cartUid);
	        info.put("productUid", productUid);
	        info.put("color", color);
	        info.put("size", size);
	        template.insert("com.slimbear.mapper.Member.INSERT_CART_ITEM", info);
	    }
	/*
	 * public void updateCartItemOptions(long uid, String color, String size) {
	 * HashMap<String, String> info = new HashMap<>(); info.put("uid",
	 * String.valueOf(uid)); info.put("color", color); info.put("size", size);
	 * template.update("com.slimbear.mapper.Member.UPDATE_CART_ITEM_OPTIONS", info);
	 * }
	 */

	
}

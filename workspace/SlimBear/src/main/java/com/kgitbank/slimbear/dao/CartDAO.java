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
	
	/*
	 * public ProductDetailDTO getProductDetailByUid(long productUID) { return
	 * template.selectOne(
	 * "com.slimbear.mapper.Product.SELECT_PRODUCT_DETAIL_BY_UID", productUID); }
	 * 
	 * public int updateProductDetail(ProductDetailDTO productDetail) { return
	 * template.update("com.slimbear.mapper.Product.UPDATE_PRODUCT_DETAIL",
	 * productDetail); }
	 */	//밑에는 매핑에 추가해야할것
	/*
	 * <select id="SELECT_PRODUCT_DETAIL_BY_UID" resultType="productDetail"
	 * parameterType="long"> SELECT * FROM productDetail WHERE prod_uid=#{prod_uid}
	 * </select>
	 * 
	 * <update id="UPDATE_PRODUCT_DETAIL"> UPDATE productDetail SET color=#{color},
	 * size=#{size}, cnt=#{cnt} WHERE prod_uid=#{prod_uid} </update>
	 */
}

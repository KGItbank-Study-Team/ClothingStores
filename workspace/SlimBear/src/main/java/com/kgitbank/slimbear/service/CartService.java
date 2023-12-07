package com.kgitbank.slimbear.service;

import java.util.List;

import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.vo.MemberCartVO;

public interface CartService {

	List<MemberCartVO> getCartList(long memberUID);

	void addChangedOptions(Long memberUID, long cartUID, long productUid, String color, String size);

	void addCartItem(Long memberUID, Long cartUid, Long productUid, String color, String size);

	void updateCartItemOptions(long cartUid, long productUid, String color, String size);

	int calculateTotalPrice(List<MemberCartVO> cartList);

	int calculatePaymentAmount(List<MemberCartVO> cartList);

	String formatPrice(int price);

	int deleteSelectedItems(List<Long> itemIds);

	void deleteCartItem(long cartUId);

	void updateCartItemQuantity(long productId, int newQuantity);

	void updateCartItem(long productId, int newQuantity);

	// 새로 추가된 메서드
	List<CartDTO> getCartListByMemberUID(long memberUID);

	List<ProductDetailDTO> getProductDetailList();

	List<String> getSizeOptionList();

}
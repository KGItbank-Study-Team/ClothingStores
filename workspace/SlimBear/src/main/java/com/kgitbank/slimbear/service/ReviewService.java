package com.kgitbank.slimbear.service;

import java.util.List;

import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.OrderDetailDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.dto.WishDTO;

public interface ReviewService {

	// 모든 리뷰 리스트 받아오기
	List<ReviewDTO> getReviewList();

	// 리뷰 넣기
	Long insertReview(ReviewDTO review);

	// 특정 상품 uid의 리뷰 조회
	List<ReviewDTO> getReviewListByUid(Long uid);

	// 최신순으로 리뷰 리스트 받아오기
	List<ReviewDTO> getReviewListRecent();

	List<OrderDetailDTO> getOrderListByMemberUID(long orderUID);

	List<ProductDTO> getHotProductList();

	ProductDTO getProductByUid(long uid);

	List<ProductDetailDTO> getProductDetailList(long uid);

	/* 상품 색상 옵션 조회 */
	List<String> getColorOptions(long productUID);

	/* 상품 사이즈 옵션 조회 */
	List<String> getSizeOptions(long productUID);

	// 문의게시판 등록
	void insertInquiry(InquiryDTO inquiryDTO);

	List<InquiryDTO> getInquiryListByProdUid(Long prodUid);

	List<InquiryAnswerDTO> getInquiryAnswerList(long inquiryUid);

	List<InquiryAnswerDTO> getInquiryAnswerByInqrUid(long inquiryUid);

	// 장바구니에 상품 추가
	void addCartItem(long mem_uid, String prod_code, int cnt);

	/* 동일상품 체크 */
	int findCartProducts(CartDTO cart);

	/* 동일상품 갯수 */
	int equalProdCnt(CartDTO cart);

	CartDTO getCartByProdCode(Long memberUID, String code);

	// 장바구니 목록 조회
	List<CartDTO> getCartListByMemberUID(long memberUid);

	void insertInWish(WishDTO wish);

	/* uid로 위시리스트 불러오기 */
	List<WishDTO> getWishListByMemberUID(long memberUid);

	/* 동일상품 체크 */
	int findWishProduct(WishDTO wish);

	ProductDTO getProduct(long prodUID);

	List<OrderDetailDTO> getOrderDetailByOrderUID(long orderUID);

	// insertOrderDetail
	int insertOrder(OrderDetailDTO orderDetail);

	void updateOrderDetail(OrderDetailDTO orderDetail);

}
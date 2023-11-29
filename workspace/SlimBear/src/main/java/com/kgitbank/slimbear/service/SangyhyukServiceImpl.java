package com.kgitbank.slimbear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.exceptions.TemplateAssertionException;

import com.kgitbank.slimbear.dao.CartDAO;
import com.kgitbank.slimbear.dao.InquiryAnswerDAO;
import com.kgitbank.slimbear.dao.InquiryDAO;
import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dao.ProductDetailDAO;
import com.kgitbank.slimbear.dao.ReviewDAO;
import com.kgitbank.slimbear.dao.WishDAO;
import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.dto.WishDTO;

@Service
public class SangyhyukServiceImpl {
	
	/* 리뷰 데이터 SERVICE */
	@Autowired
	private ReviewDAO reviewDAO;
	
	// 모든 리뷰 리스트 받아오기
	public List<ReviewDTO> getReviewList() {
		return reviewDAO.getReviewList();
	}
	
	// 특정 상품 uid의 리뷰 조회
	public List<ReviewDTO> getReviewListByUid(long uid) {
		return reviewDAO.getReviewListByUid(uid);
	}
	
	// 최신순으로 리뷰 리스트 받아오기
	public List<ReviewDTO> getReviewListRecent() {
		return reviewDAO.getReviewListRecent();
	}
	
	// 리뷰 데이터 넣기
	public void insertReview(ReviewDTO review) {
		reviewDAO.insertReview(review);
	}
	
	
	/* 상품 상세 데이터 SERVICE */
	@Autowired
	private ProductDAO prodDAO;
	
	public List<ProductDTO> getHotProductList() {
		return prodDAO.getProductList();
	}
	
	public ProductDTO getProductByUid(long uid) {
		return prodDAO.getProductByUid(uid);
	}
	
	
	/* 상품 옵션 데이터 받아오기 */
	@Autowired
	public ProductDetailDAO prodDetailDAO;
	
	public List<ProductDetailDTO> getProductDetailList(long uid) {
		return prodDetailDAO.getProductDetailList(uid);
	}
	
	/* 상품 색상 옵션 조회 */
	public List<String> getColorOptions(long productUID) {
		return prodDetailDAO.getColorOptions(productUID);
	}
	
	/* 상품 사이즈 옵션 조회 */
	public List<String> getSizeOptions(long productUID) {
		return prodDetailDAO.getSizeOptions(productUID);
	}
	
    // 문의게시판 등록
	public void insertInquiry(InquiryDTO inquiryDTO) {
		inquiryDAO.insertInquiry(inquiryDTO);
	}
	
	/* inquiry 데이터 받아오기 */
	@Autowired
	public InquiryDAO inquiryDAO;
	
	public List<InquiryDTO> getInquiryListByProdUid(long prodUid) {
		return inquiryDAO.getInquiryListByProdUid(prodUid);
	}
	
	/* inquiryAnswer 데이터 받아오기 */
	@Autowired
	private InquiryAnswerDAO inquiryAnswerDAO;
	
//	public InquiryAnswerDTO getInquiryAnswerList(long inquiryUid){
//		return inquiryAnswerDAO.getInquiryAnswerList(inquiryUid);
//	}
	
	
	/* 상품 장바구니 */
	@Autowired
	public CartDAO cartDAO;
	
	/* 장바구니에 상품 추가 */
	public void insertInCart(CartDTO cart) {
		cartDAO.insertInCart(cart);
	}
	
	/* 동일상품 체크 */
	public int findCartProducts(CartDTO cart) {
		return cartDAO.selectCountInCart(cart);
	}
	
	/* 동일상품 갯수 */ 
	public int equalProdCnt(CartDTO cart) {
		return cartDAO.equalProdCnt(cart);
	}
	
	public List<CartDTO> getCartListByMemberUID(long memberUid) {
		MemberDTO info = new MemberDTO();
		info.setUid(memberUid);
		return cartDAO.getCartListByMemberUID(memberUid);
	}
	
	/* 위시리스트에 상품 추가 */
	@Autowired
	public WishDAO wishDAO;
	
	public void insertInWish(WishDTO wish) {
		wishDAO.insertInWish(wish);
	}
	
	/* uid로 위시리스트 불러오기 */
	public List<WishDTO> getWishListByMemberUID(long memberUid) {
		return wishDAO.getWishListByMemberUID(memberUid);
	}
	
	/* 동일상품 체크 */
	public int findWishProduct(WishDTO wish) {
		return wishDAO.selectCountInWish(wish);
	}
}
package com.kgitbank.slimbear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.CartDAO;
import com.kgitbank.slimbear.dao.InquiryAnswerDAO;
import com.kgitbank.slimbear.dao.InquiryDAO;
import com.kgitbank.slimbear.dao.OrderDAO;
import com.kgitbank.slimbear.dao.OrderDetailDAO;
import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dao.ProductDetailDAO;
import com.kgitbank.slimbear.dao.ReviewDAO;
import com.kgitbank.slimbear.dao.WishDAO;
import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.OrderDetailDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.dto.WishDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	/* 리뷰 데이터 SERVICE */
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	// 모든 리뷰 리스트 받아오기
	@Override
	public List<ReviewDTO> getReviewList() {
		return reviewDAO.getReviewList();
	}
	
	// 리뷰 넣기
	@Override
	public Long insertReview(ReviewDTO review) {
		reviewDAO.insertReview(review);
		return review.getUid();
	}
	
	// 특정 상품 uid의 리뷰 조회
	@Override
	public List<ReviewDTO> getReviewListByUid(Long uid) {
		return reviewDAO.getReviewListByUid(uid);
	}
	
	// 최신순으로 리뷰 리스트 받아오기
	@Override
	public List<ReviewDTO> getReviewListRecent() {
		return reviewDAO.getReviewListRecent();
	}

	// 주문 디테일 정보 (리뷰 쓰는데 필요함)
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	@Override
	public List<OrderDetailDTO> getOrderListByMemberUID(long orderUID) {
		return orderDetailDAO.getOrderListByMemberUID(orderUID);
	}
	
	/* 상품 상세 데이터 SERVICE */
	@Autowired
	private ProductDAO prodDAO;
	
	@Override
	public List<ProductDTO> getHotProductList() {
		return prodDAO.getProductList();
	}
	
	@Override
	public ProductDTO getProductByUid(long uid) {
		return prodDAO.getProductByUid(uid);
	}
	
	
	/* 상품 옵션 데이터 받아오기 */
	@Autowired
	private ProductDetailDAO prodDetailDAO;
	
	@Override
	public List<ProductDetailDTO> getProductDetailList(long uid) {
		return prodDetailDAO.getProductDetailList(uid);
	}
	
	/* 상품 색상 옵션 조회 */
	@Override
	public List<String> getColorOptions(long productUID) {
		return prodDetailDAO.getColorOptions(productUID);
	}
	
	/* 상품 사이즈 옵션 조회 */
	@Override
	public List<String> getSizeOptions(long productUID) {
		return prodDetailDAO.getSizeOptions(productUID);
	}
	
    // 문의게시판 등록
	@Override
	public void insertInquiry(InquiryDTO inquiryDTO) {
		inquiryDAO.insertInquiry(inquiryDTO);
	}
	
	/* inquiry 데이터 받아오기 */
	@Autowired
	public InquiryDAO inquiryDAO;
	
	@Override
	public List<InquiryDTO> getInquiryListByProdUid(Long prodUid) {
		return inquiryDAO.getInquiryListByProdUid(prodUid);
	}
	
	/* inquiryAnswer 데이터 받아오기 */
	@Autowired
	private InquiryAnswerDAO inquiryAnswerDAO;
	
	@Override
	public List<InquiryAnswerDTO> getInquiryAnswerList(long inquiryUid){
		return inquiryAnswerDAO.getInquiryAnswerList(inquiryUid);
	}
	
	@Override
	public List<InquiryAnswerDTO> getInquiryAnswerByInqrUid(long inquiryUid) {
		return inquiryAnswerDAO.getInquiryAnswerByInqrUid(inquiryUid);
	}
	
	
	/* 상품 장바구니 */
	@Autowired
	private CartDAO cartDAO;
	
	// 장바구니에 상품 추가
	@Override
	public void addCartItem(long mem_uid, String prod_code, int cnt) {
		cartDAO.addCartItem(mem_uid, prod_code, cnt);
	}
	
	/* 동일상품 체크 */
	@Override
	public int findCartProducts(CartDTO cart) {
		return cartDAO.selectCountInCart(cart);
	}
	
	/* 동일상품 갯수 */ 
	@Override
	public int equalProdCnt(CartDTO cart) {
		return cartDAO.equalProdCnt(cart);
	}
	
    @Override
	public CartDTO getCartByProdCode(Long memberUID, String code) {
        return cartDAO.getCartByProdCode(memberUID, code);
    }
	
	// 장바구니 목록 조회
	@Override
	public List<CartDTO> getCartListByMemberUID(long memberUid) {
		MemberDTO info = new MemberDTO();
		info.setUid(memberUid);
		return cartDAO.getCartListByMemberUID(memberUid);
	}
	
	/* 위시리스트에 상품 추가 */
	@Autowired
	private WishDAO wishDAO;
	
	@Override
	public void insertInWish(WishDTO wish) {
		wishDAO.insertInWish(wish);
	}
	
	/* uid로 위시리스트 불러오기 */
	@Override
	public List<WishDTO> getWishListByMemberUID(long memberUid) {
		return wishDAO.getWishListByMemberUID(memberUid);
	}
	
	/* 동일상품 체크 */
	@Override
	public int findWishProduct(WishDTO wish) {
		return wishDAO.selectCountInWish(wish);
	}
	
	//주문내역
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public ProductDTO getProduct(long prodUID) {
		return productDAO.getProductByUid(prodUID);
	}
	
	@Override
	public List<OrderDetailDTO> getOrderDetailByOrderUID(long orderUID) {

		List<OrderDetailDTO> orderDetail = orderDetailDAO.getOrderDetailByOrderUID(orderUID);
		

		return orderDetail;
	}

	// insertOrderDetail
	@Override
	public int insertOrder(OrderDetailDTO orderDetail) {
		return orderDetailDAO.insertOrder(orderDetail);
	}

	@Override
	public void updateOrderDetail(OrderDetailDTO orderDetail) {
		orderDetailDAO.updateReviewUID(orderDetail);
	}
}

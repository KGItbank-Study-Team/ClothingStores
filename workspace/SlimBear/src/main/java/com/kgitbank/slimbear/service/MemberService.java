package com.kgitbank.slimbear.service;

import java.util.Date;
import java.util.List;

import com.kgitbank.slimbear.dto.CouponDTO;
import com.kgitbank.slimbear.dto.MemberCouponDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.MemberOrderAddressDTO;
import com.kgitbank.slimbear.vo.AddrVO;
import com.kgitbank.slimbear.vo.CouponVO;
import com.kgitbank.slimbear.vo.MemberBoardVO;
import com.kgitbank.slimbear.vo.MileageVO;
import com.kgitbank.slimbear.vo.ModifyVO;
import com.kgitbank.slimbear.vo.MyPageVO;
import com.kgitbank.slimbear.vo.OrderVO;
import com.kgitbank.slimbear.vo.WishListVO;
import com.kgitbank.slimbear.vo.reviewListVO;

public interface MemberService {

	boolean join(MemberDTO member);

	MemberDTO getMemberById(String id);

	List<MemberDTO> getMemberList();

	MemberDTO getMemberByUID(Long uid);

	MemberDTO getMemberByEmail(String email);

	CouponDTO getCoupon(String code);

	MemberCouponDTO getMemberCouponByUID(long memberUID, long uid);

	int registerCoupon(MemberCouponDTO coupon);

	MyPageVO getMyPageInfo(long uid);

	//주문내역
	List<OrderVO> getOrderListInfo(long memberUID, String searchType, Date startDate, Date endDate);

	//주문상세내역
	OrderVO getOrderDetailInfo(long orderUID);

	//프로필
	ModifyVO getModifyInfo(long uid);

	//적립금
	MileageVO getMileageInfo(long mem_uid);

	//적립금 리스트
	List<MileageVO> getMileageListInfo(long memberUID);

	//쿠폰리스트
	List<CouponVO> getCouponListInfo(long memberUID);

	//위시리스트
	List<WishListVO> getWishListInfo(long memberUID);

	//	위시리스트 삭제
	void deleteWish(long uid);

	//  문의게시판
	List<MemberBoardVO> getMemberBoardInfo(String writer);

	//리뷰게시판
	List<reviewListVO> getReviewListInfoPaging(String userID, int start, int end);

	// 추가: 총 리뷰 수를 반환하는 메서드
	int getTotalReviewCount(String userID);

	//배송지
	List<AddrVO> getAddrInfo(long memberUID);

	//배송지 수정
	AddrVO getAddrFixInfo(long addressUID);

	void updateAddress(long memberUID, MemberOrderAddressDTO address);

	void insertAddress(long memberUID, MemberOrderAddressDTO address);

	//배송지 삭제
	void deleteAddress(long addressUID);

	void updateMemberInfo(long memberUID, ModifyVO modInfo);

	// 아이디찾기
	MemberDTO findId(String name, String email, String phone);

	// 비밀번호찾기
	MemberDTO findPassword(String name, String id, String email, String phone);

	MemberDTO replacePasswordByEmail(String email, String temporaryPassword);

	MemberDTO replacePasswordByPhone(String phone, String temporaryPassword);

}
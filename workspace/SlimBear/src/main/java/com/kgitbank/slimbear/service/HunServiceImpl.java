package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.common.SlimBearUtil;
import com.kgitbank.slimbear.dao.CouponDAO;
import com.kgitbank.slimbear.dao.MemberCouponDAO;
import com.kgitbank.slimbear.dao.MemberDAO;
import com.kgitbank.slimbear.dao.MemberOrderAddressDAO;
import com.kgitbank.slimbear.dao.NoticeDAO;
import com.kgitbank.slimbear.dao.OrderDAO;
import com.kgitbank.slimbear.dao.WishDAO;
import com.kgitbank.slimbear.dto.CouponDTO;
import com.kgitbank.slimbear.dto.MemberCouponDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.MemberOrderAddressDTO;
import com.kgitbank.slimbear.dto.NoticeDTO;
import com.kgitbank.slimbear.dto.OrderDTO;
import com.kgitbank.slimbear.dto.WishDTO;
import com.kgitbank.slimbear.vo.AddrVO;
import com.kgitbank.slimbear.vo.CouponVO;
import com.kgitbank.slimbear.vo.DepositsVO;
import com.kgitbank.slimbear.vo.MemberBoardVO;
import com.kgitbank.slimbear.vo.MileageVO;
import com.kgitbank.slimbear.vo.ModifyVO;
import com.kgitbank.slimbear.vo.MyPageVO;
import com.kgitbank.slimbear.vo.OrderListVO;
import com.kgitbank.slimbear.vo.RefundVO;
import com.kgitbank.slimbear.vo.WishListVO;

@Service
public class HunServiceImpl {

	@Autowired
	private MemberDAO memDAO;

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private CouponDAO couponDAO;

	@Autowired
	private MemberCouponDAO membercouponDAO;

	@Autowired
	private WishDAO wishDAO;

	@Autowired
	private NoticeDAO noticeDAO;

	@Autowired
	private MemberOrderAddressDAO addressDAO;

	public MyPageVO getMyPageInfo(long uid) {
		MyPageVO vo = new MyPageVO();
		MemberDTO member = memDAO.getMemberByUID(uid);

		vo.setUsername(member.getName());
		vo.setGrade("member[멤버]");
		vo.setUpgrade("family[패밀리]");
		vo.setUpgradeMoney(300000);
		vo.setYearMoney(30000);
		vo.setReserve(12000);
		vo.setTotalReserve(17000);
		vo.setUseReserve(5000);
		vo.setDeposit(50000);
		vo.setTotalOrderM(980000);
		vo.setTotalOrderN(13);
		vo.setCoupon(1);
		vo.setBeforeDeposit(1);
		vo.setPreparingDelivery(2);
		vo.setTransit(3);
		vo.setDelivered(4);
		vo.setCancel(5);
		vo.setExchange(6);
		vo.setTurn(7);

		return vo;
	}

	public List<OrderListVO> getOrderListInfo(long memberUID) {

		ArrayList<OrderListVO> list = new ArrayList<>();
		List<OrderDTO> orderlist = orderDAO.getOrderListByMemberUID(memberUID);

		for (OrderDTO i : orderlist) {
			OrderListVO vo = new OrderListVO();

			vo.setOrderDate(i.getOrder_date());
			vo.setOrderNum(37859);
			vo.setProductImage("이미지링크");
			vo.setProductName("승택형이입는 빅사이즈옷");
			vo.setProductOption("승택이형 특별 에디션");
			vo.setOrderCount(1);
			vo.setOrderAmount(i.getTotal_price());
			vo.setOrderStatus(i.getStatus());
			vo.setFluctuation("반품신청");

			list.add(vo);
		}
		return list;
	}

	public List<OrderListVO> getPastListInfo(long memberUID) {

		ArrayList<OrderListVO> list = new ArrayList<>();
		List<OrderDTO> pastlist = orderDAO.getOrderListByMemberUID(memberUID);

		for (OrderDTO i : pastlist) {
			OrderListVO vo = new OrderListVO();

			vo.setOrderDate(i.getOrder_date());
			vo.setOrderNum(50572);
			vo.setProductImage("이미지링크");
			vo.setProductName("승택형이입는 스몰사이즈옷");
			vo.setProductOption("승택이형 도트 에디션");
			vo.setOrderCount(2);
			vo.setOrderAmount(i.getTotal_price());
			vo.setOrderStatus(i.getStatus());
			vo.setFluctuation("반품신청");

			list.add(vo);
		}
		return list;
	}

	public ModifyVO getModifyInfo(long uid) {
		ModifyVO vo = new ModifyVO();
		MemberDTO member = memDAO.getMemberByUID(uid);

		String[] address = SlimBearUtil.splitAddress(member.getAddress());
		String[] phone = SlimBearUtil.splitPhoneNumber(member.getPhone());

		vo.setUsername(member.getName());
		vo.setGrade("member[멤버]");
		vo.setUserID(member.getId());
		vo.setPostcode(address[0]);
		vo.setDefaultAddr(address[1]);
		vo.setRemainAddr(address[2]);
		vo.setPhone0(phone[0]);
		vo.setPhone1(phone[1]);
		vo.setPhone2(phone[2]);
		vo.setMobile0(phone[0]);
		vo.setMobile1(phone[1]);
		vo.setMobile2(phone[2]);
		vo.setEmail(member.getEmail());
		vo.setUserYear(1994);
		vo.setUserMonth(9);
		vo.setUserDay(11);
		vo.setRefundAccount("[산적은행] 123-4567-890 / 예금주: 연해적");

		return vo;
	}

	public RefundVO getRefundInfo(long uid) {
		RefundVO vo = new RefundVO();
		MemberDTO member = memDAO.getMemberByUID(uid);

		vo.setUsername(member.getName());
		vo.setBankNumber("94320200174653");

		return vo;
	}

	public MileageVO getMileageInfo(long uid) {
		MileageVO vo = new MileageVO();

		vo.setTotalReserve(5000);
		vo.setReserve(2000);
		vo.setUseReserve(3000);
		vo.setUnReserve(0);

		return vo;
	}

	public DepositsVO getDepositsInfo(long uid) {
		DepositsVO vo = new DepositsVO();

		vo.setAccrueDeposit(70000);
		vo.setUseDeposit(20000);
		vo.setDeposit(50000);
		vo.setRefundDeposit(0);

		return vo;
	}

	public List<CouponVO> getCouponListInfo(long memberUID) {

		ArrayList<CouponVO> list = new ArrayList<>();
		List<MemberCouponDTO> membercouponlist = membercouponDAO.getCouponListByMemberUID(memberUID);

		for (MemberCouponDTO i : membercouponlist) {
			CouponVO vo = new CouponVO();

			vo.setCouponNumber(1);
			vo.setCouponName("개쩌는쿠폰");
			vo.setCouponProduct("4XL 이상 상품");
			vo.setMinimumAmount(99000);
			vo.setPayMethod("계좌이체");
			vo.setCouponBenefit("15% 할인");
			vo.setCouponPeriod(i.getExpi_date());

			list.add(vo);
		}
		return list;
	}

	public List<WishListVO> getWishListInfo(long memberUID) {
		ArrayList<WishListVO> list = new ArrayList<>();
		List<WishDTO> wishlist = wishDAO.getWishListByMemberUID(memberUID);

		for (WishDTO i : wishlist) {
			WishListVO vo = new WishListVO();
			vo.setProductURL("http://localhost:9090/app/product?p=1");
			vo.setProductImage("outerEx01.gif");
			vo.setProductName(i.getProd_code());
			vo.setOrderAmount(110000);
			vo.setOrderDiscount(99000);

			list.add(vo);
		}
		return list;
	}

	public List<MemberBoardVO> getMemberBoardInfo(int priority) {
		ArrayList<MemberBoardVO> list = new ArrayList<>();
		List<NoticeDTO> boardlist = noticeDAO.getNoticeList(priority);

		for (NoticeDTO i : boardlist) {
			MemberBoardVO vo = new MemberBoardVO();
			vo.setBoardNumber(i.getPriority());
			vo.setBoardGroup(i.getType());
			vo.setBoardTitle(i.getTitle());
			vo.setBoardWriter(i.getWriter());
			vo.setBoardDate(i.getReg_date());
			vo.setBoardHits(1);

			list.add(vo);
		}
		return list;
	}

	public List<AddrVO> getAddrInfo(long memberUID) {
		ArrayList<AddrVO> list = new ArrayList<>();
		List<MemberOrderAddressDTO> addrlist = addressDAO.getAddressListByMemberUID(memberUID);

		for (MemberOrderAddressDTO i : addrlist) {
			AddrVO vo = new AddrVO();
			vo.setAddrName(i.getName());
			vo.setRecipient(i.getRecipient());
			vo.setPhone(i.getNomal_phone());
			vo.setMobile(i.getPhone());

			String[] address = SlimBearUtil.splitAddress(i.getAddress());
			vo.setPostcode(address[0]);
			vo.setDefaultAddr(address[1]);
			vo.setRemainAddr(address[2]);

			list.add(vo);
		}
		return list;
	}

//	public List<AddrVO> getAddrFixInfo(long memberUID) {
//		ArrayList<AddrVO> list = new ArrayList<>();
//		List<MemberOrderAddressDTO> fix = memberorderaddressDAO.getAddressListByMemberUID(memberUID);
//		
//		for(MemberOrderAddressDTO i : fix) {
//			AddrVO vo = new AddrVO();
//			vo.setAddrName(i.getName());
//			vo.setRecipient(i.getRecipient());
//			
//			String[] address = SlimBearUtil.splitAddress(i.getAddress());
//			vo.setPostcode(address[0]);
//			vo.setDefaultAddr(address[1]);
//			vo.setRemainAddr(address[2]);
//			
//			String[] phone = SlimBearUtil.splitPhoneNumber(i.getNomal_phone());
//			vo.setPhone1(phone[0]);
//			vo.setPhone2(phone[1]);
//			vo.setPhone3(phone[2]);
//			
//			String[] mobile = SlimBearUtil.splitPhoneNumber(i.getPhone());
//			vo.setMobile1(mobile[0]);
//			vo.setMobile2(mobile[1]);
//			vo.setMobile3(mobile[2]);
//			
//			list.add(vo);
//		}
//		return list;
//	}

//	public AddrVO getAddrFixInfo(long memberUID) {
//		AddrVO vo = new AddrVO();
//		MemberOrderAddressDTO fix = memberorderaddressDAO.getAddressListByMemberUID(memberUID);
//		
//		vo.setAddrName(fix.getName());
//		vo.setRecipient(fix.getRecipient());
//		
//		String[] address = SlimBearUtil.splitAddress(fix.getAddress());
//		vo.setPostcode(address[0]);
//		vo.setDefaultAddr(address[1]);
//		vo.setRemainAddr(address[2]);
//		
//		String[] phone = SlimBearUtil.splitPhoneNumber(fix.getNomal_phone());
//		vo.setPhone1(phone[0]);
//		vo.setPhone2(phone[1]);
//		vo.setPhone3(phone[2]);
//		
//		String[] mobile = SlimBearUtil.splitPhoneNumber(fix.getPhone());
//		vo.setMobile1(mobile[0]);
//		vo.setMobile2(mobile[1]);
//		vo.setMobile3(mobile[2]);
//		
//		return vo;
//	}

//	public AddrVO addAddr(MemberOrderAddressDTO address) {
//		AddrVO vo = new AddrVO();
//		
//		addressDAO.insertAddress(address);
//		return vo;
//	}
//	
	public int insertAddress(MemberOrderAddressDTO address) {
		return addressDAO.insertAddress(address);
	}

}

package com.kgitbank.slimbear.common;

public class SlimBearEnum {
	public enum ORDER_STATUS {
		STAY,			// 미처리
		PREPARING,		// 제품 준비중
		STAY_DLV,		// 배송 대기
		DELIVERY,		// 배송 중
		DONE,			// 완료
		CANCEL,			// 취소
		
		RETURN,			// 반품
		IN_RETURN,		// 반품 진행중
		TRY_RETURN,		// 반품 신청
	}
	
	public enum PAYMENT_STATUS{
		SATY,		 // 미결제
		DONE,		 // 결제완료
		CANCEL,		 // 결제취소
		RETURN		 // 환불
	}
	
	public enum MEMBER_TYPE{
		SLIMBEAR,
		KAKAO,
		NAVER
	}
	
	public enum MEMBER_STATUS{
		ACTIVE,
		WITHDRAWAL
	}
}

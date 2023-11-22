package com.kgitbank.slimbear.common;

public class SlimBearEnum {
	public enum ORDER_STATUS {
		STAY,			// 미처리
		PREPARING,		// 준비중
		STAY_DLV,		// 배송 대기
		DELIVERY,		// 배송 중
		CANCEL,			// 취소
		DONE			// 완료
	}
	
	public enum PAY_STATUS{
		SATY, // 미처리
		PREPARING, // 처리중
		DONE //결제완료
	}
	
	public enum PAY_TYPE{
		CARD
	}
}

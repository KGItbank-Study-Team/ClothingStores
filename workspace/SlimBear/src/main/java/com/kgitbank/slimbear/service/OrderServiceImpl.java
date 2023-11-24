package com.kgitbank.slimbear.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.common.SlimBearImportPayment;
import com.kgitbank.slimbear.dao.OrderDAO;
import com.kgitbank.slimbear.dao.OrderDetailDAO;
import com.kgitbank.slimbear.dao.OrderPaymentDAO;
import com.kgitbank.slimbear.vo.command.OrderCommand;
import com.siot.IamportRestClient.exception.IamportResponseException;

@Service
public class OrderServiceImpl {

	@Autowired
	private SlimBearImportPayment slimBearImportPayment;

	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	@Autowired
	private OrderPaymentDAO paymentDAO;

	public void productOrder(long mem_uid, OrderCommand order) throws IamportResponseException, IOException {
		slimBearImportPayment.refundRequest(order.getCode(), "테스트");
		// IamportResponse<Payment> payment =
		// slimBearImportPayment.getPaymentRecord(order.getCode());

		/*
		 * // 주문정보과 결제정보 비교 if(payment.getResponse().getAmount().intValue() ==
		 * order.getAmount()) { // 주문정보 저장 실행 try {
		 * 
		 * }catch(Exception e){ slimBearImportPayment.refundRequest(order.getCode(),
		 * "주문정보 저장실패"); throw new SlimBearException("주문정보 저장실패"); }
		 * 
		 * }else { slimBearImportPayment.refundRequest(order.getCode(), "유효하지 않은 정보");
		 * throw new SlimBearException("유효하지 않은 주문 정보"); }
		 */
	}
}

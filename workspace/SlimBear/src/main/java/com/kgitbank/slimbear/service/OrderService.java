package com.kgitbank.slimbear.service;

import java.util.List;

import com.kgitbank.slimbear.dto.OrderDTO;
import com.kgitbank.slimbear.dto.OrderPaymentDTO;
import com.kgitbank.slimbear.vo.MemberCartVO;

public interface OrderService {

	void productOrder(long mem_uid, String imp_uid, OrderDTO order, OrderPaymentDTO payment, List<MemberCartVO> carts, long applyCouponUID);

	void orderCancel(long order_uid, String reason);

	void orderReturn(long order_uid, String reason);

	void orderStatusChange(Long orderUID, String status);
}
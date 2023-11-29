package com.kgitbank.slimbear.service;

import java.io.IOException;
import java.util.List;

import com.kgitbank.slimbear.dto.OrderDTO;
import com.kgitbank.slimbear.dto.OrderPaymentDTO;
import com.kgitbank.slimbear.vo.MemberCartVO;
import com.siot.IamportRestClient.exception.IamportResponseException;

public interface OrderService {

	void productOrder(long mem_uid, String imp_uid, OrderDTO order, OrderPaymentDTO payment, List<MemberCartVO> carts);
}
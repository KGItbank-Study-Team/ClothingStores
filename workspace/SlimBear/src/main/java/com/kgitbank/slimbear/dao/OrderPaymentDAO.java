package com.kgitbank.slimbear.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.OrderDTO;
import com.kgitbank.slimbear.dto.OrderPaymentDTO;

@Repository
public class OrderPaymentDAO {
	@Autowired
	protected SqlSessionTemplate template;
	
	public OrderPaymentDTO getPaymentByOrderUID(long orderUID){
		return template.selectOne("com.slimbear.mapper.Order.SELECT_PAYMENT_BY_ORDER_UID", orderUID);
	}
	
	public int insertOrder(OrderPaymentDTO payment) {
		return template.insert("com.slimbear.mapper.Order.INSERT_PAYMENT", payment);
	}
	
	public int updateOrder(OrderPaymentDTO payment) {
		return template.update("com.slimbear.mapper.Order.UPDATE_PAYMENT", payment);
	}

	public void updatePaymentStatus(OrderPaymentDTO payment) {
		template.update("com.slimbear.mapper.Order.UPDATE_PAYMENT_STATUS", payment);
	}

}

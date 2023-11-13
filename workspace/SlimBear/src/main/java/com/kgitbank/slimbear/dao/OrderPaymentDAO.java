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
	
	public OrderPaymentDTO getOrderListByMemberUID(long orderUID){
		OrderDTO info = new OrderDTO();
		info.setUid(orderUID);
		return template.selectOne("com.slimbear.mapper.Order.SELECT_PAYMENT_BY_ORDER_UID", info);
	}
	
	public int insertOrder(OrderPaymentDTO order) {
		return template.insert("com.slimbear.mapper.Order.INSERT_PAYMENT", order);
	}
	
	public int updateOrder(OrderPaymentDTO order) {
		return template.update("com.slimbear.mapper.Order.UPDATE_PAYMENT", order);
	}

}

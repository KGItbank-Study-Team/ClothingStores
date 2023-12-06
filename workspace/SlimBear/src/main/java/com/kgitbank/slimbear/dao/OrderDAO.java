package com.kgitbank.slimbear.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.OrderDTO;

@Repository
public class OrderDAO {
	
	@Autowired
	protected SqlSessionTemplate template;
	
	public List<OrderDTO> getOrderListByMemberUID(long memberUID, String status, Date startDate ,Date endDate){
		HashMap<String, Object> info = new HashMap<String, Object>();
		info.put("memberUID", memberUID);
		info.put("status", status);
		info.put("startDate", startDate);
		info.put("endDate", endDate);
		return template.selectList("com.slimbear.mapper.Order.SELECT_ORDER_LIST_BY_MEMBER_UID", info);
	}
	
	public OrderDTO getOrderByUID(long orderUID){
		return template.selectOne("com.slimbear.mapper.Order.SELECT_ORDER_BY_UID", orderUID);
	}
	
	public int insertOrder(OrderDTO order) {
		return template.insert("com.slimbear.mapper.Order.INSERT_ORDER", order);
	}
	
	public int updateOrder(OrderDTO order) {
		return template.update("com.slimbear.mapper.Order.UPDATE_ORDER", order);
	}
	
	public int updateOrderStatus(OrderDTO order) {
		return template.update("com.slimbear.mapper.Order.UPDATE_ORDER_STATUS", order);
	}
	
	public int deleteOrder(OrderDTO order) {
		return template.delete("com.slimbear.mapper.Order.DELETE_ORDER", order);
	}
	
	public List<OrderDTO> getOrderListByOrderUid(long orderUid) {
		return template.selectList("com.slimbear.mapper.Order.SELECT_ORDER_BY_ORDER_UID");
	}
}

package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.OrderDTO;
import com.kgitbank.slimbear.dto.OrderDetailDTO;

@Repository
public class OrderDetailDAO {
	
	@Autowired
	protected SqlSessionTemplate template;
	
	public List<OrderDetailDTO> getOrderListByMemberUID(long orderUID){
		OrderDTO info = new OrderDTO();
		info.setUid(orderUID);
		return template.selectList("com.slimbear.mapper.Order.SELECT_ORDERDETAIL_LIST_BY_ORDER_UID", info);
	}
	
	public int insertOrder(OrderDetailDTO orderDetail) {
		return template.insert("com.slimbear.mapper.Order.INSERT_ORDER", orderDetail);
	}
}

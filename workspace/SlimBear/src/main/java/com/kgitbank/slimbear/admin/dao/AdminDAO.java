package com.kgitbank.slimbear.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.admin.dto.AdminDTO;
import com.kgitbank.slimbear.admin.dto.OrderListDTO;
import com.kgitbank.slimbear.admin.dto.ProductTotalListDTO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate template;

	public AdminDTO getAdminById(String id) {
		AdminDTO info = new AdminDTO();
		info.setId(id);
		return template.selectOne("com.slimbear.mapper.Admin.SELECT_ADMIN_BY_ID", info);
	}
	
	public List<ProductTotalListDTO> getProductTotalList() {
		return template.selectList("com.slimbear.mapper.Admin.SELECT_PRODUCT_TOTAL_LIST");
	}
	
	public List<OrderListDTO> getOrderList() {
		return template.selectList("com.slimbear.mapper.Admin.SELECT_ORDER_LIST");
	}
	
	public OrderListDTO getOrderDetailByUID(long order_uid) {
		return template.selectOne("com.slimbear.mapper.Admin.SELECT_ORDER_DETAIL_BY_UID", order_uid);
	}
	
	public List<HashMap<Object, Object>> getOrderProductDetilsListByOrderUID(long order_uid){
		return template.selectList("com.slimbear.mapper.Admin.SELECT_ORDER_PRODUCTDETAIL_LIST_BY_ORDER_UID", order_uid);
	}
}

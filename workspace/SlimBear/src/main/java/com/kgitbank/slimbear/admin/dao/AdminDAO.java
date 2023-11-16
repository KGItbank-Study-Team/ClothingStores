package com.kgitbank.slimbear.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.admin.dto.AdminDTO;
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
}

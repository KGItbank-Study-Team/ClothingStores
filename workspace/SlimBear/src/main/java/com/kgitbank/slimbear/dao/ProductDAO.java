package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.ReviewDTO;

@Repository
public class ProductDAO{
	
	@Autowired
	protected SqlSessionTemplate template;
	
	public List<ReviewDTO> getProductList() {
		return template.selectList("com.slimbear.mapper.Member.SELECT_PROD_LIST");
	}

}

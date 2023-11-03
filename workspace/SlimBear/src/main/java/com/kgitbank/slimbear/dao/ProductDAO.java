package com.kgitbank.slimbear.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.BoardDTD;

@Repository
public class ProductDAO extends MybatisDAO{
	
	public List<BoardDTD> getProductList() {
		return template.selectList("com.slimbear.mapper.Member.SELECT_PROD_LIST");
	}

}

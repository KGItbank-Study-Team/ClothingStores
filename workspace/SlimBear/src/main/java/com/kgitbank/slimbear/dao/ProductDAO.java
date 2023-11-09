package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.ProductDTO;

@Repository
public class ProductDAO{
	
	@Autowired
	protected SqlSessionTemplate template;
	
	public List<ProductDTO> getProductList() {
		return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_LIST");
	}

	public List<ProductDTO> getProductByCategory(int category){
		ProductDTO info = new ProductDTO();
		info.setCtg_uid(category);
		return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_BY_CATEGORY", info);
	}
}

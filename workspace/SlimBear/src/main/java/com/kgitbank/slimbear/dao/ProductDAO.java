package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.ProductDTO;

@Repository
public class ProductDAO {

	@Autowired
	protected SqlSessionTemplate template;

	public List<ProductDTO> getProductList() {
		return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_LIST");
	}

	public List<ProductDTO> getProductByCategory(int category) {
		ProductDTO info = new ProductDTO();
		info.setCtg_uid(category);
		return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_BY_CATEGORY", info);
	}

	public ProductDTO getProductByUid(long uid) {
		ProductDTO info = new ProductDTO();
		info.setUid(uid);
		return template.selectOne("com.slimbear.mapper.Product.SELECT_PROD_BY_UID", info);
	}

	public List<ProductDTO> getProductByCategoryOrderByPrice(int category, String order) {
		ProductDTO info = new ProductDTO();
		info.setCtg_uid(category);
		info.setOrder(order);
		return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_BY_CATEGORY_ORDER_BY_PRICE", info);
	}

	public List<ProductDTO> getProductByCategoryOrderByPriceDesc(int category, String order) {
		ProductDTO info = new ProductDTO();
		info.setCtg_uid(category);
		info.setOrder(order);
		return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_BY_CATEGORY_ORDER_BY_PRICE_DESC", info);
	}

}
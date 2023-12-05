package com.kgitbank.slimbear.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.ProductDTO;

@Repository
public class ProductDAO {

	@Autowired
	protected SqlSessionTemplate template;

	public List<ProductDTO> getProductList() {
		return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_LIST");
	}

	public List<ProductDTO> getProductByCategory(Map<String, Object> paramMap) {
		return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_BY_CATEGORY", paramMap);
	}
	
	public List<ProductDTO> getBestProductByCategory(Map<String, Object> paramMap) {
		return template.selectList("com.slimbear.mapper.Product.SELECT_BEST_PROD_BY_CATEGORY", paramMap);
	}

	public ProductDTO getProductByUid(long uid) {
		ProductDTO info = new ProductDTO();
		info.setUid(uid);
		return template.selectOne("com.slimbear.mapper.Product.SELECT_PROD_BY_UID", info);
	}

	public List<ProductDTO> getProductByCategoryOrderByPrice(Map<String, Object> paramMap) {
		   return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_BY_CATEGORY_ORDER_BY_PRICE", paramMap);
	}
	
	public List<ProductDTO> getProductByCategoryOrderByRegDate(Map<String, Object> paramMap) {
		   return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_BY_CATEGORY_ORDER_BY_REG_DATE_DESC", paramMap);
	}
	
	public int selectTotalItems(Long category) {
		ProductDTO info = new ProductDTO();
		info.setCtg_uid(category);
		return template.selectOne("com.slimbear.mapper.Product.SELECT_COUNT_PROD_BY_UID", info);
	}

	public List<ProductDTO> getProductByCategoryOrderByPriceDesc(Map<String, Object> paramMap) {
		return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_BY_CATEGORY_ORDER_BY_PRICE_DESC", paramMap);
	}

	public int insertProduct(ProductDTO product) {
		return template.insert("com.slimbear.mapper.Product.INSERT_PRODUCT", product);
	}
	
	public long insertProductReturnUID(ProductDTO product) {
		template.insert("com.slimbear.mapper.Product.INSERT_PRODUCT", product);
		return product.getUid();
	}
	
	public int updateProduct(ProductDTO product) {
		return template.update("com.slimbear.mapper.Product.UPDATE_PRODUCT", product);
	}
	
	//메인페이지
	public int selectTotalItems() {
		return template.selectOne("com.slimbear.mapper.Product.SELECT_COUNT_PROD");
	}
	public List<ProductDTO> getProductOrderByRegDate(Map<String, Object> paramMap) {
		   return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_ORDER_BY_REG_DATE_DESC", paramMap);
	}
	public List<ProductDTO> getBestProductList(Map<String, Object> paramMap) {
		return template.selectList("com.slimbear.mapper.Product.SELECT_BEST_PROD", paramMap);
	}
	public List<ProductDTO> getNewProductList() {
		return template.selectList("com.slimbear.mapper.Product.SELECT_NEW_PROD");
	}
	public List<ProductDTO> getProductOrderByPrice(Map<String, Object> paramMap) {
		   return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_ORDER_BY_PRICE", paramMap);
	}
	public List<ProductDTO> getProductOrderByPriceDesc(Map<String, Object> paramMap) {
		return template.selectList("com.slimbear.mapper.Product.SELECT_PROD_ORDER_BY_PRICE_DESC", paramMap);
	}
}
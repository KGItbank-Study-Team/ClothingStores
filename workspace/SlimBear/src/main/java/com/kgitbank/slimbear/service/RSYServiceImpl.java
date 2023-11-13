package com.kgitbank.slimbear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.CategoryDAO;
import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.ProductDTO;

@Service
public class RSYServiceImpl {
	@Autowired
	private ProductDAO prodDAO;
	@Autowired
	private CategoryDAO ctgDAO;
	
	public List<ProductDTO> getProductListByCategory(int category, String order) {
		switch(order) {
			case "PRICE_ASC":
				return prodDAO.getProductByCategoryOrderByPrice(category, order);
			case "PRICE_DESC":
				return prodDAO.getProductByCategoryOrderByPriceDesc(category, order);
			default:
				return prodDAO.getProductByCategory(category);
		}
	}
	

	
	public CategoryDTO getCategoryByUid(long category){
		CategoryDTO ctg = ctgDAO.getCategoryByUid(category);
		return ctg;
	}
	
	public List<CategoryDTO> getSubCategoryListByTopCtgUid(long category) {
		List<CategoryDTO> subCtg = ctgDAO.getSubCategoryListByTopCtgUid(category);
		return subCtg;
	}
}

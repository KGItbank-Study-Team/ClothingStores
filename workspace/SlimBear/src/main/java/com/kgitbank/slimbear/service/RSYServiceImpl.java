package com.kgitbank.slimbear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dto.ProductDTO;

@Service
public class RSYServiceImpl {
	@Autowired
	private ProductDAO prodDAO;

	public List<ProductDTO> getProductListByCategory(int category) {
		List<ProductDTO> list = prodDAO.getProductByCategory(category);
		return list;
	}
	
	public List<CategoryDTO>
}

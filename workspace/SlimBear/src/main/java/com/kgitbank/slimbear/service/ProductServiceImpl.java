package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dto.ProductDTO;

@Service
public class ProductServiceImpl {

	@Autowired
	private ProductDAO prodDAO;
	
	public List<ProductDTO> getHotProductList(){
		return prodDAO.getProductList();
	}
	
}

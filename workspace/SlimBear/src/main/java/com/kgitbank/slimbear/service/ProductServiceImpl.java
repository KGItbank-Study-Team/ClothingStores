package com.kgitbank.slimbear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dto.ProductDTO;

@Service
public class ProductServiceImpl {

	@Autowired
	private ProductDAO prodDAO;

	public List<ProductDTO> getProductList(){
		return prodDAO.getProductList();
	}
	
	public List<ProductDTO> getNewProductList(){
		return prodDAO.getNewProductList();
	}
	
	public ProductDTO getProductByUid(long uid) {
		return prodDAO.getProductByUid(uid);
	}

}
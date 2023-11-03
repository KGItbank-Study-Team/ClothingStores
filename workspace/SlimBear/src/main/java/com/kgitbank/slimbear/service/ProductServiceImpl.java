package com.kgitbank.slimbear.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.ProductDAO;

@Service
public class ProductServiceImpl {

	@Autowired
	private ProductDAO prodDAO;
	
	public void login(String id, String password) {
		System.out.println(prodDAO.getProductList());
	}
	
}

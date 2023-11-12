package com.kgitbank.slimbear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.PageConfigDAO;
import com.kgitbank.slimbear.dto.ProductBannerTopDTO;

@Service
public class PageConfigServiceImpl {

	

	@Autowired
	private PageConfigDAO pageConfigDAO;
	
	public List<ProductBannerTopDTO> getProductBannerTop() {
		return pageConfigDAO.getProductBannerTopList();
	}
}

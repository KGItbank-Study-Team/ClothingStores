package com.kgitbank.slimbear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.admin.dto.BannerTopDTO;
import com.kgitbank.slimbear.dao.PageConfigDAO;

@Service
public class PageConfigServiceImpl {

	

	@Autowired
	private PageConfigDAO pageConfigDAO;
	
	public List<BannerTopDTO> getProductBannerTop() {
		return pageConfigDAO.getProductBannerTopList();
	}
	
	public String getBannerText() {
		return pageConfigDAO.getBannerText();
	}
}

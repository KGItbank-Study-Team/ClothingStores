package com.kgitbank.slimbear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.admin.dto.BannerTopDTO;
import com.kgitbank.slimbear.dao.PageConfigDAO;

@Service
public class PageConfigServiceImpl implements PageConfigService {

	

	@Autowired
	private PageConfigDAO pageConfigDAO;
	
	@Override
	public List<BannerTopDTO> getProductBannerTop() {
		return pageConfigDAO.getProductBannerTopList();
	}
	
	@Override
	public String getBannerText() {
		return pageConfigDAO.getBannerText();
	}
}

package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.admin.dto.BannerTopDTO;
import com.kgitbank.slimbear.dto.StoreConfigDTO;

@Repository
public class PageConfigDAO {
	
	@Autowired
	protected SqlSessionTemplate template;

	public List<BannerTopDTO> getProductBannerTopList(){
		return template.selectList("com.slimbear.mapper.Page.SELECT_BANNER_TOP");
	}
	
	public StoreConfigDTO getStoreConfig(){
		return template.selectOne("com.slimbear.mapper.Page.SELECT_STORECONFIG");
	}
	
	public String getBannerText() {
		return template.selectOne("com.slimbear.mapper.Page.SELECT_BANNER_TEXT");
	}
	
}

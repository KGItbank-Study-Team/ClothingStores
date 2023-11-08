package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.page.dto.ProductBannerTopDTO;

@Repository
public class PageConfigDAO {
	
	@Autowired
	protected SqlSessionTemplate template;

	public List<ProductBannerTopDTO> getProductBannerTopList(){
		return template.selectList("com.slimbear.mapper.Page.SELECT_PRODUCTBANNERTOP_LIST");
	}
}

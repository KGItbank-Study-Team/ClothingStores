package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.CategoryDTO;

@Repository
public class CategoryDAO {

	@Autowired
	protected SqlSessionTemplate template;

	public CategoryDTO getCategoryByUid(long category) {
		CategoryDTO info = new CategoryDTO();
		info.setUid(category);
		return template.selectOne("com.slimbear.mapper.Category.SELECT_CTG_BY_UID",info);
	}

	public List<CategoryDTO> getSubCategoryListByTopCtgUid(long category) {
		return template.selectList("com.slimbear.mapper.Category.SELECT_SUBCTG_LIST_BY_TOP_CTG_UID",category);
	}


}

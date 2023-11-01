package com.kgitbank.slimbear.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

// DAO 작성기준 : 일반적으로 테이블과 1:1 로 작성된다

public class MybatisDAO {
	@Autowired
	protected SqlSessionTemplate template;
}

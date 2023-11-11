package com.kgitbank.slimbear.dao;

import java.sql.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberCouponDAO {

	@Autowired
	protected SqlSessionTemplate template;
	
}

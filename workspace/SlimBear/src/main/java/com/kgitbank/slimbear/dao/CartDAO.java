package com.kgitbank.slimbear.dao;

import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CartDAO {
	@Autowired
	protected SqlSessionTemplate template;
}

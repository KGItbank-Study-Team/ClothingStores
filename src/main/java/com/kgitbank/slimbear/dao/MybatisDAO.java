package com.kgitbank.slimbear.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

// DAO �ۼ����� : �Ϲ������� ���̺�� 1:1 �� �ۼ��ȴ�

public class MybatisDAO {
	@Autowired
	protected SqlSessionTemplate template;
}

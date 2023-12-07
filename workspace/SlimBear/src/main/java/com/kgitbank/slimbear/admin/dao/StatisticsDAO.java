package com.kgitbank.slimbear.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.admin.dto.StatisticsCategoryDTO;
import com.kgitbank.slimbear.admin.dto.StatisticsMemberDTO;
import com.kgitbank.slimbear.admin.dto.StatisticsOrderDTO;
import com.kgitbank.slimbear.common.SlimBearEnum;
import com.kgitbank.slimbear.exception.SlimbearExceptionHandler;

@Repository
public class StatisticsDAO {
	
	@Autowired
	private SqlSessionTemplate tempalte;
	
	public List<StatisticsMemberDTO> getMemberStatistics(Integer year, Integer month){
		HashMap<String, Object> info = new HashMap<String, Object>();
		info.put("year", year);
		info.put("month", month);		
		return tempalte.selectList("com.slimbear.mapper.Admin.SELECT_STATISTICS_MEMBER", info);
	}
	
	public List<StatisticsMemberDTO> getMemberStatistics(Integer year, boolean monthOff, boolean group_type){
		HashMap<String, Object> info = new HashMap<String, Object>();
		info.put("year", year);
		if(monthOff)info.put("monthOff", 1);	
		if(group_type)info.put("login_type", 1);	
		return tempalte.selectList("com.slimbear.mapper.Admin.SELECT_STATISTICS_MEMBER", info);
	}
	
	public List<StatisticsOrderDTO> getOrderStatistics(Integer year, Integer month){
		HashMap<String, Object> info = new HashMap<String, Object>();
		info.put("year", year);
		info.put("month", month);		
		return tempalte.selectList("com.slimbear.mapper.Admin.SELECT_STATISTICS_ORDER", info);
	}
	
	public List<StatisticsOrderDTO> getOrderStatistics(Integer year, Integer month, SlimBearEnum.ORDER_STATUS status){
		HashMap<String, Object> info = new HashMap<String, Object>();
		info.put("year", year);
		info.put("month", month);		
		info.put("status", status.toString());		
		return tempalte.selectList("com.slimbear.mapper.Admin.SELECT_STATISTICS_ORDER", info);
	}
	
	public List<StatisticsCategoryDTO> getOrderCategoryStatistics(Integer year, Integer month){
		HashMap<String, Object> info = new HashMap<String, Object>();
		info.put("year", year);
		info.put("month", month);		
		return tempalte.selectList("com.slimbear.mapper.Admin.SELECT_STATISTICS_ORDERCNT_PRODUCT_CATEGORY", info);
	}
}

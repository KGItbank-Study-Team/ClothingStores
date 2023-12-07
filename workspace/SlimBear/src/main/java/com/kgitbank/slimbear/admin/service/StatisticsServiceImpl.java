package com.kgitbank.slimbear.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.admin.dao.StatisticsDAO;
import com.kgitbank.slimbear.admin.dto.StatisticsCategoryDTO;
import com.kgitbank.slimbear.admin.dto.StatisticsMemberDTO;
import com.kgitbank.slimbear.admin.dto.StatisticsOrderDTO;
import com.kgitbank.slimbear.common.SlimBearEnum;

@Service
public class StatisticsServiceImpl {
	@Autowired
	private StatisticsDAO statisticsDAO;
	
	
	// MEMBER
	public int getTotalMemberCount() {
		List<StatisticsMemberDTO> memberStats = statisticsDAO.getMemberStatistics(null, null);
		
		int result = 0;
		for(StatisticsMemberDTO  memberStat : memberStats) {
			result += memberStat.getCnt();
		}
		
		return result;
	}
	
	public int getTotalMemberCount(int year) {
		List<StatisticsMemberDTO> memberStats = statisticsDAO.getMemberStatistics(year, null);
		
		int result = 0;
		for(StatisticsMemberDTO  memberStat : memberStats) {
			result += memberStat.getCnt();
		}
		
		return result;
	}
	
	public int getTotalMemberCount(int year, int month) {
		List<StatisticsMemberDTO> memberStats = statisticsDAO.getMemberStatistics(year, month);
		
		int result = 0;
		for(StatisticsMemberDTO  memberStat : memberStats) {
			result += memberStat.getCnt();
		}
		
		return result;
	}


	// ORDER
	
	public StatisticsOrderDTO getTotalOrder() {
		StatisticsOrderDTO result = new StatisticsOrderDTO();
		
		List<StatisticsOrderDTO> orderStats = statisticsDAO.getOrderStatistics(null, null, SlimBearEnum.ORDER_STATUS.DONE);
		
		result.setCnt(0);
		result.setPay_amount(0L);
		for(StatisticsOrderDTO  orderStat : orderStats) {
			result.setCnt(result.getCnt() + orderStat.getCnt());
			result.setPay_amount(result.getPay_amount() + orderStat.getPay_amount());
		}
		
		return result;
	}
	
	public StatisticsOrderDTO getTotalOrder(int year) {
		StatisticsOrderDTO result = new StatisticsOrderDTO();
		
		List<StatisticsOrderDTO> orderStats = statisticsDAO.getOrderStatistics(year, null, SlimBearEnum.ORDER_STATUS.DONE);
		
		result.setCnt(0);
		result.setPay_amount(0L);
		for(StatisticsOrderDTO  orderStat : orderStats) {
			result.setCnt(result.getCnt() + orderStat.getCnt());
			result.setPay_amount(result.getPay_amount() + orderStat.getPay_amount());
		}
		
		return result;
	}
	
	public StatisticsOrderDTO getTotalOrder(int year, int month) {
		StatisticsOrderDTO result = new StatisticsOrderDTO();
		
		List<StatisticsOrderDTO> orderStats = statisticsDAO.getOrderStatistics(year, month, SlimBearEnum.ORDER_STATUS.DONE);
		
		result.setCnt(0);
		result.setPay_amount(0L);
		for(StatisticsOrderDTO  orderStat : orderStats) {
			result.setCnt(result.getCnt() + orderStat.getCnt());
			result.setPay_amount(result.getPay_amount() + orderStat.getPay_amount());
		}
		
		return result;
	}
	
	public HashMap<Integer, StatisticsMemberDTO> getYearMemberList(int year){
		HashMap<Integer, StatisticsMemberDTO> result = new HashMap<Integer, StatisticsMemberDTO>();
		for(int i=1; i<=12; ++i) {
			StatisticsMemberDTO item = new StatisticsMemberDTO();
			item.setCnt(0);
			result.put(i, item);
		}
		
		List<StatisticsMemberDTO> list = statisticsDAO.getMemberStatistics(year, null);
		
		for(StatisticsMemberDTO listitem : list) {
			result.get(listitem.getMonth()).setCnt(listitem.getCnt());
		}
		
		return result;
	}
	
	public List<StatisticsMemberDTO> getYearMemberListType(int year) {
		return statisticsDAO.getMemberStatistics(year, true, true);
	}
	
	public HashMap<Integer, StatisticsOrderDTO> getYearOrderList(int year) {
		HashMap<Integer, StatisticsOrderDTO> result = new HashMap<Integer, StatisticsOrderDTO>();
		for(int i=1; i<=12; ++i) {
			StatisticsOrderDTO item = new StatisticsOrderDTO();
			item.setCnt(0);
			item.setPay_amount(0L);
			result.put(i, item);
		}
		
		List<StatisticsOrderDTO> list = statisticsDAO.getOrderStatistics(year, null, SlimBearEnum.ORDER_STATUS.DONE);
		
		for(StatisticsOrderDTO listitem : list) {
			result.get(listitem.getMonth()).setCnt(listitem.getCnt());
			result.get(listitem.getMonth()).setPay_amount(listitem.getPay_amount());
		}
		
		return result;
	}
	
	public HashMap<Integer, StatisticsOrderDTO> getYearOrderListType(int year, String status) {
		HashMap<Integer, StatisticsOrderDTO> result = new HashMap<Integer, StatisticsOrderDTO>();
		for(int i=1; i<=12; ++i) {
			StatisticsOrderDTO item = new StatisticsOrderDTO();
			item.setCnt(0);
			item.setPay_amount(0L);
			result.put(i, item);
		}
		
		List<StatisticsOrderDTO> list = null;
		if(status == null) {
			list = statisticsDAO.getOrderStatistics(year, null);
		}else {
			 list = statisticsDAO.getOrderStatistics(year, null, SlimBearEnum.ORDER_STATUS.valueOf(status));
		}
		
		for(StatisticsOrderDTO listitem : list) {
			result.get(listitem.getMonth()).setCnt(listitem.getCnt());
			result.get(listitem.getMonth()).setPay_amount(listitem.getPay_amount());
		}
		
		return result;
	}
	
	public List<StatisticsCategoryDTO> getOrderCategoryStatistics(int year) {
		return statisticsDAO.getOrderCategoryStatistics(year, null);
	}


	
}

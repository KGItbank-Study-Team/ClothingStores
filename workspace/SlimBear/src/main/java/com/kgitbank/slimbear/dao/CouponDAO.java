package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.CouponDTO;

@Repository
public class CouponDAO {
	
	@Autowired
	protected SqlSessionTemplate template;
	
	public List<CouponDTO> getCouponList(){
		return template.selectList("com.slimbear.mapper.Coupon.SELECT_COUPON_LIST");
	}
	
	public CouponDTO getCouponByUID(long uid){
		CouponDTO info = new CouponDTO();
		info.setUid(uid);
		return template.selectOne("com.slimbear.mapper.Coupon.SELECT_COUPON_BY_UID",info);
	}
	
	public int insertCoupon(CouponDTO coupon){
		return template.insert("com.slimbear.mapper.Coupon.INSERT_COUPON",coupon);
	}
	
	public int updateCoupon(CouponDTO coupon){
		return template.update("com.slimbear.mapper.Coupon.UPDATE_COUPON",coupon);
	}
}

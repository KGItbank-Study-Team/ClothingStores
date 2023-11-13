package com.kgitbank.slimbear.common;

import com.kgitbank.slimbear.dto.ProductDetailDTO;

public class SlimBearUtil {

	// 제품코드
	public static String toProductCode(long prodUID, String color, String size) {
		StringBuffer code = new StringBuffer();
		code.append(prodUID).append(":")
		.append(color).append(":")
		.append(size);
		
		return code.toString();
	}
	
	public static ProductDetailDTO toProductDetail(String code) {
		ProductDetailDTO productDetail = new ProductDetailDTO();
		
		String[] strSplit = code.split(":");
		productDetail.setProd_uid(Integer.valueOf(strSplit[0]));
		productDetail.setColor(strSplit[1]);
		productDetail.setSize(strSplit[2]);

		return productDetail;
	}

	// 주소
	public static String toAddress(String number, String address1, String address2) {
		StringBuffer address = new StringBuffer();
		address.append(number).append("|")
		.append(address1).append("|")
		.append(address2);
		
		return address.toString();
	}
	
	public static SlimBearAddress toAddress(String address) {
		String[] strSplit = address.split("|");
		return new SlimBearAddress(strSplit[0],strSplit[1],strSplit[2]);
	}
}

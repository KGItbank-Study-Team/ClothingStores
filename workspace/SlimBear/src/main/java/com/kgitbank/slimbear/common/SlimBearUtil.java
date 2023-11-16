package com.kgitbank.slimbear.common;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class SlimBearUtil {

	// 제품코드
	public static String appendProductCode(long prodUID, String color, String size) {
		StringBuffer code = new StringBuffer();
		code.append(prodUID).append(":").append(color).append(":").append(size);

		return code.toString();
	}

	public static String[] splitProductDetail(String code) {
		return code.split(":");
	}

	// 주소
	public static String appendAddress(String number, String address1, String address2) {
		StringBuffer address = new StringBuffer();
		address.append(number).append("|").append(address1).append("|").append(address2);

		return address.toString();
	}

	public static String[] splitAddress(String address) {
		return address.split("\\|");
	}

	// 전화번호
	public static String appendPhoneNumber(String number1, String number2, String number3) {
		StringBuffer phone = new StringBuffer();
		phone.append(number1).append("-").append(number2).append("-").append(number3);

		return phone.toString();
	}

	public static String[] splitPhoneNumber(String phoneNumber) {
		return phoneNumber.split("-");
	}	

}

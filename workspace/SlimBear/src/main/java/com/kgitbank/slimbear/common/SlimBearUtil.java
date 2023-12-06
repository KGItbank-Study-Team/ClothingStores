package com.kgitbank.slimbear.common;

public class SlimBearUtil {

	// 제품코드
	public static String appendProductCode(long prodUID, String color, String size) {
		StringBuffer code = new StringBuffer();
		code.append(prodUID).append(":").append(color).append(":").append(size);

		return code.toString();
	}

	public static String[] splitProductDetail(String code) {
		String[] returnStr = new String[3];
		String[] splitStr = code.split(":");

		try {
			returnStr[0] = splitStr[0];
		} catch (Exception e) {
			returnStr[0] = "";
		}

		try {
			returnStr[1] = splitStr[1];
		} catch (Exception e) {
			returnStr[1] = "";
		}

		try {
			returnStr[2] = splitStr[2];
		} catch (Exception e) {
			returnStr[2] = "";
		}

		return returnStr;
	}

	// 주소
	public static String appendAddress(String number, String address1, String address2) {
		StringBuffer address = new StringBuffer();
		address.append(number).append("|").append(address1).append("|").append(address2);

		return address.toString();
	}

	public static String[] splitAddress(String address) {
		String[] returnStr = new String[3];
		String[] splitStr = address.split("\\|");

		try {
			returnStr[0] = splitStr[0];
		} catch (Exception e) {
			returnStr[0] = "";
		}

		try {
			returnStr[1] = splitStr[1];
		} catch (Exception e) {
			returnStr[1] = "";
		}

		try {
			returnStr[2] = splitStr[2];
		} catch (Exception e) {
			returnStr[2] = "";
		}

		return returnStr;
	}

	// 전화번호
	public static String appendPhoneNumber(String number1, String number2, String number3) {
		StringBuffer phone = new StringBuffer();
		phone.append(number1).append("-").append(number2).append("-").append(number3);

		return phone.toString();
	}

	public static String[] splitPhoneNumber(String phoneNumber) {
		String[] returnStr = new String[3];
		String[] splitStr = phoneNumber.split("-");

		try {
			returnStr[0] = splitStr[0];
		} catch (Exception e) {
			returnStr[0] = "";
		}

		try {
			returnStr[1] = splitStr[1];
		} catch (Exception e) {
			returnStr[1] = "";
		}

		try {
			returnStr[2] = splitStr[2];
		} catch (Exception e) {
			returnStr[2] = "";
		}

		return returnStr;
	}

}

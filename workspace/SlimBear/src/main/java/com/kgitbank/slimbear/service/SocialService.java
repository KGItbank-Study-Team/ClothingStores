package com.kgitbank.slimbear.service;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

public interface SocialService {

	String sendEmail(String email, String subject, String content) throws MessagingException;

	void sendTemporaryPassword(String phone, String temporaryPassword);

	// 휴대폰 번호로 인증 코드 전송
	void sendVerificationCodeByPhone(String phoneNumber, String verificationCode, HttpSession httpSession);

	// 휴대폰 번호로 인증 코드 확인
	boolean checkVerifyCodeByPhone(String phoneNumber, String enteredCode);

	// 이메일로 인증 코드 전송
	String sendVerificationCodeByEmail(String emailAddress, String verificationCode, String subject, String content,
			HttpSession httpSession);

	// 이메일로 인증 코드 확인
	boolean checkVerifyCodeByEmail(String emailAddress, String enteredCode);

	// 인증코드 발급
	String generateTemporaryVerificationCode();

	String generateTemporaryPassword();

}
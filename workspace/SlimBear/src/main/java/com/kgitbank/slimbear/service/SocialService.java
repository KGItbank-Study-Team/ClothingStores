package com.kgitbank.slimbear.service;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
@PropertySource("classpath:social.properties")
public class SocialService {

	// 이메일 발송
	@Value("${spring.mail.username}")
	private String senderEmail;

	@Value("${spring.mail.password}")
	private String senderPassword;

	public String sendEmail(String email, String subject, String content) throws MessagingException {
		// 이메일 설정
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		// 세션 생성 및 인증
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(senderEmail, senderPassword);
			}
		});

		// 메시지 생성
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(senderEmail));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		message.setSubject(subject);
		message.setText(content);

		// 메일 발송
		Transport.send(message);
		return "Email sent successfully!";
	}

	// 문자 발송
	@Value("${spring.phone.apiKey}")
	private String apiKey;
	
	@Value("${spring.phone.apiSecret}")
	private String apiSecret;	

	public void sendTemporaryPassword(String phone, String temporaryPassword) {
		net.nurigo.sdk.message.model.Message coolsms = new net.nurigo.sdk.message.model.Message();
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecret,
				"https://api.coolsms.co.kr");
		coolsms.setFrom("01088522632"); // 발신번호
		coolsms.setTo(phone); // 수신번호
		coolsms.setText(temporaryPassword); // 문자내용

		try {
			// 메시지 전송
			messageService.send(coolsms);
		} catch (NurigoMessageNotReceivedException exception) {
			// 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
		}
//			SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(coolsms));
//	        System.out.println(response);
//	        System.out.println(response);
		//
//	        return response;

	}

}

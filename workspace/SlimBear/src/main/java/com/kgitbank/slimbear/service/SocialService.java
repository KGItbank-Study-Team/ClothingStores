package com.kgitbank.slimbear.service;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

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

	// 문자 발송
	@Value("${spring.phone.apiKey}")
	private String apiKey;

	@Value("${spring.phone.apiSecret}")
	private String apiSecret;

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

	private static final Map<String, String> verificationCodes = new ConcurrentHashMap<>();
	private static final Map<String, LocalDateTime> expirationTimes = new ConcurrentHashMap<>();
	private static final int VALIDATION_TIME_MINUTES = 60;

	private static final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

	// 휴대폰 번호로 인증 코드 전송
	public void sendVerificationCodeByPhone(String phoneNumber, String verificationCode, HttpSession httpSession) {
		// TODO: 실제로 문자 메시지를 전송하는 로직을 추가해야 합니다.
		net.nurigo.sdk.message.model.Message coolsms = new net.nurigo.sdk.message.model.Message();
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecret,
				"https://api.coolsms.co.kr");
		coolsms.setFrom("01088522632"); // 발신번호
		coolsms.setTo(phoneNumber); // 수신번호
		coolsms.setText(verificationCode); // 문자내용

		try {
			// 메시지 전송
			messageService.send(coolsms);
			// 세션에 이메일 주소와 인증 코드 저장
			httpSession.setAttribute("verificationCode", verificationCode);
			httpSession.setAttribute("emailAddress", phoneNumber);
		} catch (NurigoMessageNotReceivedException exception) {
			// 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
		}
		// 여기에서는 간단히 콘솔에 출력하는 예제를 작성했습니다.
		System.out.println("Sending verification code to " + phoneNumber + ": " + verificationCode);

		// 인증 코드와 유효시간 저장
		verificationCodes.put(phoneNumber, verificationCode);
		expirationTimes.put(phoneNumber, LocalDateTime.now().plus(VALIDATION_TIME_MINUTES, ChronoUnit.MINUTES));

		// 예약된 작업을 사용하여 유효시간이 지난 후에 저장된 데이터를 제거
		scheduler.schedule(() -> {
			verificationCodes.remove(phoneNumber);
			expirationTimes.remove(phoneNumber);
		}, VALIDATION_TIME_MINUTES, TimeUnit.MINUTES);
	}

	// 휴대폰 번호로 인증 코드 확인
	public static boolean checkVerifyCodeByPhone(String phoneNumber, String enteredCode) {
		String storedCode = verificationCodes.get(phoneNumber);
		LocalDateTime expirationTime = expirationTimes.get(phoneNumber);

		return storedCode != null && storedCode.equals(enteredCode) && expirationTime != null
				&& LocalDateTime.now().isBefore(expirationTime);
	}

	// 이메일로 인증 코드 전송
	public String sendVerificationCodeByEmail(String emailAddress, String verificationCode, String subject,
			String content, HttpSession httpSession) {
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

		try {
			// 메시지 생성
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(senderEmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailAddress));
			message.setSubject(subject);
			message.setText(content);

			// 메일 발송
			Transport.send(message);

			// 여기에서는 간단히 콘솔에 출력하는 예제를 작성했습니다.
			System.out.println("Sending verification code to " + emailAddress + ": " + verificationCode);

			// 인증 코드와 유효시간 저장
			verificationCodes.put(emailAddress, verificationCode);
			expirationTimes.put(emailAddress, LocalDateTime.now().plus(VALIDATION_TIME_MINUTES, ChronoUnit.MINUTES));

			// 예약된 작업을 사용하여 유효시간이 지난 후에 저장된 데이터를 제거
			scheduler.schedule(() -> {
				verificationCodes.remove(emailAddress);
				expirationTimes.remove(emailAddress);
			}, VALIDATION_TIME_MINUTES, TimeUnit.MINUTES);

			// 세션에 이메일 주소와 인증 코드 저장
			httpSession.setAttribute("verificationCode", verificationCode);
			httpSession.setAttribute("emailAddress", emailAddress);

			return "Email sent successfully!";
		} catch (MessagingException e) {
			e.printStackTrace();
			return "Email sending failed!";
		}
	}

	// 이메일로 인증 코드 확인
	public static boolean checkVerifyCodeByEmail(String emailAddress, String enteredCode) {
		String storedCode = verificationCodes.get(emailAddress);
		LocalDateTime expirationTime = expirationTimes.get(emailAddress);

		return storedCode != null && storedCode.equals(enteredCode) && expirationTime != null
				&& LocalDateTime.now().isBefore(expirationTime);
	}

	// 인증코드 발급
	public static String generateTemporaryVerificationCode() {
		// 여러분의 요구에 맞게 인증 코드 생성 로직을 커스터마이징할 수 있습니다.
		int length = 6; // 인증 코드의 길이를 필요에 따라 변경하세요.
		String set = "0123456789"; // 필요하다면 더 많은 문자를 추가할 수 있습니다.
		StringBuilder verificationCode = new StringBuilder();

		for (int i = 0; i < length; i++) {
			int rendom = (int) (Math.random() * set.length());
			verificationCode.append(set.charAt(rendom));
		}

		return verificationCode.toString();
	}

	// 임시 비밀번호 발급
	private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	private static final int PASSWORD_LENGTH = 10;

	public String generateTemporaryPassword() {
		StringBuilder password = new StringBuilder();
		Random random = new SecureRandom();

		for (int i = 0; i < PASSWORD_LENGTH; i++) {
			int randomIndex = random.nextInt(CHARACTERS.length());
			password.append(CHARACTERS.charAt(randomIndex));
		}

		return password.toString();
	}

//	// 카카오 로그인
//	 private static final String KAKAO_API_URL = "https://kapi.kakao.com/v2/user/me";
//	    private static final String ACCESS_TOKEN = "0b83e6e79ced6252c01ebae15f43a21c"; // 발급받은 액세스 토큰
//
//	    public String getUserInfo() {
//	        try {
//	            URL url = new URL(KAKAO_API_URL);
//	            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//
//	            connection.setRequestMethod("GET");
//	            connection.setRequestProperty("Authorization", "Bearer " + ACCESS_TOKEN);
//
//	            int responseCode = connection.getResponseCode();
//
//	            if (responseCode == HttpURLConnection.HTTP_OK) {
//	                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//	                String inputLine;
//	                StringBuilder response = new StringBuilder();
//
//	                while ((inputLine = in.readLine()) != null) {
//	                    response.append(inputLine);
//	                }
//	                in.close();
//
//	                return response.toString();
//	            } else {
//	                System.out.println("Error: " + responseCode);
//	            }
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//
//	        return null;
//	    }

}

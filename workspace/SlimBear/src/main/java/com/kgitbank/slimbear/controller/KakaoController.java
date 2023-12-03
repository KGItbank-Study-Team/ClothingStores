package com.kgitbank.slimbear.controller;


import java.math.BigInteger;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.swing.Spring;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.kgitbank.slimbear.common.SlimBearEnum.MEMBER_TYPE;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.service.MemberService;


@Controller
@RequestMapping("/login/kakao")
public class KakaoController {
	
	@Autowired
	private MemberService memberSerivce;
	
	@Value("${kakao.client.id}")
	private String clientId;
	
	@Value("${kakao.client.secret}")
	private String clientSecret;

    @GetMapping("/oauth")
    public String 카카오연동(HttpServletRequest request) {
        // state용 난수 생성
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString(32);

        // redirect
        StringBuffer url = new StringBuffer();
        url.append("https://kauth.kakao.com/oauth/authorize?response_type=code");
        url.append("&client_id=" + clientId);
        url.append("&redirect_uri=" + request.getRequestURL().substring(0, request.getRequestURL().lastIndexOf(request.getRequestURI())) + "/app/login/kakao/callback");
        url.append("&state=" + state);

        return "redirect:" + url;
    }

    @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")
    public String 카카오로그인(@RequestParam(value = "code") String code, @RequestParam(value = "state") String state, Model model, HttpServletRequest request) {

        // 카카오에 요청 보내기
        String redirectUri = request.getRequestURL().substring(0, request.getRequestURL().lastIndexOf(request.getRequestURI())) + "/app/login/kakao/callback";

        RestTemplate restTemplate = new RestTemplate();

        // 요청 파라미터 설정
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", clientId);
        params.add("client_secret", clientSecret);
        params.add("redirect_uri", redirectUri);
        params.add("code", code);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        HttpEntity<MultiValueMap<String, String>> requestBody = new HttpEntity<>(params, headers);

        // 카카오에 토큰 요청
        ResponseEntity<String> response = restTemplate.postForEntity("https://kauth.kakao.com/oauth/token", requestBody, String.class);

        if (response.getStatusCode() == HttpStatus.OK) {
            // 응답에서 토큰 추출
            JSONObject responseObject = new JSONObject(response.getBody());
            String token = responseObject.getString("access_token");

            System.out.println("token : "+token);
            
            MemberDTO kakaoMember = makeKakaoMember(token);
            
            MemberDTO member = memberSerivce.getMemberByEmail(kakaoMember.getEmail());
           
            if(member == null) {
            	// 회원가입처리
            	memberSerivce.join(kakaoMember);
            	
            	model.addAttribute("id", kakaoMember.getId());
            	model.addAttribute("pwd", kakaoMember.getId());
            
            	return "redirect:/app/login";
            }else {
            	if(member.getLogin_type().equals(kakaoMember.getLogin_type())) {
            		// 로그인
            		model.addAttribute("id", kakaoMember.getId());
            		model.addAttribute("pwd", kakaoMember.getId());
     
            		return "redirect:/app/login";
            	}else {
            		// 다른 로그인타입으로 사용중
            		return "redirect:/app/login";
            	}
            	
            }
        } else {
            // 오류 처리
            System.out.println("Token request failed with status code: " + response.getStatusCode());
            
            return "redirect:/app/login";
        }
    }

    public MemberDTO makeKakaoMember(String accessToken) {
        // 사용자 정보 요청하기
        String apiUrl = "https://kapi.kakao.com/v2/user/me";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.set("Authorization", "Bearer " + accessToken);

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, requestEntity, String.class);

        if (responseEntity.getStatusCode() == HttpStatus.OK) {
        
        	 // 응답에서 원하는 정보 추출
            JSONObject responseObject = new JSONObject(responseEntity.getBody());
            String id = responseObject.get("id").toString();
            String kakaoEmail = responseObject.getJSONObject("kakao_account").getString("email");

            // 여기서 userEmail을 사용하면 됩니다.
            System.out.println("KAKAO User Email: " + kakaoEmail);
            
            MemberDTO member = new MemberDTO();
        	member.setId("kao" + id);
        	member.setPassword("kao" + id);
        	member.setEmail(kakaoEmail);
        	member.setName("");
        	member.setAddress("||");
        	member.setPhone("000-0000-0000");
        	member.setLogin_type(MEMBER_TYPE.KAKAO.toString());
        	
        	return member;
        } else {
            // 오류 처리
            System.out.println("User info request failed with status code: " + responseEntity.getStatusCode());
        }
        return null;
    }
}

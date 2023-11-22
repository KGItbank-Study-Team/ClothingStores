package com.kgitbank.slimbear.controller;

import java.math.BigInteger;
import java.security.SecureRandom;

import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/login/naver")
public class NaverController {

	@GetMapping("/oauth")
	public String naverConnect() {
		// state용 난수 생성
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);

		// redirect
		StringBuffer url = new StringBuffer();
		url.append("https://nid.naver.com" + "/oauth2.0/authorize?response_type=code");
		url.append("&client_id=" + "CmBjci1LKbhWOqc5OBNQ");
		//url.append("&response_type=code");
		url.append("&redirect_uri=http://localhost:8080/app/login/naver/callback");
		url.append("&state=" + state);

		return "redirect:" + url;
	}

	
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")
	public String naverLogin(@RequestParam(value = "code") String code, @RequestParam(value = "state") String state) {

	    // 네이버에 요청 보내기
	    String clientId = "CmBjci1LKbhWOqc5OBNQ";
	    String clientSecret = "yUdE63eteV";
	    String redirectUri = "http://localhost:8080/app/login/naver/callback";

	    RestTemplate restTemplate = new RestTemplate();

	    // 요청 파라미터 설정
	    MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
	    params.add("client_id", clientId);
	    params.add("client_secret", clientSecret);
	    params.add("grant_type", "authorization_code");
	    params.add("state", state);
	    params.add("code", code);

	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

	    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);

	    // 네이버에 토큰 요청
	    ResponseEntity<String> response = restTemplate.postForEntity("https://nid.naver.com/oauth2.0/token", request, String.class);

	    if (response.getStatusCode() == HttpStatus.OK) {
	        // 응답에서 토큰 추출
	        JSONObject responseObject = new JSONObject(response.getBody());
	        String token = responseObject.getString("access_token");

	        System.out.println(token);
	        getUserInfo(token);
	    } else {
	        // 오류 처리
	        System.out.println("Token request failed with status code: " + response.getStatusCode());
	    }

	    return "redirect:/";
	}

	
	public void getUserInfo(String accessToken) {
	    // 사용자 정보 요청하기
	    String apiUrl = "https://openapi.naver.com/v1/nid/me";

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
	        JSONObject response = responseObject.getJSONObject("response");
	        String name = response.getString("name");

	        System.out.println("User Name: " + name);
	    } else {
	        // 오류 처리
	        System.out.println("User info request failed with status code: " + responseEntity.getStatusCode());
	    }
	}
}
package com.kgitbank.slimbear.controller;

import java.math.BigInteger;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;

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
@RequestMapping("/login/naver")
public class NaverController {
	
	@Autowired
	private MemberService memberSerivce;
	
	@Value("${naver.client.id}")
	private String clientId;
	
	@Value("${naver.client.secret}")
	private String clientSecret;

	@GetMapping("/oauth")
	public String naverConnect(HttpServletRequest request) {
		// state용 난수 생성
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);

		// redirect
		StringBuffer url = new StringBuffer();
		url.append("https://nid.naver.com" + "/oauth2.0/authorize?response_type=code");
		url.append("&client_id=" + clientId);
		//url.append("&response_type=code");
		url.append("&redirect_uri=" + request.getRequestURL().substring(0, request.getRequestURL().lastIndexOf(request.getRequestURI())) + "/app/login/naver/callback");
		url.append("&state=" + state);

		return "redirect:" + url;
	}

	
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json")
	public String naverLogin(@RequestParam(value = "code") String code, @RequestParam(value = "state") String state, Model model) {

	    // 네이버에 요청 보내기
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

	        System.out.println("token : "+token);
	     
	        MemberDTO naverMember = makeNaverMember(token);
            
            MemberDTO member = memberSerivce.getMemberByEmail(naverMember.getEmail());
            
            if(member == null) {
            	// 회원가입처리
            	memberSerivce.join(naverMember);
            	
        		model.addAttribute("id", naverMember.getId());
        		model.addAttribute("pwd", naverMember.getId());
        		return "redirect:/app/login";
            }else {
            	if(member.getLogin_type().equals(naverMember.getLogin_type())) {
            		// 로그인
            		model.addAttribute("id", naverMember.getId());
            		model.addAttribute("pwd", naverMember.getId());
            		return "redirect:/app/login";
            	}else {
            		// 다른 로그인타입으로 사용중
            		return "redirect:/app/login";
            	}
            	
            }
	    } else {
	        // 오류 처리
	        System.out.println("Token request failed with status code: " + response.getStatusCode());
	    }

	    return "redirect:/app/login";
	}

	
	public MemberDTO makeNaverMember(String accessToken) {
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
	        String naverEmail = response.getString("email");

	  
	        System.out.println("NAVERUser Name: " + name);
	        System.out.println("NAVERUser Email: " + naverEmail);
	        
	        MemberDTO member = new MemberDTO();
        	member.setId("nav_" + naverEmail.split("@")[0]);
        	member.setPassword("nav_" + naverEmail.split("@")[0]);
        	member.setEmail(naverEmail);
        	member.setName(name);
        	member.setAddress("||");
        	member.setPhone("000-0000-0000");
        	member.setLogin_type(MEMBER_TYPE.NAVER.toString());
        	
        	return member;
	    } else {
	        // 오류 처리
	        System.out.println("User info request failed with status code: " + responseEntity.getStatusCode());
	    }
	    return null;
	}
}
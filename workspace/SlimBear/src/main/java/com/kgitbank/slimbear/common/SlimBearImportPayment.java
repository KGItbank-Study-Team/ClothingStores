package com.kgitbank.slimbear.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;
import java.util.stream.Collectors;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kgitbank.slimbear.exception.SlimBearException;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

public class SlimBearImportPayment {

	private IamportClient iamportClient;
	
	private String apiKey;
	private String apiSecret;

	
	public SlimBearImportPayment(String apiKey, String apiSecret) {
		this.apiKey = apiKey;
		this.apiSecret = apiSecret;
		iamportClient = new IamportClient(apiKey, apiSecret);
	}

	public IamportResponse<Payment> getPaymentRecord(String merchantUid) throws IamportResponseException, IOException{
		  return iamportClient.paymentByImpUid(merchantUid);
	}
	
	// merchant_uid : 주문번호
	// reason : 사유
	public void refundRequest(String merchant_uid, String reason) throws IOException, SlimBearException {
      
		 RestTemplate restTemplate = new RestTemplate();
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("merchant_uid", merchant_uid);
        params.add("reason", reason);
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/json");
        headers.add("Accept", "application/json");
        headers.add("Authorization", getToken());

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
 
        // 출력 스트림으로 해당 conn에 요청
        ResponseEntity<String> response = restTemplate.postForEntity("https://api.iamport.kr/payments/cancel", request, String.class);

        if (response.getStatusCode() == HttpStatus.OK) {
        	System.out.println(response.getBody());
        	JSONObject responseObject = new JSONObject(response.getBody());
            Integer resultCode = responseObject.getInt("code");
            
            System.out.println("결과 코드 = " + resultCode);
      
            System.out.println("결제 취소 완료 : 주문 번호 -" + merchant_uid);
            
        }
        else {
            // 오류 처리
            System.out.println("Token request failed with status code: " + response.getStatusCode());
        	throw new SlimBearException("결제 취소 실패");
        }
   }
 
    private String getToken() throws IOException {
        URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
 
        // 요청 방식을 POST로 설정
        conn.setRequestMethod("POST");
 
        // 요청의 Content-Type과 Accept 헤더 설정
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
 
        // 해당 연결을 출력 스트림(요청)으로 사용
        conn.setDoOutput(true);
 
        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
        JsonObject json = new JsonObject();
        json.addProperty("imp_key", apiKey);
        json.addProperty("imp_secret", apiSecret);
 
        // 출력 스트림으로 해당 conn에 요청
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString()); // json 객체를 문자열 형태로 HTTP 요청 본문에 추가
        bw.flush(); // BufferedWriter 비우기
        bw.close(); // BufferedWriter 종료
 
        // 입력 스트림으로 conn 요청에 대한 응답 반환
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        Gson gson = new Gson(); // 응답 데이터를 자바 객체로 변환
        String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
        String accessToken = gson.fromJson(response, Map.class).get("access_token").toString();
        br.close(); // BufferedReader 종료
 
        conn.disconnect(); // 연결 종료
 
        System.out.println("Iamport 엑세스 토큰 발급 성공 : " +  accessToken);
        return accessToken;
    }
}

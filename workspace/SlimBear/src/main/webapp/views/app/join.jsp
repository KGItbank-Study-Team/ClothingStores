<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>슬림 베어 회원가입</title>
     <link href="/resources/css/join.css" rel="stylesheet" />
     <script defer src="/resources/js/join.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
     <%@ include file="header/header.jsp" %>
</head>

<body>
    
    <div class="member">
        <!-- 1. 로고 -->
        <img class="logo" src="/resources/images/SlimBear-Logo01.png">
		<form action="/app/member/join" method="post">
		<input id="realdata_address" type="hidden" name="address">
		<input id="realdata_birthdate" type="hidden" name="ntday">
		<input type="hidden" name="sex" value="M">
		<input type="hidden" id="realdata_phone" name="phone">
        <!-- 2. 필드 -->
        <div class="field">
            <b>아이디</b>
            <span class=""><input class="idd" type="text" name="id" required ></span>
        <span id="id_check" style="color: red;"></span>
        </div>
        <div class="field">
            <b>비밀번호</b>
            <input class="userpw" type="password"name="password" >
        </div>
        <div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw-confirm" type="password"name="pwck" >
        	<span id="password-match-message" style="color: red;"></span>
        </div>
        <div class="field">
            <b>이름</b>
            <input class="namee" type="text"name="name" >
        </div>

        <!-- 3. 필드(생년월일) -->
        <!-- <div class="field birth" >
            <b>생년월일</b>
            <div>
                <input type="number" placeholder="년(4자)" value="4" name="year" >                
                <input type="number" placeholder="월">                
                <select name="month">
                    <option value="" selected>월</option>
                    <option value="">1월</option>
                    <option value="">2월</option>
                    <option value="">3월</option>
                    <option value="">4월</option>
                    <option value="">5월</option>
                    <option value="">6월</option>
                    <option value="">7월</option>
                    <option value="">8월</option>
                    <option value="">9월</option>
                    <option value="">10월</option>
                    <option value="">11월</option>
                    <option value="">12월</option>
                </select>
                <input type="number" placeholder="일" value="22" name="day">
                
            </div>
        </div> -->

      <div class="field">
            <b>이메일<small></small></b>
            <input type="email" placeholder="" value="" name="email">
        </div>
        
        <div class="field tel-number">
            <b>휴대전화</b>
            <select>
                <option value="">대한민국 +82</option>
            </select>
            <div>
                <input type="tel" placeholder="전화번호 입력"value="010" name="telphone" id="tel1"><p>-</p>
                <input type="tel" placeholder="" name="telphone" id="tel2"><p>-</p>
                <input type="tel" placeholder="" name="telphone" id="tel3">
                </div>

                <div>
                <input type="button" value="인증번호 받기">
            </div>
            <input type="number" placeholder="인증번호를 입력하세요" value="" name="phoneck">
        </div>
       <div class="field tel-number">
        <b>주소</b>
        <div>
            <input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode">
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" >
        </div>
        <input type="text" placeholder="기본 주소" id="sample6_address" name="pubilcaddress" >
        <input type="text" placeholder ="상세 주소" id="sample6_detailAddress" name="detailaddress" >
        <input type="hidden" id="sample6_extraAddress" placeholder="참고항목"> 
    </div>
        <!-- 6. 가입하기 버튼 -->
        <input type="button" onclick="sendDataToDatabase()" value="가입하기">
</form>
        <!-- 7. 푸터 -->
        <div class="member-footer">
            <div>
                <a href="#none">이용약관</a>
                <a href="#none">개인정보처리방침</a>
                <a href="#none">책임의 한계와 법적고지</a>
                <a href="#none">회원정보 고객센터</a>
            </div>
            
        </div>
    </div>

</body>
<%@ include file="footer/footer.jsp" %>
</html>
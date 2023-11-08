<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   request.setAttribute("name", "");
   request.setAttribute("pw", "");
   request.setAttribute("pwck", "****");
   request.setAttribute("id", "");
   request.setAttribute("btday", "");
   request.setAttribute("email", "");
   request.setAttribute("telphone", "");
   request.setAttribute("manck", "");
   request.setAttribute("", "");
    %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>슬림 베어 회원가입</title>
     <link href="/resources/css/join.css" rel="stylesheet" />
     <script defer src="/resources/js/join.js"></script>
    
     <%@ include file="header/header.jsp" %>
</head>

<body>
    
    <div class="member">
        <!-- 1. 로고 -->
        <img class="logo" src="/resources/images/SlimBear-Logo01.png">
		<form action="ordercheck.jsp" method="get">
        <!-- 2. 필드 -->
        <div class="field">
            <b>아이디</b>
            <span class="placehold-text"><input class="idd" type="text" value="${id }"></span>
        </div>
        <div class="field">
            <b>비밀번호</b>
            <input class="userpw" type="password"value="${pw }">
        </div>
        <div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw-confirm" type="password"value="${pwck }">
        </div>
        <div class="field">
            <b>이름</b>
            <input class="namee" type="text"value="name">
        </div>

        <!-- 3. 필드(생년월일) -->
        <div class="field birth" >
            <b>생년월일</b>
            <div>
                <input type="number" placeholder="년(4자)" value="${btday }">                
                <input type="number" placeholder="월">                
                <select>
                    <option value="">월</option>
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
                <input type="number" placeholder="일">
            </div>
        </div>

        <!-- 4. 필드(성별) 
        <div class="field gender">
            <b>성별</b>
            <div>
                <label><input type="radio" name="gender">남자</label>
                <label><input type="radio" name="gender">여자</label>
                <label><input type="radio" name="gender" checked>선택안함</label>
            </div>
        </div>
-->
        <!-- 5. 이메일_전화번호 -->
        <div class="field">
            <b>본인 확인 이메일<small>(선택)</small></b>
            <input type="email" placeholder="선택입력" value="${email }">
        </div>
        
        <div class="field tel-number">
            <b>휴대전화</b>
            <select>
                <option value="">대한민국 +82</option>
            </select>
            <div>
                <input type="tel" placeholder="전화번호 입력"value="${telphone }">
                <input type="button" value="인증번호 받기">
            </div>
            <input type="number" placeholder="인증번호를 입력하세요" value="${manck }">
        </div>
        
        <!-- 6. 가입하기 버튼 -->
        <input type="submit" value="가입하기">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="../../header/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>
    <link rel="icon" href="./images/images2/favicon.png">
    <link rel="stylesheet" href="orderr.css">
    <script src="order.js"></script>
</head>

<body>
    
    <div class="member">
        <!-- 1. 로고 -->
        <img class="logo" src="../images/SlimBear-Logo01.png">
        <div class="btn" onclick="toggleHiddenContent();">주문자 정보 ▽</div>
        <div id="hiddenContent03" class="delivery" style="display: none;">
        <!-- 2. 필드 -->
        <div class="field">
            <b>주문자*</b>
            <span class="placehold-text"><input class="iddd" type="text"></span>
        </div>
        <div class="field">
            <b>이메일*</b>
            <input class="userpw" type="password">
        </div>
        <div class="field birth">
            <b>휴대전화</b>
            <div>
                
                <input type="number" placeholder="010">                
                <input type="number" placeholder="1234">                
                
                <input type="number" placeholder="5678">
            </div>
        </div>
        <!--<div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw-confirm" type="password">
        </div>
    -->
       <!-- <div class="field">
            <b>이름</b>
            <input type="text">
        </div>-->

        <!-- 3. 필드(생년월일) -->
        <!--<div class="field birth">
            <b>생년월일</b>
            <div>
                <input type="number" placeholder="년(4자)">                
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
    -->
        <!-- 4. 필드(성별) -->
        <!--<div class="field gender">
            <b>성별</b>
            <div>
                <label><input type="radio" name="gender">남자</label>
                <label><input type="radio" name="gender">여자</label>
                <label><input type="radio" name="gender">선택안함</label>
            </div>
        </div>
    -->
        <!-- 5. 이메일_전화번호 -->
        <div class="field">
            <b>비상 연락망<small>(선택)</small></b>
            <input type="email" placeholder="선택입력">
        </div>
        
        <div class="field tel-number">
            <b>우편번호</b>
            <!--<select>
                <option value="">대한민국 +82</option>
            </select> -->
            <div>
                <input type="tel" placeholder="01188">
                <input type="button" value="주소 찾기">
            </div>
            <input type="number" placeholder="상세 주소">
        </div>
        </div>
        <!-- 주문자 정보 끝-->
        <!-- 6. 가입하기 버튼 -->
        <h3>배송지</h3>
        <div class="radioo">
            <p>
                <label> <input type="radio" name="payment1" value="type4" checked > 주문자 정보와 동일
                </label> 
                <label> <input type="radio" name="payment1" value="type5">새로운 배송지
                   
                </label>
            </p>
        </div>
     
   
    <div class="field">
        <b>받는사람*</b>
        <span class="placehold-textt"><input type="text"></span>
    </div>
    <div class="field tel-number">
        <b>주소</b>
        <!--<select>
            <option value="">대한민국 +82</option>
        </select> -->
        <div>
            <input type="tel" placeholder="01188">
            <input type="button" value="주소 찾기">
        </div>
        <input type="number" placeholder="상세 주소">
    </div>
    <!--휴대전화-->
    <div class="field birth">
        <b>휴대전화</b>
        <div>
             <input type="text" placeholder="010">
            <input type="text" placeholder="1234">                
            
            <input type="text" placeholder="5678">
        </div>
    </div>

    <div class="field tel-number">
        <b>휴대전화</b>
       
        <select>
            <option value="">대한민국 +82</option>
        </select>
         <div>
            <input type="tel" placeholder="전화번호 입력">
            <input type="button" value="인증번호 받기">
        </div>
        <input type="number" placeholder="인증번호를 입력하세요">
    </div>


<!-- 적립금 사용-->
<article class="discount">
    <h3>할인정보</h3>
    <div>
        <p>
            현재 포인트 : <span>7200</span>점
        </p>

        <label> <input class="pointt" type="text" name="point" placeholder="00,000점"> <input
            type="button" value="적용">
        </label> <span>포인트 5,000점 이상이면 현금처럼 사용 가능합니다.</span>
    </div>
</article>
<!-- 결제 방법 선택-->
<article class="payment">
    <h3>결제방법</h3>
    <div>
        <span>신용카드</span>
        <p>
            <label> <input type="radio" name="payment" value="type1">신용카드
                결제
            </label> <label> <input type="radio" name="payment" value="type2">체크카드
                결제
            </label>
        </p>
    </div>
    <div>
        <span>계좌이체</span>
        <p>
            <label> <input type="radio" name="payment" value="type3" checked>실시간
                계좌이체
            </label> <label> <input type="radio" name="payment" value="type4">무통장
                입금
            </label>
        </p>
    </div>
    
    
</article>


<article class="alert">
    <ul>
        <li><span>슬림베어의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에
                대하여 슬림베어 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다. </span></li>
        <li><span>슬림베어 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는
                02-006-00008 입니다. </span></li>
        <li><span>등록여부는 금융감독원 홈페이지(www.fss.or.kr)의
                업무자료>인허가업무안내>전자금융업등록현황에서 확인하실수 있습니다. </span></li>
    </ul>
</article>
<input type="submit" value="주문하기">
</div>
</body>
  <%@ include file="../../footer/footer.jsp" %>
</html>
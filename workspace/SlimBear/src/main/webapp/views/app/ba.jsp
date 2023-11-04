<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header/header.jsp" %>
    <% 
    request.setAttribute("productName", "입는 순간 해커가 되는 검정후드티");
    request.setAttribute("price1", "120000"); // 가격을 문자열로 설정
    request.setAttribute("price2", "1120000"); // 다른 가격도 문자열로 설정
    request.setAttribute("productDescription", "507호 공식 해커");
    request.setAttribute("productDescription2", "입는 순간 해커가 되는 검정후드티");
    request.setAttribute("discountPrice", "132622");
    request.setAttribute("","");
    request.setAttribute("","");
    request.setAttribute("","");
    request.setAttribute("","");
    request.setAttribute("","");
    request.setAttribute("","");
    request.setAttribute("","");
   
     %>
  
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/baguni.css" rel="stylesheet" />
<script src="../../resources/js/baguni.js"></script>

<title>장 바 구 니</title>
</head>
<body>

	<section class="cart">
		<div class="cart__information">
			<ul>
				<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
				<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기
					바랍니다.</li>
			</ul>
		</div>
		<table class="cart__list">
			<form>
				<h1>C A R T</h1>
			<thead>
				<tr>
					<td><input type="checkbox"></td>
					<td colspan="2">상품정보</td>
					<td>옵션</td>
					<td>수량</td>
					<td>적립금</td>
					<td>상품금액</td>
					<td>배송비</td>

				</tr>
			</thead>
			<%for(int i=0; i<10; i++){ %>
			<tbody>
				<tr class="cart__list__detail">
					<td><input type="checkbox"></td>
					<td><img src="../images/유해커.jpg" alt="magic keyboard"></td>
					<td><a href="#">507호 공식 해커</a><span
						class="cart__list__smartstore"> 스마트스토어</span>
						<p>입는 순간 해커가 되는 검정후드티</p> <sapn class="price">116,622원</sapn><span
						style="text-decoration: line-through; color: lightgray;">119,000</span>
					</td>
					<td class="cart__list__option">
						<p>유해커의 검정후드티 / 1개</p>
						<div class="btn" onclick="toggleHiddenContent();">주문 추가/변경▽</div>
        <div id="hiddenContent03" class="delivery hiddenContent" >
		    <div class="option hidden"></div>
		    <table class="change hidden">
		       <tbody class="cchange">
		            <tr class="nammme">
		            
		                <td colspan="3" >${productName}</td>
		            </tr>
		            <tr class="">
		                <td class="pcolor" >
		                    <p class="colooo">COLOR</p>
		                </td>
		                <td colspan="2" class="colorrr">
		                    <select class="colorr">
		                        <option value="">red</option>
	                        <option value="">blue</option>
		                        <option value="">pink</option>
		                    </select>
		                </td>
		            </tr>
		            <tr class="">
		                <td class="" >
		                    <p>SIZE</p>
		                </td>
		                <td colspan="2"class="colorrr">
		                    <select class="colorr" >
		                        <option value="">XL</option>
		                        <option value="">2XL</option>
		                        <option value="">3XL</option>
		                    </select>
		                </td>
		            </tr>
		            <tr><td colspan="3">
		           <div class="cart__mainbtns">
			<button class="cart__bigorderbtn left"
				onclick="window.location.href='https://www.slowand.com/'">쇼핑
				계속하기</button>
			<button class="cart__bigorderbtn right">주문하기</button>

		</div>
						</td></tr>
		        </tbody>
		        <div>
		    
		       </div>
		    </table>
		</div>
					
				 </td>
				 <td>
				 <span class="ec-base-qty">
				
				 
				 <input id="quantity_id_1_<%= i %>" name="quantity_name_1_<%= i %>" size="1" value="1" type="text" oninput="updatePrice(<%= i %>);">
				
				 <span class="ec-base-qty">
    <a href="javascript:;" class="up" onclick="addQuantity('quantity_id_1_<%= i %>', 1);">
        <img src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif" alt="수량증가" />
    </a>
 
    <a href="javascript:;" class="down" onclick="outQuantity('quantity_id_1_<%= i %>', 1);">
        <img src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif" alt="수량감소" />
    </a>
   
</span>

				 
				 </span>
							 </td>
					<td><p>₩1000</p></td>
					<td><span class="price" id="price_<%= i %>">${discountPrice}</span>
</td>
					<td>무료</td>
				</tr>
				<%
				}
				%>
				
			<tfoot>
				<tr>
					<td colspan="3"><input type="checkbox">
						<button class="cart__list__optionbtn">선택상품 삭제</button>
						<button class="cart__list__optionbtn">선택상품 찜</button></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tfoot> 

			</form>
		</table>
		<table class="cart__list__detail">
<thead>
			<tr>
				<td></td>
				<td colspan="2">총 상품금액</td>
				<td></td>
				<td>총 배송비</td>
				<td>결제예정금액</td>
			</tr>
			</thead>
			<tr>
				<td></td>
				<td colspan="2">00,000원</td>
				<td></td>
				<td>+ 2,500원</td>
				<td>= 30,300원</td>
			</tr>
			
		</table>
		<div class="cart__mainbtns">
			<button class="cart__bigorderbtn left"
				onclick="window.location.href='https://www.slowand.com/'">쇼핑
				계속하기</button>
			<button class="cart__bigorderbtn right">주문하기</button>

		</div>
		<div>
			<h4>이용안내</h4>
			<div class="cart__list__optionb">
				<h4>장바구니 이용안내</h4>
				<ol>
					<li >선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면
						됩니다.</li>
					<li >[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
				</ol>
				<h4>무이자할부 이용안내</h4>
				<ol>
					<li >상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문] 버튼을
						눌러 주문/결제 하시면 됩니다.</li>
					<li >[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한
						주문/결제가 이루어집니다.</li>
					<li >단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수
						없습니다.</li>
					<li >무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부
						상품 기준으로 배송비가 표시됩니다.<br />실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비
						정보를 참고해주시기 바랍니다.
					</li>
				</ol>
			</div>
		</div>
	</section>
</body>
    <%@ include file="footer/footer.jsp" %>
</html>

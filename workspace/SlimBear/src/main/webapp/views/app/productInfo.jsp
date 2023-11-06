<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
	request.setAttribute("productInfo", "#SLIMEBEAR.WARM PLUS LIGHT V NECK JACKET 블랙");
	request.setAttribute("subExplanation", "made by slimebear, 성숙한 감성의 더플코트 :)<br/>핸드메이드 봉제로 더 고급스럽게,<br/>"
			+ "퀄리티 있는 부자재로 더 완성도 높게 :)<br/>하나하나 매력있는 세 컬러로 만나보세요!");
	request.setAttribute("color1", "화이트");
	request.setAttribute("color2", "크림");
	request.setAttribute("color3", "브라운");
	request.setAttribute("color4", "챠콜");
	request.setAttribute("color5", "블랙");
	request.setAttribute("productInfo1", "없음");
	request.setAttribute("productInfo2", "보통");
	request.setAttribute("productInfo3", "있음");
	request.setAttribute("productInfo4", "없음");
	request.setAttribute("productInfo5", "오버핏");
	request.setAttribute("customMemo1", "⦁ 여유로운 오버핏 사이즈<br/>⦁ 전면 양쪽 포켓 디테일	<br/>⦁ 전면 양쪽 포켓 디테일<br/>⦁ 베이직한 스냅 디자인<br/>" +	
							"⦁ 충전재 덕다운 80:20<br/>⦁ 나일론 원단<br/>");
	request.setAttribute("size1", "2XL");
	request.setAttribute("size2", "3XL");
	request.setAttribute("size3", "4XL");
	request.setAttribute("size4", "5XL");
	request.setAttribute("price1", "198,000원");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/productInfo.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/productInfo.js"></script>
<title>상품상세정보</title>
</head>
<body>
	<%@ include file="header/header2.jsp"%>
	<div id="container">
		<div class="productInfo">
			<div class="left">
				<div class="productImg">
					<img alt="상품01" src="/resources/images/Best_product08.webp">
				</div>
				<div></div>
			</div>
			<div class="right">
				<div class="explanation">
					<h2 style="padding-bottom: 15px;">${productInfo}</h2>
					<div class="subExplanation">${subExplanation}</div>
				</div>
				<div>
					<table>
						<tbody>
							<tr>
								<th scope="row" class="solid2">
									<span style="font-size: 12px; color: #555555;">CUSTOM</span>
								</th>
								<td class="solid"><span style="font-size: 12px; color: #555555;">
										<span><del>239,000원</del></span>
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row" class="solid2">
								 <span style="font-size: 12px; color: #555555;">PRICE</span>
								</th>
								<td class="solid">
									<span style="font-size: 12px; color: #555555;">
										<strong>198,000원</strong>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<table style="margin-top: 40px;">
						<tbody>
							<tr>
								<th scope="row" class="solid3">
									<span style="font-size: 12px; color: #555555;">COLOR</span>
								</th>
								<td>
									<ul class="colorOptionPosition">
										<li class="color" onclick="change_btn(event)"><a href="#none" class="colorButton"><span class="colorOption">${color1}</span></a></li>
										<li class="color" onclick="change_btn(event)"><a href="#none" class="colorButton"><span class="colorOption">${color2}</span></a></li>
										<li class="color" onclick="change_btn(event)"><a href="#none" class="colorButton"><span class="colorOption">${color3}</span></a></li>
										<li class="color" onclick="change_btn(event)"><a href="#none" class="colorButton"><span class="colorOption">${color4}</span></a></li>
										<li class="color" onclick="change_btn(event)"><a href="#none" class="colorButton"><span class="colorOption">${color5}</span></a></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>	
				</div>
				<div>
					<table style="margin-top: 40px;">
						<tbody>
							<tr>	
								<th scope="row" class="solid3">
									<span style="font-size: 12px; color: #555555;">SIZE</span>
								</th>
								<td>
									<ul class="sizeOptionPosition">
										<li class="color" onclick="change_btn2(event)"><a href="#none" class="color-button"><span class="colorOption">${size1}</span></a></li>
										<li class="color" onclick="change_btn2(event)"><a href="#none" class="color-button"><span class="colorOption">${size2}</span></a></li>
										<li class="color" onclick="change_btn2(event)"><a href="#none" class="color-button"><span class="colorOption">${size3}</span></a></li>
										<li class="color" onclick="change_btn2(event)"><a href="#none" class="color-button"><span class="colorOption">${size4}</span></a></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>				
				</div>
				<div style="margin-top: 30px;">
					<table>
						<colgroup>
							<col>
							<col>
							<col>
							<col>
						</colgroup>
						<tbody class="displayNone">
							<tr>
								<td style="font-size: 12px; color: #555555; font-weight:bold;">${color1}</td>
								<td style="font-size: 12px; color: #555555; font-weight:bold;">${size1}</td>
								<td>
									<span class="quantity"">
										<input type="text" value="1" class="inputBox">
										<a href="#none" class="">
											<img alt="수량증가" class="countUp" src="/resources/images/btn_count_up.gif">
										</a>
										<a href="#none">
											<img alt="수량감소" class="countDown" src="/resources/images/btn_count_down.gif">
										</a>
									</span>
									<a href="#none">
										<img alt="삭제" src="/resources/images/icon_delete.png"style="width:9px;height:9px;">
									</a>
								</td>
								<td>
									<div class="tdCell">${price1}</div> 
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btns">
					<div clss="btn1">
						<a href="#none" class="btnOption" style="margin-right: 12.5px !important;background:rgb(101,83,69);">
							<span class="btnSpan" style="color:white !important;">BUY IT NOW</span>
						</a>
						<a href="#none" class="btnOption" style="background:#eae5dd;"><span class="btnSpan">ADD TO CART</span></a>
						<a href="#none" class="btnOption" style="background:#eae5dd;"><span class="btnSpan">ADD TO WISH</span></a>
					</div>
				</div>
				<!-- 사이즈 가이드 -->
			    <div class="guideBox"><br/><hr/>
					<div class=shoppingInfo>
						<p class="name">배송정보</p>
						<ul class="ulClass">
							<li>
								<p>배송방법</p>
								<strong>국내배송</strong>
							</li>
							<li>
								<p>배송예정일</p>
								<p><strong>3일 이내 출고</strong></p>
							</li>
							<li>
								<p>택배사</p>
								<p><strong>한진택배</strong></p>
							</li>
						</ul>
					</div>
					<hr/>
					<div class="productGuide">
						<p class="name1">제품 가이드</p>
						<ul class="ulClass">
							<li>
								<p>신축성</p>
								<p><strong>${productInfo1}</strong></p>
							</li>
							<li>
								<p>두께감</p>
								<p><strong>${productInfo2}</strong></p>
							</li>
							<li>
								<p>안감</p>
								<p><strong>${productInfo3}</strong></p>
							</li>
							<li>
								<p>비침</p>
								<p><strong>${productInfo4}</strong></p>
							</li>
							<li style="margin-right:0 !important;">
								<p>사이즈</p>
								<p><strong>${productInfo5}</strong></p>
							</li>																						
						</ul>
					</div><!-- productGuide -->
					<hr/>
					<div class="customMemo">
						<p class="name">제품 설명</p>
						<p>${customMemo1}</p>
					</div>
					<hr/>
					<div>
						<p style="margin-bottom: 5px;">사이즈 정보</p>
						 <table border="1" class="tableSize" style="width:540px; height: 200px;">
					        <tr>
					            <td class="tdColor">cm</td>
					            <td class="tdColor">어깨</td>
					            <td class="tdColor">가슴둘레</td>
					            <td class="tdColor">소매</td>
					            <td class="tdColor">암홀둘레</td>
					            <td class="tdColor">총길이</td>
					        </tr>
					        <tr>
					            <td class="tdColor">2XL</td>
					            <td>49</td>
					            <td>124</td>
					            <td>67</td>
					            <td>52</td>
					            <td>72</td>
					        </tr>
					        <tr>
					            <td class="tdColor">3XL</td>
					            <td>51</td>
					            <td>128</td>
					            <td>68</td>
					            <td>56</td>
					            <td>73</td>
					        </tr>
					        <tr>
					            <td class="tdColor">4XL</td>
					            <td>53</td>
					            <td>134</td>
					            <td>71</td>
					            <td>60</td>
					            <td>74</td>
					        </tr>
					        <tr>
					            <td class="tdColor">5XL</td>
					            <td>55</td>
					            <td>138</td>
					            <td>72</td>
					            <td>62</td>
					            <td>75</td>
					        </tr>
					    </table>
					</div>
			    </div>
			</div> <!-- right -->
		</div> <!-- productInfo  -->
		<hr class="hrPosition"/>
		<div>
			<%@ include file="footer/footer2.jsp" %>
		</div>
	</div> <!-- container -->
</body>
</html>
























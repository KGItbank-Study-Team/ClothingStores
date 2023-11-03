<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setAttribute("productInfo", "#SLIMEBEAR.캐시미어 핸드메이드 더플코트 - 3 color");
request.setAttribute("subExplanation", "made by slimebear, 성숙한 감성의 더플코트 :)<br/>핸드메이드 봉제로 더 고급스럽게,<br/>"
		+ "퀄리티 있는 부자재로 더 완성도 높게 :)<br/>하나하나 매력있는 세 컬러로 만나보세요!");
request.setAttribute("color1", "화이트");
request.setAttribute("color2", "크림");
request.setAttribute("color3", "브라운");
request.setAttribute("color4", "챠콜");
request.setAttribute("color5", "블랙");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/css/productInfo.css">
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
									<ul class="ColorOptionPosition">
										<li class="color"><a href="#none"><span class="colorOption">${color1}</span></a></li>
										<li class="color"><a href="#none"><span class="colorOption">${color2}</span></a></li>
										<li class="color"><a href="#none"><span class="colorOption">${color3}</span></a></li>
										<li class="color"><a href="#none"><span class="colorOption">${color4}</span></a></li>
										<li class="color"><a href="#none"><span class="colorOption">${color5}</span></a></li>
									</ul>
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
						<a href="#none" class="btnOption"><span class="btnSpan">ADD TO CART</span></a>
						<a href="#none" class="btnOption"><span class="btnSpan">ADD TO WISH</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
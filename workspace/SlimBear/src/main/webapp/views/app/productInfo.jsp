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
	href="../resources/css/productInfo.css">
<title>상품상세정보</title>
</head>
<body>
	<%-- <%@ include file="header.jsp"%> --%>
	<div id=container>
		<div class="productInfo">
			<div class="left">
				<div class="productImg">
					<img alt="상품01" src="../resources/images/Best_product08.webp">
				</div>
			</div>
			<div class="right">
				<div class="explanation">
					<h2>${productInfo}</h2>
					<div class="subExplanation">${subExplanation}</div>
				</div>
				<div>
					<table>
						<tbody>
							<!--  <tr class="info-name">
								<td colspan="2"></td>
							</tr>-->
							<tr>
								<th scope="row"><span
									style="font-size: 12px; color: #555555;">CUSTOM</span>
								</th>
								<td><span style="font-size: 12px; color: #555555;">
										<span><del>239,000원</del></span>
								</span></td>
							</tr>
							<tr>
								<th scope="row"><span
									style="font-size: 12px; color: #555555;">PRICE</span>
								</th>
								<td><span style="font-size: 12px; color: #555555;">
										<strong>198,000원</strong>
								</span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
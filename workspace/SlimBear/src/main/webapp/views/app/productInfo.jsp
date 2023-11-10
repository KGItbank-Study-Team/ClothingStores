<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setAttribute("productInfo", "#SLIMEBEAR.WARM PLUS LIGHT V NECK JACKET 블랙");
	request.setAttribute("subExplanation", "made by slimebear, 성숙한 감성의 더플코트 :)<br/>핸드메이드 봉제로 더 고급스럽게,<br/>"
			+ "퀄리티 있는 부자재로 더 완성도 높게 :)<br/>하나하나 매력있는 세 컬러로 만나보세요!");
	ArrayList<String> colors = new ArrayList<String>();
		colors.add("화이트");
		colors.add("크림");
		colors.add("브라운");
		colors.add("챠콜");
		colors.add("블랙");
	ArrayList<String> sizes = new ArrayList<String>();
		sizes.add("2XL");
		sizes.add("3XL");
		sizes.add("4XL");
		sizes.add("5XL");
		
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" defer src="/resources/js/productInfo.js"></script>
<title>상품상세정보</title>
</head>
<body>
	<%@ include file="header/header.jsp"%>
	<div id="container">
		<div class="productInfo">
			<div class="left">
				<div class="productImg">
					<img alt="상품01" src="/resources/images/${product.main_image}">
				</div>
				<div></div>
			</div>
			<div class="right">
				<div class="explanation">
					<h2 style="padding-bottom: 15px;">${product.name}</h2>
					<div class="subExplanation">${product.desc}</div>
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
										<strong>${product.price}</strong>
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
									<ul class="colorOptionPosition"> <!-- 색상 옵션 -->
										<c:set var="color" value="<%=colors%>"/>
										<c:forEach var="colorList" items="${color}">
										<li class="colorBtn" onclick="productCnt">
											<a href="#none">
												<span class="colorOption">${colorList}</span>
											</a>
										</li>
										</c:forEach>
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
									<ul class="sizeOptionPosition"> <!-- 사이즈 옵션 -->
									<c:set var="size" value="<%=sizes%>"/>
									<c:forEach var="sizeList" items="${size}">
										<li class="sizeBtn" onclick="updateSelection()">
											<a href="#none">
												<span class="sizeOption">${sizeList}</span>
											</a>
										</li>
									</c:forEach>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>				
				</div>
				<!-- 옵션 선택 시 화면에 출력 -->
				<form action="/app/order/product" method="post">
					<div class="tablePosition">
						<table class="choiceOption">
							<colgroup>
								<col>
								<col>
								<col>
								<col>
							</colgroup>
							<tbody>
							
							</tbody>
						</table>
					</div>
				</form>
				<div class="btns">
					<div class="btn1">
						<a href="javascript:buyClick()" class="btnOption" style="margin-right: 12.5px !important;background:rgb(101,83,69);">
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
			<div id="wrapper">
		<main id="product">
			<section class="list">
				<nav>
					<h1>REVIEW</h1>
<!-- 					<p>
						HOME > <span>패션·의류·뷰티</span> > <strong>남성의류</strong>
					</p> -->
				</nav>
				<hr/>
				<ul class="sort">
					<li><a href="#" class="on">판매많은순</a></li>
					<li><a href="#">낮은가격순</a></li>
					<li><a href="#">높은가격순</a></li>
					<li><a href="#">평점높은순</a></li>
					<li><a href="#">후기많은순</a></li>
					<li><a href="#">최근등록순</a></li>
				</ul>
				<table>
					<%-- <c:forEach var="review" items="${reviews}"> --%>
						<tr>
							<td><a href="#" class="thumb"> <img class="review_images" src="/resources/images/Best_product09.webp" alt="상품이미지"></a></td>
							<td><a href="#" class="desc"><b>셔츠</b></a><br />
								<div class="review_text"><a>소매 길이가 좀 넉넉한것 같은데 너비는 잘맞습니다. 원단이 탄탄해서 세탁기 돌려도 변형이 잘 없을 것 같아요.</a></div>
							</td>
							<td>
								<ul class="free-delivery">
									<li><img src="/resources/images/free_delivery02.png" alt="무료배송"></li>
									<li>무료배송</li>
								</ul>
							</td>
							<td>
								<div class="btns"> <!-- 찜하기 하트 버튼 -->
									<button onclick="Toggle1(this)" class="btn">
										<i class="fa-sharp fa-solid fa-heart"></i>
									</button>
								</div> 
								<div class="review-cart"> <!-- 장바구니 추가 버튼 -->
									<a href="#"> 
										<svg xmlns="http://www.w3.org/2000/svg"
											width="22" height="22" fill="currentColor"
											class="bi bi-cart4" viewBox="0 0 16 16">
		                                    <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
		                                 </svg> 
									</a>
			                        <span class="cart-text">장바구니에 추가</span>
								</div>
							</td>
							<td>
								<div class="rating">${review.score}</div>
								<div class=review-id>${review.uid}</div>
								<div class="review_uid">${review.mem_id}</div>
								<div class=review-date>${review.reg_date}</div>
							</td>
						</tr>
					<%-- </c:forEach> --%>
				</table>
				<div class="paging">
					<span class="prev"> 
						<a href="#">< 이전</a>
					</span> 
					<span class="num">
						 <a href="#" class="on">1</a> 
						 <a href="#">2</a>
						<a href="#">3</a> 
						<a href="#">4</a> 
						<a href="#">5</a> 
						<a href="#">6</a>
						<a href="#">7</a>
					</span>
					 <span class="next">
					  <a href="#">다음 ></a>
					</span>
				</div>
			</section>
		</main>
	</div>
	</div> <!-- container -->
	<div class="footer">
		<%@ include file="footer/footer.jsp"%>
	</div>
</body>
</html>
























<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
								<th scope="row" class="solid2"><span style="font-size: 12px; color: #555555;">CUSTOM</span></th>
								<td class="solid"><span style="font-size: 12px; color: #555555;"> <span><del>239,000원</del></span>
								</span></td>
							</tr>
							<tr>
								<th scope="row" class="solid2"><span style="font-size: 12px; color: #555555;">PRICE</span></th>
								<td class="solid"><span style="font-size: 12px; color: #555555;"> <strong>${product.price}</strong>
								</span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<table style="margin-top: 40px;">
						<tbody>
							<tr>
								<th scope="row" class="solid3"><span style="font-size: 12px; color: #555555;">COLOR</span></th>
								<td>
									<ul class="colorOptionPosition">
										<!-- 색상 옵션 -->
										<c:forEach var="detailList" items="${productDetailList}">
											<li class="colorBtn" onclick="productCnt"><a href="#none"> <span class="colorOption">${detailList.color}</span>
											</a></li>
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
								<th scope="row" class="solid3"><span style="font-size: 12px; color: #555555;">SIZE</span></th>
								<td>
									<ul class="sizeOptionPosition">
										<!-- 사이즈 옵션 -->
										<c:forEach var="detailList" items="${productDetailList}">
											<li class="sizeBtn" onclick="updateSelection()"><a href="#none"> <span class="sizeOption">${detailList.size}</span>
											</a></li>
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
						<a href="javascript:buyClick()" class="btnOption" style="margin-right: 12.5px !important; background: rgb(101, 83, 69);"> <span class="btnSpan" style="color: white !important;">BUY IT NOW</span>
						</a> <a href="#none" class="btnOption" style="background: #eae5dd;"><span class="btnSpan">ADD TO CART</span></a> <a href="#none" class="btnOption" style="background: #eae5dd;"><span class="btnSpan">ADD TO WISH</span></a>
					</div>
				</div>
				<!-- 사이즈 가이드 -->
				<div class="guideBox">
					<br />
					<hr />
					<div class=shoppingInfo>
						<p class="name">배송정보</p>
						<ul class="ulClass">
							<li>
								<p>배송방법</p> <strong>국내배송</strong>
							</li>
							<li>
								<p>배송예정일</p>
								<p>
									<strong>3일 이내 출고</strong>
								</p>
							</li>
							<li>
								<p>택배사</p>
								<p>
									<strong>한진택배</strong>
								</p>
							</li>
						</ul>
					</div>
					<hr />
					<div class="productGuide">
						<p class="name1">제품 가이드</p>
						<ul class="ulClass">
							<li>
								<p>신축성</p>
								<p>
									<strong>${productInfo1}</strong>
								</p>
							</li>
							<li>
								<p>두께감</p>
								<p>
									<strong>${productInfo2}</strong>
								</p>
							</li>
							<li>
								<p>안감</p>
								<p>
									<strong>${productInfo3}</strong>
								</p>
							</li>
							<li>
								<p>비침</p>
								<p>
									<strong>${productInfo4}</strong>
								</p>
							</li>
							<li style="margin-right: 0 !important;">
								<p>사이즈</p>
								<p>
									<strong>${productInfo5}</strong>
								</p>
							</li>
						</ul>
					</div>
					<!-- productGuide -->
					<hr />
					<div class="customMemo">
						<p class="name">제품 설명</p>
						<p>${customMemo1}</p>
					</div>
					<hr />
					<div>
						<p style="margin-bottom: 5px;">사이즈 정보</p>
						<table border="1" class="tableSize" style="width: 540px; height: 200px;">
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
			</div>
			<!-- right -->
		</div>
		<!-- productInfo  -->
		<hr/>
		<br/>
		<div class="DetailInfo">
			<div><img alt="이미지" src="/resources/images/product_DetailInfo01.jpg"></div>
			<div><img alt="이미지" src="/resources/images/product_DetailInfo02.jpg"></div>
			<div><img alt="이미지" src="/resources/images/product_DetailInfo03.jpg"></div>
			<div><img alt="이미지" src="/resources/images/product_DetailInfo04.jpg"></div>
			<div><img alt="이미지" src="/resources/images/product_DetailInfo05.jpg"></div>
			<div><img alt="이미지" src="/resources/images/product_DetailInfo06.jpg"></div>
			<div><img alt="이미지" src="/resources/images/product_DetailInfo07.jpg"></div>
			<div><img alt="이미지" src="/resources/images/product_DetailInfo08.jpg"></div>
			<div><img alt="이미지" src="/resources/images/product_DetailInfo09.jpg"></div>
			<div><img alt="이미지" src="/resources/images/product_DetailInfo10.jpg"></div>
			<div><img alt="이미지" src="/resources/images/product_DetailInfo11.jpg"></div>
			<div><img alt="이미지" src="/resources/images/product_DetailInfo12.jpg"></div>
		</div>
		<!-- 리뷰 영역 -->
		<div id="wrapper">
			<main id="product">
				<section class="list">
					<nav>
						<h1>REVIEW</h1>
					</nav>
					<hr class="myHr" />
					<div class="sort">
						<div class="view-align">
							<a href="#" class="on">판매많은순</a>
						</div>
						<div class="view-align">
							<a href="#">낮은가격순</a>
						</div>
						<div class="view-align">
							<a href="#">높은가격순</a>
						</div>
						<div class="view-align">
							<a href="#">평점높은순</a>
						</div>
						<div class="view-align">
							<a href="#">후기많은순</a>
						</div>
						<div class="view-align">
							<a href="#">최근등록순</a>
						</div>
					</div>
					<hr />
					<c:forEach items="${reviewList}" var="list">
					<div class="review-section">
						<div class="info">
							<div>
								<span>${list.mem_id}</span>
								<div>
									<p>${list.reg_date}</p>
								</div>
							</div>
							<div class="review-score">★★★★★(${list.score})</div>
						</div>
						<div class="photo-review">
							<a><img alt="상품" src="/resources/images/review_images01.jpg"></a> <a><img alt="상품" src="/resources/images/review_images02.jpg"></a> <a><img alt="상품" src="/resources/images/review_images03.jpg"></a> <a><img alt="상품" src="/resources/images/review_images04.jpg"></a> <a><img
								alt="상품" src="/resources/images/review_images05.jpg"
							></a>
						</div>
						<div class="review-text">
							<div>
								${list.content}
							</div>
						</div>
						<!-- <hr /> -->
					</c:forEach>
						<div class="paging">
							<span class="prev"> <a href="#">< 이전</a>
							</span> <span class="num"> <a href="#" class="on">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a>
							</span> <span class="next"> <a href="#">다음 ></a>
							</span>
						</div>
					</div>
				</section>
			</main>
		</div>
	</div>
	<!-- container -->
	<div class="footer">
		<%@ include file="footer/footer.jsp"%>
	</div>
</body>
</html>
























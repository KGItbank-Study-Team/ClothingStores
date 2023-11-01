<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	request.setAttribute("product_id", "[1+1] 파운드 베이직 후드티");
	request.setAttribute("content",  "이곳은 리뷰 영역입니다.");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>슬림베어</title>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- font awesome -->
<script src="https://kit.fontawesome.com/09decccad8.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/review_page.css">
<script defer src="../resources/js/review_page.js"></script>
</head>

<body>
		<header>
			<%@ include file="header.jsp"%>
		</header>
	<div id="wrapper">
		<main id="product">
			<section class="list">
				<nav>
					<h1>REVIEW</h1>
					<p>
						HOME > <span>패션·의류·뷰티</span> > <strong>남성의류</strong>
					</p>
				</nav>
				<ul class="sort">
					<li><a href="#" class="on">판매많은순</a></li>
					<li><a href="#">낮은가격순</a></li>
					<li><a href="#">높은가격순</a></li>
					<li><a href="#">평점높은순</a></li>
					<li><a href="#">후기많은순</a></li>
					<li><a href="#">최근등록순</a></li>
				</ul>
				<table>
					<tr>
						<td><a href="#" class="thumb"> <img class="review_images"
								src="../resources/review_images/Best_product09.webp" alt="상품이미지"
								style=""></a></td>
						<td><a href="#" class="desc"><b>${product_id}</b></a><br />
							<div class="review_text">${content}</div></td>
						<td>
							<ul class="free-delivery">
								<li><img
									src="../resources/review_images/free_delivery02.png" alt="무료배송"
									style=""></li>
								<li>무료배송</li>
							</ul>
						</td>
						<td>
							<div class="star">
								<div class="rating">
									<span class="star">&#9733;</span> <span class="star">&#9733;</span>
									<span class="star">&#9733;</span> <span class="star">&#9733;</span>
									<span class="star">&#9733;</span>
								</div>
							</div>
							<div class="heart-cart">
								<div class="btns">
									<button onclick="Toggle1()" id="btnh1" class="btn flex-item">
										<i class="fa-sharp fa-solid fa-heart"></i>
									</button>
								</div>
								<div>
									<a href="장바구니로 슝~" class="review-cart"> 
										<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22"
											 fill="currentColor" class="bi bi-cart4 flex-item"
											 viewBox="0 0 16 16">
	                                            <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
	                                        </svg>
									</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td><a href="#" class="thumb"> <img
								src="	https://via.placeholder.com/120x120" alt="상품이미지">
						</a></td>
						<td>
							<h3 class="name">상품명</h3> <a href="#" class="desc">상품설명</a>
						</td>
						<td>
							<ul>
								<li><ins class="dis-price">27,000</ins></li>
								<li><del class="org-price">30,000</del> <span
									class="discount">10%</span></li>
								<li><span class="free-delivery">무료배송</span></li>
							</ul>
						</td>
						<td>
							<h4 class="seller">
								<i class="fas fa-home" aria-hidden="true"></i> 판매자
							</h4>
							<h5 class="badge power">판매자등급</h5>
							<h6 class="rating star2">상품평</h6>
						</td>
					</tr>
					<tr>
						<td><a href="#" class="thumb"> <img
								src="	https://via.placeholder.com/120x120" alt="상품이미지">
						</a></td>
						<td>
							<h3 class="name">상품명</h3> <a href="#" class="desc">상품설명</a>
						</td>
						<td>
							<ul>
								<li><ins class="dis-price">27,000</ins></li>
								<li><del class="org-price">30,000</del> <span
									class="discount">10%</span></li>
								<li><span class="free-delivery">무료배송</span></li>
							</ul>
						</td>
						<td>
							<h4 class="seller">
								<i class="fas fa-home" aria-hidden="true"></i> 판매자
							</h4>
							<h5 class="badge power">판매자등급</h5>
							<h6 class="rating star3">상품평</h6>
						</td>
					</tr>
					<tr>
						<td><a href="#" class="thumb"> <img
								src="	https://via.placeholder.com/120x120" alt="상품이미지">
						</a></td>
						<td>
							<h3 class="name">상품명</h3> <a href="#" class="desc">상품설명</a>
						</td>
						<td>
							<ul>
								<li><ins class="dis-price">27,000</ins></li>
								<li><del class="org-price">30,000</del> <span
									class="discount">10%</span></li>
								<li><span class="free-delivery">무료배송</span></li>
							</ul>
						</td>
						<td>
							<h4 class="seller">
								<i class="fas fa-home" aria-hidden="true"></i> 판매자
							</h4>
							<h5 class="badge power">판매자등급</h5>
							<h6 class="rating star4">상품평</h6>
						</td>
					</tr>
					<tr>
						<td><a href="#" class="thumb"> <img
								src="	https://via.placeholder.com/120x120" alt="상품이미지">
						</a></td>
						<td>
							<h3 class="name">상품명</h3> <a href="#" class="desc">상품설명</a>
						</td>
						<td>
							<ul>
								<li><ins class="dis-price">27,000</ins></li>
								<li><del class="org-price">30,000</del> <span
									class="discount">10%</span></li>
								<li><span>배송비 2500</span></li>
							</ul>
						</td>
						<td>
							<h4 class="seller">
								<i class="fas fa-home" aria-hidden="true"></i> 판매자
							</h4>
							<h5 class="badge power">판매자등급</h5>
							<h6 class="rating star5">상품평</h6>
						</td>
					</tr> 
				</table>
				<div class="paging">
					<span class="prev"> <a href="#"> < 이전</a>
					</span> <span class="num"> <a href="#" class="on">1</a> <a href="#">2</a>
						<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
						<a href="#">7</a>
					</span> <span class="next"> <a href="#">다음 ></a>
					</span>
				</div>
			</section>
		<div id="footer">
			<%@ include file="footer.jsp" %>
		</div>
		</main>
		<!-- <button type="button" id="top">상단이동</button> -->
	</div>
</body>

</html>
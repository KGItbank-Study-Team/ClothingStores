<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/main_page.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Merienda:wght@300&family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script defer src="/resources/js/main_page.js"></script>
<script src="https://kit.fontawesome.com/09decccad8.js" crossorigin="anonymous"></script>
<title>SLIIMBEAR</title>
</head>
<body>
	<jsp:include page="header/header.jsp"></jsp:include>
	<main>
		<div class="banner-container" style="padding-top:100px;">
			<!-- 상단 제품 스크롤배너 -->
			<div class="slide slide_wrap">
				<c:forEach var="item" items="${productBannerTop}">
					<div class="slide_item">
						<a href="/app/product?p=${item.prod_uid}"><img src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/${item.image}" alt=""></a>
					</div>
				</c:forEach>
				<div class="slide_prev_button slide_button"><img alt="슬라이드" src="/resources/images/left-arrow.png"> </div>
				<div class="slide_next_button slide_button"><img alt="슬라이드" src="/resources/images/right-arrow.png"></div>	
				<ul class="slide_pagination"></ul>
			</div>
		</div>
		<div id="one-text">
			<!-- <h2>SlimBear</h2> -->
			<p>
			${bannerText }
			</p>
		</div>
		<div id="one-best">
			<h3  class="new-text">기다리고 기다리던!</h3>
			<h1>NEW ITEM!</h1>
		</div>
		<div class="product-container"> 
			<div class="slider-wrapper">
				<button id="prev-slide" class="slide-button material-symbols-rounded">&lsaquo;</button>
				<div class="image-list"> 
					<c:forEach var="item" items="${newMainProductList}">
					<div>
						<a href="/app/product?p=${item.uid}"><img class="image-item" src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/${item.main_image}" alt="img-1" /></a>
					</div>
					</c:forEach>
				</div>
				<button id="next-slide" class="slide-button material-symbols-rounded">&rsaquo;</button>
			</div>
			<div class="slider-scrollbar">
				<div class="scrollbar-track">
					<div class="scrollbar-thumb"></div>
				</div>
			</div>
		</div>
		<div id="wrap">
			<div id="contents">
				<div id="prdBest" class="xans-element- xans-product xans-product-listrecommend">
					<ul>
						<div id="slide" class="ec-base-product swiper-container">
							<div class="title">
								<span>가장 많이 사랑받은 베스트</span>
								<h2 style="font-size: 20px !important;">🔥BEST ITEM🔥</h2>
							</div>
							<ul class="prdList grid4 swiper-wrapper">
								<c:forEach var="item" items="${bestProductList}">
									<li id="anchorBoxId_4777" class="swiper-slide xans-record-">
										<div class="thumbnail">
											<div class="salePer"></div>
											<div class="prdImg">
												<a href="/app/product?p=${item.uid}" name="anchorBoxName_4777"> <img src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/${item.main_image}" id="eListPrdImage4777_2" alt="상품사진" class="thumgList" />
												</a> <span class="chk"> <input type="checkbox" class="ProductCompareClass xECPCNO_4777 displaynone" />
												</span>
											</div>
											<!-- .prdImg -->
										</div> <!-- .thumbnail -->
										<div class="description">
											<strong class="name"> <a href="#" class=""> <span class="title displaynone"> <span style="font-size: 20px; color: #555555;">${item.name}</span>:
												</span><span style="font-size: 16px; color: #555555;">${item.name}</span>
											</a>
											</strong>
											<!-- .name -->
											<ul class="xans-element- xans-product xans-product-listitem spec" style="display: inline-block;">
												<li class=" xans-record-"><strong class="title displaynone"> <span style="font-size: 12px; color: #555555;">상품색상</span> :
												</strong>
													<div class="color">
														<span class="chips" title="#EBE4D3" style="background-color: #EBE4D3" color_no="" displayGroup="2"></span> <span class="chips" title="#000000" style="background-color: #000000" color_no="" displayGroup="2"></span>
													</div></li>
												<li class=" xans-record-"><strong class="title displaynone"> <span style="font-size: 12px; color: #999999;">상품설명</span> :
												</strong> <span style="font-size: 12px; color: #555555;"> ${item.desc } </span></li>
												<li class=" xans-record-"><strong class="title displaynone"> <span style="font-size: 12px; color: #555555;">소비자가</span> :
												</strong> <span style="font-size: 12px; color: #555555; text-decoration: line-through;">${item.price}</span></li>
												<li class=" xans-record-"><strong class="title displaynone"> <span style="font-size: 12px; color: #555555; font-weight: bold;">판매가</span> :
												</strong> <span style="font-size: 12px; color: #555555; font-weight: bold;">${item.price }</span> <span id="span_product_tax_type_text" style=""></span></li>
											</ul>
											<!-- .spec -->
											<div class="icon">
												<div class="promotion">
													<img src="/resources/images/custom_4016861243871563.png" alt="" /> <img src="/resources/images/custom_3916861243874417.png" alt="" /> <img src="/resources/images/benefit_shop1_83114664803d66b20824.38964181.png" alt="" />
												</div>
											</div>
											<!-- .icon -->
										</div> <!-- .description -->
									</li>
								</c:forEach>
							</ul>
							<div class="swiper-scrollbar"></div>
						</div>
					</ul>
				</div>
				<main>
					<div class="xans-element- xans-product xans-product-menupackage ">
						<div class="xans-element- xans-product xans-product-headcategory path ">
							
						</div>
						<div class="xans-element- xans-product xans-product-headcategory titleArea ">
							<h2>${category.name}</h2>
						</div>
						<div class="xans-element- xans-product xans-product-headcategory title ">
							<h2>
								<span></span>
							</h2>
							<span class="likeButton displaynone">
								<button type="button">
									<strong></strong>
								</button>
							</span>
						</div>
						<div class="list_title">
							<div class="left">
<!-- 								<ul class="menuCategory"> -->
<%-- 									<c:forEach var="item" items="${categoryList}"> --%>
<%-- 										<li style="display:;" class="xans-element- xans-product xans-product-displaycategory  xans-record-"><a href="/app/product/category?category=${item.uid }"> ${item.name} <span class="count displaynone">()</span> --%>
<!-- 										</a></li> -->
<%-- 									</c:forEach> --%>
<!-- 								</ul> -->
							</div>
							<div class="right">
								<div class="xans-element- xans-product xans-product-normalmenu ">
									<!--$compare_page = /product/compare.html-->
									<p class="prdCount">
										등록 제품 : <strong>${totalItems}</strong> 개
									</p>
									<div class="function" id="Product_ListMenu">

										<ul id="type" class="xans-element- xans-product xans-product-orderby">
											<li class="xans-record-"><a href="#출시일로 정렬">신상품</a></li>
											<li class="xans-record-"><a href="/app/main?order=PRICE_ASC">낮은가격</a></li>
											<li class="xans-record-"><a href="/app/main?order=PRICE_DESC">높은가격</a></li>
											<li class="xans-record-"><a href="#리뷰페이지">사용후기</a></li>
										</ul>
										<span class="compare displaynone"> <a href="#none" class="btnCompare" onclick="EC_ListAction.setProductCompare();">상품비교</a>
										</span>
									</div>
								</div>
							</div>
							<!-- right -->
						</div>
					</div>
					<div class="xans-element- xans-product xans-product-normalpackage ">
						<div class="xans-element- xans-product xans-product-listnormal ec-base-product">
							<!--
				$count = 36
					※ 상품진열갯수를 설정하는 변수입니다. 설정하지 않을 경우, 최대 200개의 상품이 진열 됩니다.
					※ 진열된 상품이 많으면, 쇼핑몰에 부하가 발생할 수 있습니다.
				$basket_result = /product/add_basket.html
				$basket_option = /product/basket_option.html
			-->
							<ul class="prdList grid4">
								<c:forEach var="item" items="${newProductList}">
									<li id="anchorBoxId_7902" class="xans-record-">
										<div class="thumbnail">
											<div class="salePer"></div>
											<div class="prdImg">
												<a href="/app/product?p=${item.uid}" name="anchorBoxName_7902"> <img src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/${item.main_image}" id="eListPrdImage7902_1" alt="상품사진" class="thumgList" />
												</a> <span class="chk"> <input type="checkbox" class="ProductCompareClass xECPCNO_7902 displaynone" />
												</span>
											</div>
											<!-- .prdImg -->
										</div> <!-- .thumbnail -->
										<div class="description">
											<strong class="name">
												 <a href="#" class=""> 
												 	<span class="title displaynone"><span style="font-size: 25px; color: #555555;">상품명</span> :</span><span style="font-size: 20px;">${item.name}</span>
											</a>
											</strong>
											<!-- .name -->
											<ul class="xans-element- xans-product xans-product-listitem spec" style="display: inline-block">
												<li class=" xans-record-"><strong class="title displaynone"> <span style="font-size: 12px; color: #555555;">상품색상</span> :
												</strong>
													<div class="color">
														<span class="chips" title="#CFBCAE" style="background-color: #CFBCAE" color_no="" displayGroup="1"></span> <span class="chips" title="#845E22" style="background-color: #845E22" color_no="" displayGroup="1"></span>
													</div></li>
												<li class=" xans-record-"><strong class="title displaynone"> <span style="font-size: 11px; color: #999999;">소비자가</span> :
												</strong> <span style="font-size: 11px; color: #999999; text-decoration: line-through;">${item.price}원</span></li>
												<li class=" xans-record-"><strong class="title displaynone"> <span style="font-size: 12px; color: #555555;">판매가</span> :
												</strong> <span style="font-size: 12px; color: #555555; text-decoration: line-through;">${item.price }원</span> <span id="span_product_tax_type_text" style="text-decoration: line-through;"></span></li>
												<li class=" xans-record-"><strong class="title "> <span style="font-size: 12px; color: #555555;">할인판매가</span> :
												</strong> <span style="font-size: 12px; color: #555555;"> 최종할인판매가 <span style="font-size: 11px; color: #fa6767; font-weight: bold;">${item.sale_price}원</span>
												</span></li>
												<li class=" xans-record-"><strong class="title displaynone"> <span style="font-size: 12px; color: #555555;">상품간략설명</span> :
												</strong> <div style="display: inline-block;"><span class="desc">${item.desc }</span></div></li>
												<!-- <li class=" xans-record-"><strong class="title displaynone"> <span style="font-size: 12px; color: #999999;">상품요약정보</span> :
												</strong> <span style="font-size: 12px; color: #999999;">${item.desc }</span></li> -->
											</ul>
											<!-- .spec -->
											<div class="icon">
												<div class="promotion">
													<img src="/resources/images/benefit_shop1_83114664803d66b20824.38964181.png" alt="무료배송!" />
												</div>
											</div>
											<!-- .icon -->
										</div> <!-- .description -->
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div
					class="xans-element- xans-product xans-product-normalpaging ec-base-paginate">
					<ol>
						<!-- Previous Page Button -->
						<li class="page-item ${currentPage eq 1 ? 'disabled' : ''}">
							<a class="page-link"
							href="/app/main?currentPage=${currentPage - 1}&order=${order}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
						</li>
						<!-- Page Number Buttons -->
						<c:forEach begin="${startPage }" end="${endPage}" var="pageNumber">
							<li class="xans-record-"><c:choose>
									<c:when test="${pageNumber eq currentPage}">
										<!-- 현재 페이지인 경우 active-page 클래스를 추가하여 스타일을 적용 -->
										<a
											href="/app/main?currentPage=${pageNumber}&order=${order}"
											class="this">${pageNumber}</a>
									</c:when>
									<c:otherwise>
										<!-- 현재 페이지가 아닌 경우 일반적인 스타일을 적용 -->
										<a
											href="/app/main?currentPage=${pageNumber}&order=${order}"
											class="other">${pageNumber}</a>
									</c:otherwise>
								</c:choose></li>
						</c:forEach>
						<!-- Next Page Button -->
						<li
							class="page-item ${currentPage eq totalPages ? 'disabled' : ''}">
							<a class="page-link"
							href="/app/main?currentPage=${currentPage + 1}&order=${order}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a>
						</li>
					</ol>
					<!-- 마지막 페이지 여부 확인 후 출력 -->
					<c:if test="${currentPage eq totalPages && !hasNextBlock}">
						<li class="page-item disabled"><span class="page-link">마지막
								페이지입니다.</span></li>

					</c:if>
				</div>

				</main>

			</div>
	</main>

		<script type="text/javascript" src="/resources/js/ko.js"
		charset="utf-8"></script>
	<script src="/resources/js/optimizer.js"></script>
	<script src="/resources/js/optimizeruser.js"></script>
	<script>
    document.addEventListener('DOMContentLoaded', function () {
        var currentPage = ${currentPage};
        var totalPages = ${totalPages};
        var hasNextBlock = ${hasNextBlock};

        var prevPageButton = document.querySelector('.page-link[aria-label="Previous"]');
        var nextPageButton = document.querySelector('.page-link[aria-label="Next"]');
        var firstPageMessage = document.querySelector('.first-page-message');
        var lastPageMessage = document.querySelector('.last-page-message');

        prevPageButton.addEventListener('click', function (event) {
            if (currentPage === 1) {
                alert('첫 번째 페이지입니다.');
                event.preventDefault(); // 이전 페이지로 이동하지 않도록 막음
            }
        });

        nextPageButton.addEventListener('click', function (event) {
            if (currentPage === totalPages && !hasNextBlock) {
                alert('마지막 페이지입니다.');
                event.preventDefault(); // 다음 페이지로 이동하지 않도록 막음
            }
        });
    });
</script>
		<jsp:include page="footer/footer.jsp" />
</body>
</html>
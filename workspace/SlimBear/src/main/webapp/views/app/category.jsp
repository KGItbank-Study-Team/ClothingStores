<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<jsp:include page="header/header.jsp" />
<html>
<head>
<script type="text/javascript">
	window.CAFE24 = window.CAFE24 || {};
	
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/optimizer.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/optimizeruser.css" />
<style type="text/css"></style>
<link
	href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;800&amp;display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link rel="stylesheet" href="/resources/css/swiper.css" />
<script src="/resources/js/swiper.js"></script>
<title>${category.name}-슬림베어</title>
<style type="text/css">
.title {
	padding-top: 77px;
}
</style>
</head>
<body id="main">
	<div id="wrap">
		<div id="contents">
			<div id="prdBest"
				class="xans-element- xans-product xans-product-listrecommend">
				<ul style="padding-top: 50px;">
					<div id="slide" class="ec-base-product swiper-container">
						<div class="title">
							<span>가장 많이 사랑받은 베스트</span>
							<h2>BEST ITEM</h2>
						</div>
						<ul class="prdList grid4 swiper-wrapper">
							<c:forEach var="item" items="${bestProductList}">

								<li id="anchorBoxId_4777" class="swiper-slide xans-record-">
									<div class="thumbnail">
										<div class="salePer"></div>
										<div class="prdImg">
											<a href="/app/product?p=${item.uid}"
												name="anchorBoxName_4777"> <img
												src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/${item.main_image}"
												id="eListPrdImage4777_2" alt="상품사진" class="thumgList" />
											</a>
										</div>
										<!-- .prdImg -->
									</div> <!-- .thumbnail -->
									<div class="description">
										<strong class="name"> <a href="#" class=""> <span
												class="title displaynone"> <span
													style="font-size: 12px; color: #555555;">${item.name}</span>:
											</span>${item.name}
										</a>
										</strong>
										<!-- .name -->
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #999999;">상품설명</span> :
											</strong> <span style="font-size: 12px; color: #999999;">
													${item.desc } </span></li>
											<!-- 기존 코드 -->
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #555555;">소비자가</span>:
											</strong> <span id="formattedPrice"
												style="font-size: 12px; color: #555555; text-decoration: line-through;">
													${item.price}원 </span></li>
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #555555; font-weight: bold;">판매가</span>:
											</strong> <span id="formattedSalePrice"
												style="font-size: 12px; color: #555555; font-weight: bold;">
													${item.price - item.sale_price}원 </span> <span
												id="span_product_tax_type_text" style=""></span></li>
											<!-- 기존 코드 끝 -->

										</ul>
										<!-- .spec -->
										<div class="icon">
											<div class="promotion">
												<img src="/resources/images/custom_4016861243871563.png"
													alt="" /> <img
													src="/resources/images/custom_3916861243874417.png" alt="" />
												<img
													src="/resources/images/benefit_shop1_83114664803d66b20824.38964181.png"
													alt="" />
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
					<div
						class="xans-element- xans-product xans-product-headcategory path ">
						<span>현재 위치</span>
					</div>
					<div
						class="xans-element- xans-product xans-product-headcategory titleArea ">
						<h2>${category.name}</h2>
					</div>
					<div
						class="xans-element- xans-product xans-product-headcategory title ">
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
							<ul class="menuCategory">
								<c:forEach var="item" items="${categoryList}">
									<li style="display:;"
										class="xans-element- xans-product xans-product-displaycategory  xans-record-">
										<a href="/app/product/category?category=${item.uid }">
											${item.name} <span class="count displaynone">()</span>
									</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="right">
							<div class="xans-element- xans-product xans-product-normalmenu ">
								<!--$compare_page = /product/compare.html-->
								<p class="prdCount">
									등록 제품 : <strong>${totalItems}</strong> 개
								</p>
								<div class="function" id="Product_ListMenu">

									<ul id="type"
										class="xans-element- xans-product xans-product-orderby">
										<li class="xans-record-"><a
											href="/app/product/category/?category=${category.uid }&order=REG_DATE">신상품</a></li>
										<li class="xans-record-"><a
											href="/app/product/category/?category=${category.uid }&order=PRICE_ASC">낮은가격</a></li>
										<li class="xans-record-"><a
											href="/app/product/category/?category=${category.uid }&order=PRICE_DESC">높은가격</a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- right -->
					</div>
				</div>
				<div class="xans-element- xans-product xans-product-normalpackage ">
					<div
						class="xans-element- xans-product xans-product-listnormal ec-base-product">
						<!--
				$count = 36
					※ 상품진열갯수를 설정하는 변수입니다. 설정하지 않을 경우, 최대 200개의 상품이 진열 됩니다.
					※ 진열된 상품이 많으면, 쇼핑몰에 부하가 발생할 수 있습니다.
				$basket_result = /product/add_basket.html
				$basket_option = /product/basket_option.html
			-->
						<ul class="prdList grid4">
							<c:forEach var="item" items="${productList}">
								<li id="anchorBoxId_7902" class="xans-record-">
									<div class="thumbnail">
										<div class="salePer"></div>
										<div class="prdImg">
											<a href="/app/product?p=${item.uid}"
												name="anchorBoxName_7902"> <img
												src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/${item.main_image}"
												id="eListPrdImage7902_1" alt="상품사진" class="thumgList" />
											</a> <span class="chk"> <input type="checkbox"
												class="ProductCompareClass xECPCNO_7902 displaynone" />
											</span>
										</div>
										<!-- .prdImg -->
									</div> <!-- .thumbnail -->
									<div class="description">
										<strong class="name"> <a href="#" class=""> <span
												class="title displaynone"> <span
													style="font-size: 12px; color: #555555;">상품명</span> :
											</span>${item.name}
										</a>
										</strong>
										<!-- .name -->
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<!-- 기존 코드 -->
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #555555;">소비자가</span>:
											</strong> <span id="formattedPrice"
												style="font-size: 12px; color: #555555; text-decoration: line-through;">
													${item.price}원 </span></li>
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #555555; font-weight: bold;">판매가</span>:
											</strong> <span id="formattedSalePrice"
												style="font-size: 12px; color: #555555; font-weight: bold;">
													${item.price - item.sale_price}원 </span> <span
												id="span_product_tax_type_text" style=""></span></li>
											<!-- 기존 코드 끝 -->

											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #999999;">상품요약정보</span> :
											</strong> <span style="font-size: 12px; color: #999999;">${item.desc }</span></li>
										</ul>
										<!-- .spec -->
										<div class="icon">
											<div class="promotion">
												<img
													src="/resources/images/benefit_shop1_83114664803d66b20824.38964181.png"
													alt="무료배송!" />
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
							href="/app/product/category?category=${category.uid }&order=${order}&currentPage=${currentPage - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
						</li>
						<!-- Page Number Buttons -->
						<c:forEach begin="${startPage }" end="${endPage}" var="pageNumber">
							<li class="xans-record-"><c:choose>
									<c:when test="${pageNumber eq currentPage}">
										<!-- 현재 페이지인 경우 active-page 클래스를 추가하여 스타일을 적용 -->
										<a
											href="/app/product/category?category=${category.uid }&order=${order }&currentPage=${pageNumber}"
											class="this">${pageNumber}</a>
									</c:when>
									<c:otherwise>
										<!-- 현재 페이지가 아닌 경우 일반적인 스타일을 적용 -->
										<a
											href="/app/product/category?category=${category.uid }&order=${order }&currentPage=${pageNumber}"
											class="other">${pageNumber}</a>
									</c:otherwise>
								</c:choose></li>
						</c:forEach>
						<!-- Next Page Button -->
						<li
							class="page-item ${currentPage eq totalPages ? 'disabled' : ''}">
							<a class="page-link"
							href="/app/product/category?category=${category.uid }&order=${order}&currentPage=${currentPage + 1}"
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
		<!-- #footer -->
	</div>
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
    function formatCurrency(amount) {
        // 숫자를 통화 형식으로 변환
        var formattedAmount = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(amount);
        return formattedAmount;
    }

    var item = {
        price: ${price},
        sale_price: ${sale_price}
    };

    // 판매가격 포맷팅 및 표시
    var formattedPrice = formatCurrency(price);
    document.getElementById('formattedPrice').innerText = formattedPrice;

    // 할인판매가격 포맷팅 및 표시
    var formattedSalePrice = formatCurrency(price);
    document.getElementById('formattedSalePrice').innerText = formattedSalePrice;
</script>


</body>
</html>

<jsp:include page="footer/footer.jsp" flush="false" />

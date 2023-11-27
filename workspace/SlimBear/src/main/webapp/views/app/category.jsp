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
				<ul>
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
												src="/resources/images/${item.main_image}"
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
													style="font-size: 12px; color: #555555;">상품색상</span> :
											</strong>
												<div class="color">
													<span class="chips" title="#EBE4D3"
														style="background-color: #EBE4D3" color_no=""
														displayGroup="2"></span> <span class="chips"
														title="#000000" style="background-color: #000000"
														color_no="" displayGroup="2"></span>
												</div></li>
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #999999;">상품설명</span> :
											</strong> <span style="font-size: 12px; color: #999999;">
													${item.desc } </span></li>
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #555555;">소비자가</span> :
											</strong> <span
												style="font-size: 12px; color: #555555; text-decoration: line-through;">${item.price}</span>
											</li>
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #555555; font-weight: bold;">판매가</span>
													:
											</strong> <span
												style="font-size: 12px; color: #555555; font-weight: bold;">${item.price }</span>
												<span id="span_product_tax_type_text" style=""></span></li>
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
										<li class="xans-record-"><a href="#리뷰페이지">사용후기</a></li>
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
												src="/resources/images/${item.main_image}"
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
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #555555;">상품색상</span> :
											</strong>
												<div class="color">
													<span class="chips" title="#CFBCAE"
														style="background-color: #CFBCAE" color_no=""
														displayGroup="1"></span> <span class="chips"
														title="#845E22" style="background-color: #845E22"
														color_no="" displayGroup="1"></span>
												</div></li>
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 11px; color: #999999;">소비자가</span> :
											</strong> <span
												style="font-size: 11px; color: #999999; text-decoration: line-through;">${item.price}</span>
											</li>
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #555555;">판매가</span> :
											</strong> <span
												style="font-size: 12px; color: #555555; text-decoration: line-through;">${item.price }</span>
												<span id="span_product_tax_type_text"
												style="text-decoration: line-through;"></span></li>
											<li class=" xans-record-"><strong class="title ">
													<span style="font-size: 12px; color: #555555;">할인판매가</span>
													:
											</strong> <span style="font-size: 12px; color: #555555;">
													최종할인판매가 <span
													style="font-size: 11px; color: #fa6767; font-weight: bold;">할인률DBDBDB
														%</span>
											</span></li>
											<li class=" xans-record-"><strong
												class="title displaynone"> <span
													style="font-size: 12px; color: #555555;">상품간략설명</span> :
											</strong> <span style="font-size: 12px; color: #555555;">${item.desc }</span></li>
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
				<div class="xans-element- xans-product xans-product-normalpaging ec-base-paginate">
    <ol>
        <!-- Previous Page Button -->
        <li class="page-item ${currentPage eq 1 ? 'disabled' : ''}">
            <a class="page-link"
               href="/app/product/category?category=${category.uid }&order=${order}&currentPage=${currentPage - 1}"
               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <!-- Page Number Buttons -->
        <c:forEach begin="1" end="${totalPages}" var="pageNumber">
            <li class="xans-record-"><c:choose>
                    <c:when test="${pageNumber eq currentPage}">
                        <!-- 현재 페이지인 경우 active-page 클래스를 추가하여 스타일을 적용 -->
                        <a href="/app/product/category?category=${category.uid }&order=${order }&currentPage=${pageNumber}"
                           class="this">${pageNumber}</a>
                    </c:when>
                    <c:otherwise>
                        <!-- 현재 페이지가 아닌 경우 일반적인 스타일을 적용 -->
                        <a href="/app/product/category?category=${category.uid }&order=${order }&currentPage=${pageNumber}"
                           class="other">${pageNumber}</a>
                    </c:otherwise>
                </c:choose></li>
        </c:forEach>
        <!-- Next Page Button -->
        <li class="page-item ${currentPage eq totalPages ? 'disabled' : ''}">
            <a class="page-link"
               href="/app/product/category?category=${category.uid }&order=${order}&currentPage=${currentPage + 1}"
               aria-label="Next"> <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ol>
    <!-- 마지막 페이지 여부 확인 후 출력 -->
    <c:if test="${currentPage eq totalPages && !hasNextBlock}">
        <div class="page-item disabled"><span class="page-link">마지막 페이지입니다.</span></div>
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

</body>
</html>

<jsp:include page="footer/footer.jsp" flush="false" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/productInfo.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
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
											<li class="colorBtn"><a href="#none"> <span class="colorOption">${detailList.color}</span>
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
											<li class="sizeBtn"><a href="#none"> <span class="sizeOption">${detailList.size}</span>
											</a></li>
										</c:forEach>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 옵션 선택 시 화면에 출력 -->
				<input type="hidden" id="productDetailList" value="${product.price}"/>
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
						<a href="javascript:buyClick()" id="buyBtn" class="btnOption" style="margin-right: 12.5px !important; background: rgb(101, 83, 69);"> 
							<span class="btnSpan" style="color: white !important;">BUY IT NOW</span>
						</a> 
						<a href="javascript:addCart(${product.uid})" id="cartBtn" class="btnOption" style="background: #eae5dd;">
							<span class="btnSpan">ADD TO CART</span>
						</a> 
						<a href="javascript:addWish(${product.uid})" id="wishBtn" class="btnOption" style="background: #eae5dd;">
							<span class="btnSpan">ADD TO WISH</span>
						</a>
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
						<p>${product.desc}</p>
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
		<hr />
		<br />
		<!-- 보기 선택  -->
		<div class="menuChoice">
			<div>
				<span><a href="#productDetail">DETAIL</a></span>
			</div>
			<div>
				<span><a href="#reviewSection">REVIEW</a></span>
			</div>
			<div>
				<span><a href="#guide">GUIDE</a></span>
			</div>
			<div>
				<span><a href="#QnA">Q/A</a></span>
			</div>
		</div>
		<div class="DetailInfo">
			<a name="productDetail"></a>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo01.jpg">
			</div>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo02.jpg">
			</div>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo03.jpg">
			</div>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo04.jpg">
			</div>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo05.jpg">
			</div>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo06.jpg">
			</div>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo07.jpg">
			</div>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo08.jpg">
			</div>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo09.jpg">
			</div>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo10.jpg">
			</div>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo11.jpg">
			</div>
			<div>
				<img alt="이미지" src="/resources/images/product_DetailInfo12.jpg">
			</div>
		</div>
		<!-- 클릭시 클릭한 영역으로 이동 -->
		<div class="menuChoice">
			<div>
				<span><a href="#productDetail">DETAIL</a></span>
			</div>
			<div>
				<span><a href="#reviewSection">REVIEW</a></span>
			</div>
			<div>
				<span><a href="#guide">GUIDE</a></span>
			</div>
			<div>
				<span><a href="#QnA">Q&A</a></span>
			</div>
		</div>
		<hr class="hrCss">
		<!-- GUIDE 영역 -->
		<a name="guide"></a>
		<div class="guideSection">
			<ul>
				<li>
					<h2>상품결제정보</h2>
					<div class="guideText">
						<p>
							고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. <br /> <br /> 무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.<br> 주문 시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.<br>
							<br> A/S 책임자 : 070-7705-5595 슬림베어 고객센터
						</p>
						<p>품질보증기준: 전자상거래 소비자 보호법에 의거하여 소비자 청약철회 가능한 기준에 따름.</p>
						<p>구매자가 미성년자일 경우 법정 대리인이 계약에 동의하지 않을 때 구매를 취소할 수 있습니다.</p>
					</div>
				</li>
				<hr class="hrCss">
				<li>
					<h2>배송정보</h2>
					<div class="guideText">
						<ul>
							<li>배송 방법 : 택배</li>
							<li>배송 지역 : 전국지역</li>
							<li>배송 비용 : 무료</li>
							<li>배송 기간 : 2일 ~ 7일</li>
							<li>배송 안내 : 슬로우앤드는 대한민국 택배 no.1 우체국택배를 이용하여 <br /> 가장 안전하고, 신속하게 배송하여 드립니다 :) <br />
							<br /> 대부분 출고 다음날에 바로 도착하며 (주말 제외) <br />
							<br /> 지역 택배 기사님들의 일정과 기상상황에 따라 변동이 있을 수 있습니다. <br /> 기본 배송 준비일은 입고지연 상품 제외, 2~5일 정도가 소요되고 있습니다. <br />
							<br /> 7만원 이상 결제시 무료배송 혜택이 추가되며 <br /> 최종 주문(결제)금액 기준으로, 쿠폰(상품별 쿠폰)할인금액이 포함됩니다.
							</li>
						</ul>
					</div>
				</li>
				<hr class="hrCss">
				<li style="boder-top: 1px solid red;">
					<h2>교환 및 반품정보</h2>
					<div class="guideText">
						<p>
							[교환/반품 안내] <br /> 물품 수령 후(택배 도착일자 기준) 7일 이내에 [MY PAGE]-[ORDER LIST] 에서 직접 접수 또는 '실시간 문의'로 접수해 주세요. <br /> 사전에 신청해 주신 상품에 한해서만 교환/반품이 가능합니다. 접수 시 슬로우앤드에서 우체국 택배 회수접수를 도와드리고 있습니다.
						</p>
						<p>
							<br>
						</p>
						<p>
							<br>
						</p>
						<p>*패킹하여 보내실 때는 물품 수령시와 동일하게 포장해 주세요.</p>
						<br>
						<p>
							택에 손상이 있는 경우에는 반품과 교환이 모두 불가합니다. <br> 성함,주소,전화번호,보내시는 상품,사유등 반품카드 양식에 맞게 적어 보내주셔야 처리가 가능합니다.
						</p>
						<p>
							<br>
						</p>
						<p>
							<br>
						</p>
						<p>보내시는 주소지 : [04792] 서울특별시 종로구 돈화문로 26 단성사 5층 하우스슬림 종로</p>
						<p>
							<br>
						</p>
						<p>
							<br>
						</p>
						<p>
							<교환반품 불가사항> <br>
							-상품 수령 후 7일 이상 경과된 경우 <br>
							-상품 구매시 교환/환불 불가능이 명시되어 있는경우 <br>
							-사용 흔적(집냄새,향수냄새,체취) / 텍 제거 및 바코드 훼손, 오염이 발견된 상품 
						</p>
						<p>
							-라벨, 태그 등 상품의 포장재 또는 구성품이 훼손된 상품 <br> -수영복, 세일상품
						</p>
						<p>-배송시 생긴 구김, 마감 박음질, 제작과정에서 발생하는 냄새나 초크자국 등 대량생산으로 인해 생긴 사유는 불량으로 간주되지 않습니다.</p>
						<p>
							<br> *불량상품의 재발송 시 왕복배송비는 슬림베어가 부담합니다.
						</p>
					</div>
				</li>
			</ul>
			<hr class="hrCss">
		</div>
		<!-- 클릭시 클릭한 영역으로 이동 -->
		<div class="menuChoice">
			<div>
				<span><a href="#productDetail">DETAIL</a></span>
			</div>
			<div>
				<span><a href="#reviewSection">REVIEW</a></span>
			</div>
			<div>
				<span><a href="#guide">GUIDE</a></span>
			</div>
			<div>
				<span><a href="#QnA">Q/A</a></span>
			</div>
		</div>
		<!-- 리뷰 영역 -->
		<a name="reviewSection"></a>
		<div id="wrapper">
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
				<!-- <hr class="myHrTwo" /> -->
				<c:forEach items="${reviewList}" var="reviewList">
					<div class="review-section">
						<div class="info">
							<div>
								<span>${reviewList.mem_id}</span>
								<div>
									<p>${reviewList.reg_date}</p>
								</div>
							</div>
						    <div id="review-score">
						        <i class="far fa-star"></i>
						        <i class="far fa-star"></i>
						        <i class="far fa-star"></i>
						        <i class="far fa-star"></i>
						        <i class="far fa-star"></i>
						    </div>
							<input type="hidden" id="reviewList" value="${reviewList.score}"/>
						</div>
						<div class="photo-review">
							<a><img alt="상품" src="/resources/images/review_images01.jpg"></a> <a><img alt="상품" src="/resources/images/review_images02.jpg"></a> <a><img alt="상품" src="/resources/images/review_images03.jpg"></a> <a><img alt="상품" src="/resources/images/review_images04.jpg"></a>
							<a><img alt="상품" src="/resources/images/review_images05.jpg"></a>
						</div>
						<div class="review-text">
							<div>${reviewList.content}</div>
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
			</section>
		</div>
		<!-- QnA -->
		<a name="QnA"></a>
		<div class="inquirySection">
			<h1 style="font-size: 16px !important;">Q&A</h1>
			<hr class="myHr" />
			<table>
				<%-- <colgroup>
					<col style="width: 20px;">
					<col style="width: 400px;">
					<col style="width: 150px;">
					<col style="width: 130px;">
				</colgroup> --%>
				<thead>
					<tr>
						<th class="solid2" scope="col" style="width: 80px;">번호</th>
						<th class="solid2" scope="col">제목</th>
						<th class="solid2" scope="col">작성자</th>
						<th class="solid2" scope="col">작성일</th>
						<!-- <th>조회</th> -->
					</tr>
				</thead>
				<c:forEach items="${inquiryList}" var="inquirys">
					<tbody>
						<tr>
							<td class="solid">${inquirys.prod_uid}</td>
							<td class="solid"><div class="clickTitle">${inquirys.title}</div></td>
							<td class="solid">${inquirys.writer_id}</td>
							<td class="solid">${inquirys.reg_date}</td>
						</tr>
						<tr>
							<td class="">
								<div class="inquirysContent">${inquirys.content}</div> 
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<button class="qnaBtn">
				<a href="/app/board/write" class="qnaBtnColor">문의하기</a>
			</button>
		</div>
		<div class="footer">
			<%@ include file="footer/footer.jsp"%>
		</div>
	</div>
</body>
</html>
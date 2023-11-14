<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ</title>
<link rel="stylesheet" type="text/css" href="/resources/css/notice.css" />
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script defer src="js/main.js"></script>
<script src="https://kit.fontawesome.com/09decccad8.js" crossorigin="anonymous"></script>

<script defer src="/resources/js/faq.js"></script>
</head>
<body>
<%@ include file="header/header.jsp"%>
<div id="wrap">
	<div id="container">
		<div id="contents">
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
			<div class="path">
				<span>현재 위치</span>
				<ol>
					<li><a href="#">home</a></li>
					<li title="현재 위치"><strong>community</strong></li>
				</ol>
			</div>
			
			<div class="xans-element- xans-board xans-board-title-3 xans-board-title xans-board-3 titleArea ">
				<h2>FAQ</h2>
				<p class="desc">자주 묻는 질문 안내드립니다♡</p>
			</div>
			
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
			<div class="boardnavi">
				<a href="/app/board/notice" class="navi01"><span>공지사항</span></a> 
				<a href="/app/board/inquiry" class="navi02"><span>문의게시판</span></a>
				<a href="/views/app/review_page.jsp" class="navi04"><span>사용후기</span></a> 
				<a href="/app/board/faq" class="navi05"><span>자주묻는질문</span></a>
			</div>

			<div class="xans-element- xans-board xans-board-listpackage-3 xans-board-listpackage xans-board-3 board ">
				<div class="boardSort">
					<div class="boardnavitxt">
						<a href="/app/board/faq" class="faq01">
							<span>전체보기</span></a> 
						<a href="/app/board/faq?board_no=3&amp;category_no=1" class="faq02">
							<span>상품관련</span></a> 
						<a href="/app/board/faq?board_no=3&amp;category_no=2" class="faq03">
							<span>배송관련</span></a> 
						<a href="/app/board/faq?board_no=3&amp;category_no=3" class="faq04">
							<span>교환/반품관련</span></a> 
						<a href="/app/board/faq?board_no=3&amp;category_no=4" class="faq05">
							<span>기타관련</span></a> 
						<a href="/app/board/faq?board_no=3&amp;category_no=5" class="faq06">
							<span>쇼룸관련</span></a>
					</div>
				</div>
				
				<table border="1" summary="">
					<caption>이용안내 목록</caption>
					
					<tbody class="xans-element- xans-board xans-board-list-3 xans-board-list xans-board-3 center">
					<c:forEach items="${faqs}" var="board">
			            <tr class="xans-record-">
			                <td class="subject" data-cate="${board.question}">
			                    <a href="javascript:void(0);" class="toggle-button">
			                        <b class="toggle-icon">Q</b>
			                        <span>
			                            <c:choose>
			                                <c:when test="${board.type eq 'PRODUCT_R'}">상품관련</c:when>
			                                <c:when test="${board.type eq 'DELIVERY_R'}">배송관련</c:when>
			                                <c:when test="${board.type eq 'CHANGE_R'}">교환/반품관련</c:when>
			                                <c:when test="${board.type eq 'ETC_R'}">기타관련</c:when>
			                                <c:when test="${board.type eq 'SHOWROOM_R'}">쇼룸관련</c:when>
			                                <c:otherwise>전체보기</c:otherwise>
			                            </c:choose>
			                        </span>
			                        ${board.question}
			                        <z class="fold"></z>
			                    </a>
			                </td>
			            </tr>
			            <tr id="content-view" style="display: none;" class>
			                <td colspan="1" class>
			                    <div class="fr-view fr-view-article">
			                        <p class="p-indented">
			                            <span style="font-family: Verdana,Geneva,sans-serif;">${board.answer}</span>
			                        </p>
			                    </div>
			                </td>
			            </tr>
			        </c:forEach>
					
					
						<%-- <c:forEach items="${faqs}" var="board">
				            <tr class="xans-record-">
				                <td class="subject" data-cate="${board.question}">
				                    <a href="javascript:void(0);" class="toggle-button">
				                        <b class="toggle-icon">Q</b>
	 			                        <span>${board.type}</span>
				                        ${board.question}
				                        <z class="fold"></z>
				                    </a>
				                </td>
				            </tr>
				            <tr id="content-view" style="display: none;" class>
				                <td colspan="1" class>
				                    <div class="fr-view fr-view-article">
				                        <p class="p-indented">
				                        <span style="font-family: Verdana,Geneva,sans-serif;">${board.answer}</span></p>
				                    </div>
				                </td>
				            </tr>
				        </c:forEach> --%>
							
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="쇼룸관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1711257','3',this);"><b>Q</b> -->
<!-- 							<span class="">쇼룸관련</span> 결제수단은 어떻게 될까요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1550599','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 업데이트 하자마자 구매했는데 바로배송 가능한가요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="기타관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037464','3',this);"><b>Q</b> -->
<!-- 							<span class="">기타관련</span> 콜센터 전화연결이 안돼요. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="상품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037444','3',this);"><b>Q</b> -->
<!-- 							<span class="">상품관련</span> 신상품 할인 기간을 알고 싶어요. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="교환/반품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037164','3',this);"><b>Q</b> -->
<!-- 							<span class="">교환/반품관련</span> 다른 택배사로 교환/반품 택배를 보내도 되나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="footer/footer.jsp"%>
</div>
</body>
</html>
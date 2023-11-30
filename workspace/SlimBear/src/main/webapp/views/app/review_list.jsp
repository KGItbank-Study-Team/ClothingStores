<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>

<html lang="ko">
<%@ include file="header/header.jsp"%>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="/resources/css/board_list.css">
<!-- 별찍는 css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<script type="text/javascript" src="/resources/js/mypage.js"
	charset="utf-8"></script>
<title>리뷰 관리</title>
</head>

<body class="scroll">
	<div id="wrap">
		<div id="container">
			<div id="contents">
				<div id="myMenu" class="xans-element- xans-myshop xans-myshop-main ">
					<ul>
						<li class="order"><a href="/app/member/myPage/orderList"><span>주문내역</span></a>
						</li>
						<li class="wishlist"><a href="/app/member/myPage/modify"><span>프로필</span></a>
						</li>
						<li class="mileage"><a href="/app/member/myPage/mileage"><span>적립금</span></a>
						</li>
						<li class="coupon "><a href="/app/member/myPage/coupon"><span>쿠폰</span></a>
						</li>
						<li class="wishlist"><a href="/app/member/myPage/wishList"><span>위시리스트</span></a>
						</li>
						<li class="board"><a href="/app/member/myPage/boardList"><span>문의
									관리</span></a></li>
						<li class="board"><a href="/app/member/myPage/reviewList"><span>리뷰
									관리</span></a></li>
						<li class="board"><a href="/app/member/myPage/addr"><span>배송지
									관리</span></a></li>
					</ul>
				</div>

				<div class="titleArea">
					<h2>리뷰 관리</h2>
				</div>

				<div class="xans-element- xans-myshop xans-myshop-boardpackage ">
					<div class="xans-element- xans-myshop xans-myshop-boardlisthead ">
					</div>
					<div
						class="xans-element- xans-myshop xans-myshop-boardlist ec-base-table typeList gBorder gBlank10">
						<table border="1" summary="">
							<caption>게시물 관리 목록</caption>
							<colgroup
								class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
								<col style="width: 100px;">
								<col style="width: auto;">
								<col style="width: 100px;">
								<col style="width: auto;">
								<col style="width: 125px;">
								<col style="width: 150px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">사진</th>
									<th scope="col">제목</th>
									<th scope="col">내용</th>
									<th scope="col">별점</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody class="center">

								<c:forEach var="item" items="${reviewList}" varStatus="loop">
									<tr class="xans-record-">
										<td>${loop.index+1}</td>
										<td class="subject">
											<div class="image-container">
												<img src="/resources/images/product10.gif"
													class="resizable-image">
											</div>
										</td>
										<td>${item.title}</td>
										<td>${item.content}</td>
										<td><c:forEach begin="1" end="5" var="i">
												<c:choose>
													<c:when test="${i <= item.score}">
														<span style="color: gold;">★</span>
													</c:when>
													<c:otherwise>
														<span>☆</span>
													</c:otherwise>
												</c:choose>
											</c:forEach></td>
										<td><fmt:formatDate value="${item.reg_date}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<!-- 게시물이 없을경우 -->
						<p class="message displaynone">게시물이 없습니다.</p>
					</div>
				</div>

				<div
					class="xans-element- xans-myshop xans-myshop-boardlistpaging ec-base-paginate">
					<c:if test="${not empty reviewList}">
						<c:if test="${currentPage > 1}">
							<a href="?page=${currentPage - 1}&perPage=${perPage}"><img
								src="/resources/images/icon_prev2.png"></a>
						</c:if>
						<ol>
							<c:forEach begin="1" end="${totalPages}" var="pageNum">
								<li class="xans-record-"><c:if
										test="${pageNum eq currentPage}">
										<a href="?page=${pageNum}&perPage=${perPage}" class="this"
											style="padding-right: 0px;">${pageNum}</a>
									</c:if> <c:if test="${pageNum ne currentPage}">
										<a href="?page=${pageNum}&perPage=${perPage}">${pageNum}</a>
									</c:if></li>
							</c:forEach>
						</ol>
						<c:if test="${currentPage < totalPages}">
							<a href="?page=${currentPage + 1}&perPage=${perPage}"><img
								src="/resources/images/icon_next2.png"></a>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer/footer.jsp"%>
</body>

</html>
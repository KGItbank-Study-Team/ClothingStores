<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html lang="ko">
<%@ include file="header/header.jsp"%>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="/resources/css/board_list.css">
<script type="text/javascript" src="/resources/js/mypage.js"
	charset="utf-8"></script>
<title>게시글관리</title>
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
					<h2>문의 관리</h2>
				</div>

				<div class="xans-element- xans-myshop xans-myshop-boardpackage ">
					<div class="xans-element- xans-myshop xans-myshop-boardlisthead ">
						<p>
							분류 선택 <select id="board_sort" name="board_sort" onchange="filterRows()">
								<option value="전체보기">전체보기</option>
								<option value="상품문의">상품문의</option>
								<option value="배송문의">배송문의</option>
								<option value="기타문의">기타문의</option>
							</select>
						</p>
					</div>
					<div
						class="xans-element- xans-myshop xans-myshop-boardlist ec-base-table typeList gBorder gBlank10">
						<table border="1" summary="">
							<caption>게시물 관리 목록</caption>
							<colgroup
								class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
								<col style="width: 100px;">
								<col style="width: 135px;">
								<col style="width: auto;">
								<col style="width: 100px;">
								<col style="width: 150px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">분류</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody class="center">

								<c:forEach var="item" items="${boardList}" varStatus="loop">
									<tr class="xans-record- boardGroup-${item.boardGroup}">
										<td>${loop.index+1}</td>
										<td><a href="" class="txtEm"></a>${item.boardGroup}</td>
										<!-- class ="left subject" -->
										<td class="subject"><a
											href="/app/board/inquiry/detail/${item.uid}">${item.boardTitle}</a>
										</td>
										<td>${item.boardWriter}</td>
										<td><span class="txtNum"></span> <fmt:formatDate
												value="${item.boardDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<!-- 게시물이 없을경우 -->
						<p class="message displaynone">게시물이 없습니다.</p>
					</div>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="footer/footer.jsp"%>

</body>

</html>
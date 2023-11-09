<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
// 	request.setAttribute("title", "NOTICE");
// 	ArrayList<String> boards = new ArrayList<String>();
// 		boards.add("NO");
// 		boards.add("CATE");
// 		boards.add("NAME");
// 		boards.add("DATE");
// 		boards.add("HIT");
// 		boards.add("VOTE");
// 		boards.add("POINT");
// 		boards.add("필독");
// 		boards.add("하우스앤드");
// 		boards.add("하우스앤드2");
// 		boards.add("하우스앤드3");	
		
// 		request.setAttribute("boards", boards);
%>
<!-- VO, DAO import -->

<!-- 세션에 저장한 게시글 정보를 추출 ex) BoardVO board = (BoardVO) session.getAttribute("board"); -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/notice.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/xeicon.min.css"> -->
<title>NOTICE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script defer src="/resources/js/notice.js"></script>
</head>

<body>
<%@ include file="header/header.jsp"%>
<div id="wrap">
	<div id="container">
		<div id="contents">
			<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002">
				<!-- 현재 위치 -->
				<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002">
					<div class="path">
						<span>현재 위치</span>
						<ol>
							<li><a href="/">홈</a></li>
							<li><a href="/board/index.html">게시판</a></li>
							<li title="현재 위치"><strong>NOTICE</strong></li>
						</ol>
					</div>
					<div class="titleArea">
						<h2><font color="#555555">${title}</font></h2>
						<p><!-- 부제목 --></p>
					</div>
					<p class="imgArea"></p>
				</div>
				<div class="boardSort">
					<span class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002"></span>
				</div>
				
				<div class="boardnavi">
					<!-- <a href="/_onedesign/html/company.html" class="navi00"><span>ABOUT</span></a> -->
					<a href="/app/board/notice" class="navi01"><span>공지사항</span></a> 
					<a href="/app/board/inquiry" class="navi02"><span>문의게시판</span></a>
					<a href="/views/app/review_page.jsp" class="navi04"><span>사용후기</span></a> 
					<a href="/app/board/faq" class="navi05"><span>자주묻는질문</span></a>
				</div>
				
				<div class="ec-base-table typeList gBorder">
					<table border="1" summary="">
						<caption>게시판 목록</caption>
						<colgroup
							class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
							<col style="width: 100px;" />
							<col style="width: 100px;" class="displaynone" />
							<col style="width: auto;" />
							<col style="width: 130px;" />
							<col style="width: 100px;" class="displaynone" />
							<col style="width: 80px;" class="displaynone" />
							<col style="width: 55px;" class="displaynone" />
							<col style="width: 80px;" class="displaynone" />
						</colgroup>
						<thead
							class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
							<tr style="">
								<th scope="col">NO</th>
								<th scope="col" class="displaynone">CATE</th>
								<th scope="col">TITLE</th>
								<th scope="col">NAME</th>
								<th scope="col" class="displaynone">DATE</th>
								<th scope="col" class="displaynone">HIT</th>
								<th scope="col" class="displaynone">VOTE</th>
								<th scope="col" class="displaynone">POINT</th>
							</tr>
						</thead>
						
						<tbody class="xans-element- xans-board xans-board-notice-1002 xans-board-notice xans-board-1002 center">
							<!-- ArrayList를 반복하면서 테이블 행을 생성합니다 -->
							<c:forEach var="board" items="${boards}">
								 <tr style="background-color: #FFFFFF; color: #555555;" class="xans-record-">
						            <td><i class="xi-check"></i></td>
						            <td class="displaynone"></td>
						            <td class="subject left txtBreak">
						                <strong>
						                    <a href="/article/notice/1/${board.no}/" style="color: #555555;">${board.title}</a>
						                    <span class="txtEm"></span>
						                </strong>
						            </td>
						            <td>${board.name}</td>
<%-- 						          <td class="displaynone"><span class="txtNum">"${board.date}"</span></td> --%>
<%-- 						            <td class="displaynone"><span class="txtNum">"${board.hit}"</span></td> --%>
<%-- 						            <td class="displaynone"><span class="txtNum">"${board.vote}"</span></td> --%>
<!-- 						            <td class="displaynone"> -->
<%-- 						                <img src="//img.echosting.cafe24.com/skin/base/board/ico_point'${board.point}'.gif" --%>
<%-- 						                     alt="'${board.point}'점" /> --%>
<!-- 						            </td> -->
						        </tr>
							</c:forEach>
							
							<!-- 여기에 tbody 내용 추가 -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td><i class="xi-check"></i></td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 								<strong> -->
<!-- 									<a href="/article/notice/1/1724624/" style="color: #555555;">[필독]전품목 무료배송 이벤트 공지사항[10/14~16]</a> -->
<!-- 									<span class="txtEm"></span> -->
<!-- 								</strong> -->
<!-- 								</td> -->
<!-- 								<td>슬림베어_CR</td> -->
<!-- 								<td class="displaynone"><span class="txtNum">2023-10-13</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">2854</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"> -->
<!-- 								<img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td><i class="xi-check"></i></td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"><strong> <a -->
<!-- 										href="/article/notice/1/807415/" style="color: #555555;">♡지그재그 제트결제 운영 정책 공지사항</a>  -->
<!-- 										<span class="txtEm"></span></strong></td> -->
<!-- 								<td>슬림베어</td> -->
<!-- 								<td class="displaynone"><span class="txtNum">2019-12-05</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">23975</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->

						</tbody>
					</table>
					
					<p class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone "></p>
				</div>
				<div class="xans-element- xans-board xans-board-buttonlist-1002 xans-board-buttonlist xans-board-1002 ec-base-button typeBG displaynone ">
					<span class="gRight"> <a
						href="/board/free/write.html?board_no=1"
						class="btnSubmitFix sizeS displaynone">write</a>
					</span>
				</div>
				<div class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
					<a href="?board_no=1&page=1"><img src="/resources/images/icon_prev2.png" /></a>
					<ol>
						<li class="xans-record-">
							<a href="#" class="this">1</a></li>
						<li class="xans-record-">
							<a href="#" class="other">2</a></li>
					</ol>
					<a href="?board_no=1&page=2"><img src="/resources/images/icon_next2.png" /></a>
				</div>
				<form id="boardSearchForm" name="" action="/board/notice/1"
					method="get" target="_top" enctype="multipart/form-data">
					<input id="board_no" name="board_no" value="1" type="hidden" />
					<input id="page" name="page" value="1" type="hidden" />
					<input id="board_sort" name="board_sort" value="" type="hidden" />
					<div
						class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
						<fieldset class="boardSearch">
							<legend>게시물 검색</legend>
							<p>
							<select id="search_date" name="search_date" fw-filter=""
								fw-label="" fw-msg="">
								<option value="week">일주일</option>
								<option value="month">한달</option>
								<option value="month3">세달</option>
								<option value="all">전체</option>
							</select> 
							<select id="search_key" name="search_key" fw-filter=""
								fw-label="" fw-msg="">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="writer_name">글쓴이</option>
								<option value="member_id">아이디</option>
								<option value="nick_name">별명</option>
							</select>
							<input id="searchs" name="searchs" fw-filter="" fw-label=""
								fw-msg="" class="searchs" placeholder="" value=""
								type="text" />
							<a href="#none" class="btnEmFix"
								onclick="BOARD.form_submit('boardSearchForm');">FIND</a>
							</p>
						</fieldset>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="footer/footer.jsp" />
	</div>
</div>
</body>
</html>

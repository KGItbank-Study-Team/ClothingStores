<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- VO, DAO import -->
<!-- 세션에 저장한 게시글 정보를 추출 ex) BoardVO board = (BoardVO) session.getAttribute("board"); -->
<jsp:include page="header/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/slimNotice2.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/xeicon.min.css"> -->
<title>SLIMBEAR</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js">
</script>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div id="contents">
			<div
				class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002">
				<!-- 현재 위치 -->
				<div
					class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002">
					<div class="path">
						<span>현재 위치</span>
						<ol>
							<li><a href="/">홈</a></li>
							<li><a href="/board/index.html">게시판</a></li>
							<li title="현재 위치"><strong>NOTICE</strong></li>
						</ol>
					</div>
					<div class="titleArea">
						<h2>
							<font color="#555555">NOTICE</font>
						</h2>
						<p>
							<!-- 부제목 -->
						</p>
					</div>
					<p class="imgArea"></p>
				</div>
				<div class="boardSort">
					<span
						class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002"></span>
				</div>
				<script>
					$(function() {
						var hrefCate = location.href;

						if (hrefCate.indexOf('/1/') != -1) {
							$('.navi01').addClass("on");
						}
						;

						if (hrefCate.indexOf('company.html') != -1) {
							$('.navi00').addClass("on");
						}
						;

						if (hrefCate.indexOf('/2/') != -1) {
							$('.navi03').addClass("on");
						}
						;

						if (hrefCate.indexOf('/4/') != -1) {
							$('.navi04').addClass("on");
						}
						;

						if (hrefCate.indexOf('/board/index.html') != -1) {
							$('.navi05').addClass("on");
						}
						;
					});
				</script>
				<div class="boardnavi">
					<!-- <a href="/_onedesign/html/company.html" class="navi00"><span>ABOUT</span></a> -->
					<a href="/_onedesign/html/company.html" class="navi00"><span>ABOUT</span></a>
					<a href="/views/app/slimbearNotice.jsp" class="navi01"><span>공지사항</span></a> 
					<a href="/views/app/slimbearInquiry.jsp" class="navi02"><span>문의게시판</span></a>
					<a href="/views/app/review_page_for.jsp" class="navi04"><span>사용후기</span></a> 
					<a href="/views/app/slimbearFAQ.jsp" class="navi05"><span>자주묻는질문</span></a>
				</div>
				<script>
					$(function() {
						var hrefCate = location.href;

						if (hrefCate.indexOf('/board/index.html') != -1) {
							$('.subnavi').css('display', 'block');
						}
						;

						if (hrefCate.indexOf('/6/') != -1) {
							$('.subnavi').css('display', 'block');
							$('.navi02').addClass("on");
							$('.qna01').addClass("on");
						}
						;

						if (hrefCate.indexOf('board_no=6') != -1) {
							$('.subnavi').css('display', 'block');
							$('.navi02').addClass("on");
							$('.qna01').addClass("on");
						}
						;

						if (hrefCate.indexOf('/3001/') != -1) {
							$('.subnavi').css('display', 'block');
							$('.navi02').addClass("on");
							$('.qna02').addClass("on");
						}
						;

						if (hrefCate.indexOf('/101/') != -1) {
							$('.subnavi').css('display', 'block');
							$('.navi02').addClass("on");
							$('.qna03').addClass("on");
						}
						;

						if (hrefCate.indexOf('/5/') != -1) {
							$('.subnavi').css('display', 'block');
							$('.navi02').addClass("on");
							$('.qna04').addClass("on");
						}
						;

						if (hrefCate.indexOf('/13/') != -1) {
							$('.subnavi').css('display', 'block');
							$('.navi02').addClass("on");
							$('.qna06').addClass("on");
						}
						;
					});
				</script>
				<!-- 나머지 코드들... -->
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
								<!-- <th scope="col" class="displaynone">CATE</th> -->
								<th scope="col">TITLE</th>
								<th scope="col">NAME</th>
								<th scope="col" class="displaynone">DATE</th>
								<!-- <th scope="col" class="displaynone">HIT</th>
								<th scope="col" class="displaynone">VOTE</th>
								<th scope="col" class="displaynone">POINT</th> -->
							</tr>
						</thead>
						<tbody
							class="xans-element- xans-board xans-board-notice-1002 xans-board-notice xans-board-1002 center">
							<!-- 여기에 tbody 내용 추가 -->
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td><i class="xi-check"></i></td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak">
								<strong>
									<a href="/article/notice/1/1724624/" style="color: #555555;">[필독]전품목 무료배송 이벤트 공지사항[10/14~16]</a>
									<span class="txtEm"></span>
								</strong>
								</td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2023-10-13</span></td>
								<td class="displaynone"><span class="txtNum">2854</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone">
								<img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td><i class="xi-check"></i></td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><strong> <a
										href="/article/notice/1/1711077/" style="color: #555555;">[하우스앤드]11월의 쇼룸리스트</a> 
										<span class="txtEm"></span></strong></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2023-07-10</span></td>
								<td class="displaynone"><span class="txtNum">14568</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td><i class="xi-check"></i></td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><strong> <a
										href="/article/notice/1/1183995/" style="color: #555555;">♡슬림베어 멤버십 회원등급</a> 
										<span class="txtEm"></span></strong></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2021-01-27</span></td>
								<td class="displaynone"><span class="txtNum">51946</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td><i class="xi-check"></i></td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><strong> <a
										href="/article/notice/1/1037438/" style="color: #555555;">♡소재별 세탁 관리 방법</a>
										<span class="txtEm"></span></strong></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2020-08-11</span></td>
								<td class="displaynone"><span class="txtNum">16139</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td><i class="xi-check"></i></td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><strong> <a
										href="/article/notice/1/1037437/" style="color: #555555;">♡배송 후 교환/반품 공지사항</a>
										<span class="txtEm"></span></strong></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2020-08-11</span></td>
								<td class="displaynone"><span class="txtNum">35895</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td><i class="xi-check"></i></td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><strong> <a
										href="/article/notice/1/1037435/" style="color: #555555;">♡배송 전 변경/취소 공지사항</a> 
										<span class="txtEm"></span></strong></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2020-08-11</span></td>
								<td class="displaynone"><span class="txtNum">21367</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td><i class="xi-check"></i></td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><strong> <a
										href="/article/notice/1/807415/" style="color: #555555;">♡지그재그 제트결제 운영 정책 공지사항</a> 
										<span class="txtEm"></span></strong></td>
								<td>슬림베어</td>
								<td class="displaynone"><span class="txtNum">2019-12-05</span></td>
								<td class="displaynone"><span class="txtNum">23975</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td><i class="xi-check"></i></td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><strong> <a
										href="/article/notice/1/243812/" style="color: #555555;">♡불량 사유 구별 방법</a>
										<span class="txtEm"></span></strong></td>
								<td>슬림베어</td>
								<td class="displaynone"><span class="txtNum">2018-06-22</span></td>
								<td class="displaynone"><span class="txtNum">25195</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
						</tbody>
						<tbody
							class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
							<!-- 나머지 tbody 내용 추가 -->
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>16</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/1724089/" style="color: #555555;">[당첨자발표] #LENTO. ALL-day light middle bag 리뷰 EVENT</a>
									<span class="txtEm"></span>
								</td>
								<td>슬림베어_NA</td>
								<td class="displaynone"><span class="txtNum">2023-10-11</span></td>
								<td class="displaynone"><span class="txtNum">578</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>15</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/1696688/" style="color: #555555;">2023년 04월 27일 이전 개인정보 처리방침</a>
									<span class="txtEm"></span></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2023-04-27</span></td>
								<td class="displaynone"><span class="txtNum">8478</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>14</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/1696349/" style="color: #555555;">2022 적립금 소멸 안내</a> 
									<span class="txtEm"></span></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2023-04-25</span></td>
								<td class="displaynone"><span class="txtNum">8109</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>13</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/1531225/" style="color: #555555;">지그재그에서 조회되는 배송연기 알림에 관한 공지</a>
									<span class="txtEm"></span></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2022-05-24</span></td>
								<td class="displaynone"><span class="txtNum">12591</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>12</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/1449334/" style="color: #555555;">2022년 02월 07일 이전 개인정보 처리방침</a> 
									<span class="txtEm"></span></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2022-01-21</span></td>
								<td class="displaynone"><span class="txtNum">10973</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>11</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/1293411/" style="color: #555555;">안전구매를 위한 본인인증 서비스 개정</a>
									<span class="txtEm"></span></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2021-06-08</span></td>
								<td class="displaynone"><span class="txtNum">10119</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>10</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/1182953/" style="color: #555555;">슬림베어 교환/반품 카드</a>
									<span class="txtEm"></span></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2021-01-26</span></td>
								<td class="displaynone"><span class="txtNum">14144</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>9</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/1116121/" style="color: #555555;">슬림베어 적립금/예치금 제도 개정</a> 
									<span class="txtEm"></span></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2020-11-03</span></td>
								<td class="displaynone"><span class="txtNum">16062</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>8</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/1078898/" style="color: #555555;">2020년 09월 28일 이전 개인정보 처리방침</a>
										<span class="txtEm"></span></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2020-09-28</span></td>
								<td class="displaynone"><span class="txtNum">10993</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>7</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/1052849/" style="color: #555555;">산업안전보건법에 의한 고객응대근로자 보호조치</a>
									<span class="txtEm"></span></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2020-09-01</span></td>
								<td class="displaynone"><span class="txtNum">10980</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>6</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/1030456/" style="color: #555555;">2020년 07월 30일 이전 개인정보 처리방침</a>
									<span class="txtEm"></span></td>
								<td>슬림베어_CR</td>
								<td class="displaynone"><span class="txtNum">2020-07-30</span></td>
								<td class="displaynone"><span class="txtNum">11476</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>5</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/291374/" style="color: #555555;">REVIEW 공지사항</a> 
									<span class="txtEm"></span></td>
								<td>슬림베어</td>
								<td class="displaynone"><span class="txtNum">2018-09-11</span></td>
								<td class="displaynone"><span class="txtNum">37792</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>4</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/169877/" style="color: #555555;">포장지 훼손에 대한 공지사항 입니다.</a> <span class="txtEm">
									</span></td>
								<td>슬림베어</td>
								<td class="displaynone"><span class="txtNum">2018-02-02</span></td>
								<td class="displaynone"><span class="txtNum">22366</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>3</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/105618/" style="color: #555555;">카카오톡 알림톡 서비스 OPEN</a> 
									<span class="txtEm"></span></td>
								<td>슬림베어</td>
								<td class="displaynone"><span class="txtNum">2017-09-13</span></td>
								<td class="displaynone"><span class="txtNum">13251</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td>2</td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak"><a
									href="/article/notice/1/71930/" style="color: #555555;">상세 주소지 누락 관련 안내</a> 
									<span class="txtEm"></span></td>
								<td>슬림베어</td>
								<td class="displaynone"><span class="txtNum">2017-06-22</span></td>
								<td class="displaynone"><span class="txtNum">11878</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone"><img
									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
						</tbody>
					</table>
					<p
						class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone ">
					</p>
				</div>
				<div
					class="xans-element- xans-board xans-board-buttonlist-1002 xans-board-buttonlist xans-board-1002 ec-base-button typeBG displaynone ">
					<span class="gRight"> <a
						href="/board/free/write.html?board_no=1"
						class="btnSubmitFix sizeS displaynone">write</a>
					</span>
				</div>
				<div
					class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
					<a href="?board_no=1&page=1"><img src="/resources/images/icon_prev2.png" /></a>
					<ol>
						<li class="xans-record-"><a href="?board_no=1&page=1"
							class="this">1</a></li>
						<li class="xans-record-"><a href="?board_no=1&page=2"
							class="other">2</a></li>
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
			<jsp:include page="footer/footer.jsp" />
			<!-- 관리자 전용 메뉴 -->
			<!-- // 관리자 전용 메뉴 -->
		</div>
	</div>
</div>
</body>
</html>

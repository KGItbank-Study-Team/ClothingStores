<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setAttribute("title", "INQUIRY");
	ArrayList<String> boards = new ArrayList<String>();
	boards.add("필독");
	boards.add("하우스앤드");
	boards.add("하우스앤드2");
	boards.add("하우스앤드3");
	boards.add("하우스앤드4");
	boards.add("하우스앤드5하우스앤드5하우스앤드5");	
	
	request.setAttribute("boards", boards);
%>
<jsp:include page="header/header2.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/slimNotice2.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<!-- <link rel="stylesheet" type="text/css" href="resources/css/xeicon.min.css"> -->
<title>SLIMBEAR</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div id="contents">
			<div
				class="xans-element- xans-board xans-board-listpackage-4 xans-board-listpackage xans-board-4 ">
				<div
					class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
					<div class="path">
						<span>현재 위치</span>
						<ol>
							<li><a href="/">홈</a></li>
							<li><a href="/board/index.html">게시판</a></li>
							<li title="현재 위치"><strong>상품문의</strong></li>
						</ol>
					</div>
					<div class="titleArea">
						<h2>
							<font color="333333">상품문의</font>
						</h2>
						<p></p>
					</div>
					<p class="imgArea"></p>
				</div>
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
				<div class="boardnavi">
					<a href="/views/app/slimbearNotice.jsp" class="navi01"><span>공지사항</span></a> 
					<a href="/views/app/slimbearInquiry.jsp" class="navi02"><span>문의게시판</span></a>
					<a href="/views/app/review_page_for.jsp" class="navi04"><span>사용후기</span></a> 
					<a href="/views/app/slimbearFAQ.jsp" class="navi05"><span>자주묻는질문</span></a>
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
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
				<div class="subnavi" style="display: block;">
					<a href="/board/qa/6/" class="qna01"><span>상품문의</span></a> <a
						href="/board/%EB%B0%B0%EC%86%A1-%EB%AC%B8%EC%9D%98/3001/"
						class="qna02"><span>배송문의</span></a> <a
						href="/board/%EB%B0%B0%EC%86%A1-%EC%A0%84-%EB%B3%80%EA%B2%BD%EC%B7%A8%EC%86%8C/101/"
						class="qna03"><span>배송 전 변경/취소</span></a>
					<!-- <a href="/board/배송-후-교환반품/5/" class="qna04"><span>배송 후 교환/반품</span></a> -->
					<!-- <a href="/board/입금결제-확인/14/" class="qna05"><span>입금/결제 확인</span></a> -->
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

						/*
						if(hrefCate.indexOf('/14/')!=-1){
						    $('.subnavi').css('display','block');
						    $('.navi02').addClass("on");
						    $('.qna05').addClass("on");
						};
						 */

						if (hrefCate.indexOf('/13/') != -1) {
							$('.subnavi').css('display', 'block');
							$('.navi02').addClass("on");
							$('.qna06').addClass("on");
						}
						;
					});
				</script>
				<!-- <div class="one_tab">
					<ul module="Layout_BoardInfo">
						<li><a href=""></a></li>
						<li><a href=""></a></li>
					</ul>	
				</div> -->
				
				<div class="boardSort">
					<span
						class="xans-element- xans-board xans-board-replysort-4 xans-board-replysort xans-board-4 "></span>
				</div>
				<div class="ec-base-table typeList gBorder">
					<table border="1" summary="">
						<caption>상품 게시판 목록</caption>
						<colgroup
							class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
							<col style="width: 80px;" />
							<col style="width: 130px;" class="displaynone" />
							<col style="width: auto;" />
							<col style="width: 120px;" />
							<col style="width: 100px;" class="" />
							<col style="width: 80px;" class="displaynone" />
							<col style="width: 55px;" class="displaynone" />
							<col style="width: 80px;" class="displaynone" />
						</colgroup>
						<thead
							class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
							<tr style="">
								<th scope="col">NO</th>
								<th scope="col" class="displaynone">CATE</th>
								<th scope="col">TITLE</th>
								<th scope="col">NAME</th>
								<th scope="col" class="">DATE</th>
								<th scope="col" class="displaynone">HIT</th>
								<th scope="col" class="displaynone">VOTE</th>
								<th scope="col" class="displaynone">POINT</th>
							</tr>
						</thead>
						
						<tbody class="xans-element- xans-board xans-board-notice-4 xans-board-notice xans-board-4 center">
						
							<c:forEach items="${boards}" var="board">
						      <tr style="background-color: #FFFFFF; color: #555555;" class="xans-record-">
						        <td><i class="xi-check"></i></td>
						        <td class="displaynone"></td>
						        <td class="subject left txtBreak">
						          <span class="displaynone">
						            <a href="#none" onclick="BOARD.viewTarget('${board}','6',this);">
						              <img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기" />
						            </a>
						          </span>
						          <strong>
						            <a href="/article/상품문의/6/${board}/" style="color: #555555;">${board}</a>
						            <img src="/resources/images/icon_hit.gif" alt="HIT" class="ec-common-rwd-image" />
						            <span class="txtEm"></span>
						          </strong>
						        </td>
						        <td>${board}</td>
						        <td class=""><span class="txtNum">${board}</span></td>
						        <td class="displaynone"><span class="txtNum">${board}</span></td>
						        <td class="displaynone"><span class="txtNum">${board}</span></td>
						        <td class="displaynone">
						          <img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점" />
						        </td>
						      </tr>
						    </c:forEach>
							
							
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td><i class="xi-check"></i></td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak">
								<span class="displaynone">
								<a href="#none" onclick="BOARD.viewTarget('1684189','6',this);">
								<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" 
									alt="내용 보기" /></a>
								</span> 
								<strong> 
									<a href="/article/상품문의/6/1684189/"
										style="color: #555555;">[공지] 배송 후 교환/반품 게시판 이용 종료 안내</a>
									<img src="/resources/images/icon_hit.gif" alt="HIT"
										class="ec-common-rwd-image" />
									<span class="txtEm"></span>
								</strong>
								</td>
								<td>슬림베어_CR</td>
								<td class=""><span class="txtNum">2023-03-10 10:15:33</span></td>
								<td class="displaynone"><span class="txtNum">11372</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone">
								<img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
							<tr style="background-color: #FFFFFF; color: #555555;"
								class="xans-record-">
								<td><i class="xi-check"></i></td>
								<td class="displaynone"></td>
								<td class="subject left txtBreak">
								<span class="displaynone"> 
									<a href="#none" onclick="BOARD.viewTarget('1052853','6',this);">
										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif"
											alt="내용 보기" />
									</a>
								</span> 
								<strong>
								<a href="/article/상품문의/6/1052853/"
									style="color: #555555;">[공지] 산업안전보건법에 의한 고객응대근로자 보호조치</a>
								<img src="/resources/images/icon_hit.gif" alt="HIT"
									class="ec-common-rwd-image" /><span class="txtEm"></span></strong></td>
									
								<td>슬림베어_CR</td>
								<td class=""><span class="txtNum">2020-09-01 14:03:53</span></td>
								<td class="displaynone"><span class="txtNum">11715</span></td>
								<td class="displaynone"><span class="txtNum">0</span></td>
								<td class="displaynone">
								<img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
									alt="0점" /></td>
							</tr>
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td><i class="xi-check"></i></td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 								<span class="displaynone"> <a href="#none" -->
<!-- 									onclick="BOARD.viewTarget('807434','6',this);"> -->
<!-- 									<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" -->
<!-- 										alt="내용 보기" /></a> -->
<!-- 								</span>  -->
<!-- 								<strong> -->
<!-- 								<a href="/article/상품문의/6/807434/" -->
<!-- 									style="color: #555555;">[공지] 지그재그 제트결제 운영 정책 공지사항(02/23개정)</a> -->
<!-- 								<img src="/resources/images/icon_hit.gif" alt="HIT" -->
<!-- 									class="ec-common-rwd-image" /><span class="txtEm"></span> -->
<!-- 								</strong></td> -->
<!-- 								<td>슬림베어</td> -->
<!-- 								<td class=""><span class="txtNum">2019-12-05 17:23:49</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">14850</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td><i class="xi-check"></i></td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 								<span class="displaynone"> -->
<!-- 									<a href="#none" onclick="BOARD.viewTarget('113923','6',this);"> -->
<!-- 										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" -->
<!-- 										alt="내용 보기" /> -->
<!-- 									</a> -->
<!-- 								</span> -->
<!-- 								 <strong> -->
<!-- 									 <a href="/article/상품문의/6/113923/" -->
<!-- 										style="color: #555555;">[공지] 배송 전[취소/변경/추가/주소지변경]문의는 "배송전 변경/취소" 게시판에 남겨주세요.</a> -->
<!-- 									<img src="/resources/images/icon_hit.gif" alt="HIT" -->
<!-- 										class="ec-common-rwd-image" /><span class="txtEm"></span> -->
<!-- 								</strong> -->
<!-- 								</td> -->
<!-- 								<td>슬림베어</td> -->
<!-- 								<td class=""><span class="txtNum">2017-09-29 12:40:50</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">44876</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 						</tbody> -->
<!-- 						<tbody -->
<!-- 							class="xans-element- xans-board xans-board-list-4 xans-board-list xans-board-4 center"> -->
<!-- 							
<!-- 			                $product_name_cut = 30 -->
<!-- 			                $login_page_url = /member/login.html -->
<!-- 			                $deny_access_url = /index.html -->
<!-- 			            	--> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td>485848</td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 									<span class="displaynone">  -->
<!-- 										<a href="#none" onclick="BOARD.viewTarget('1728308','6',this);"> -->
<!-- 										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기" /></a> -->
<!-- 									</span>  -->
<!-- 									<a href="/article/상품문의/6/1728308/" style="color: #555555;">상품 문의합니다 ♡</a>  -->
<!-- 									<img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image" /> -->
<!-- 									<img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image" /> -->
<!-- 									<span class="txtEm"></span> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<img src="https://cafe24img.poxo.com/anne2173/web/bbs_member_icon/member/1681260536.jpg" />서****</td> -->
<!-- 								<td class=""><span class="txtNum">2023-11-02 09:08:29</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td>485847</td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 									<span class="displaynone">  -->
<!-- 										<a href="#none" onclick="BOARD.viewTarget('1728305','6',this);"> -->
<!-- 										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기" /></a> -->
<!-- 									</span>  -->
<!-- 									<a href="/article/상품문의/6/1728305/" style="color: #555555;">상품 문의합니다 ♡</a> -->
<!-- 									<img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image" /> -->
<!-- 									<img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image" /> -->
<!-- 									<span class="txtEm"></span> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<img src="https://cafe24img.poxo.com/anne2173/web/bbs_member_icon/member/1681260536.jpg" />김****</td> -->
<!-- 								<td class=""><span class="txtNum">2023-11-02 09:00:16</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td>485846</td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 									<span class="displaynone">  -->
<!-- 										<a href="#none" onclick="BOARD.viewTarget('1728292','6',this);"> -->
<!-- 										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기" /></a> -->
<!-- 									</span> -->
<!-- 									<a href="/article/상품문의/6/1728292/" style="color: #555555;">상품 문의합니다 ♡</a>  -->
<!-- 									<img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image" /> -->
<!-- 									<img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image" /> -->
<!-- 									<span class="txtEm"></span></td> -->
<!-- 								<td> -->
<!-- 									<img src="https://cafe24img.poxo.com/anne2173/web/bbs_member_icon/member/1681260626.jpg" />김****</td> -->
<!-- 								<td class=""><span class="txtNum">2023-11-02 04:21:56</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td>485845</td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 									<span class="displaynone">  -->
<!-- 										<a href="#none" onclick="BOARD.viewTarget('1728286','6',this);"> -->
<!-- 										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기" /></a> -->
<!-- 									</span> -->
<!-- 									<a href="/article/상품문의/6/1728286/" style="color: #555555;">상품 문의합니다 ♡</a> -->
<!-- 									<img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image" /> -->
<!-- 									<img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image" /><span class="txtEm"></span></td> -->
<!-- 								<td><img -->
<!-- 									src="https://cafe24img.poxo.com/anne2173/web/bbs_member_icon/member/1681260536.jpg" />이****</td> -->
<!-- 								<td class=""><span class="txtNum">2023-11-02 00:49:11</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">1</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td>485844</td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 									<span class="displaynone"> -->
<!-- 										<a href="#none" onclick="BOARD.viewTarget('1728280','6',this);"> -->
<!-- 										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기" /></a> -->
<!-- 									</span>  -->
<!-- 									<a href="/article/상품문의/6/1728280/" style="color: #555555;">상품 문의합니다 ♡</a> -->
<!-- 									<img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image" /> -->
<!-- 									<img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image" /> -->
<!-- 									<span class="txtEm"></span> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<img src="https://cafe24img.poxo.com/anne2173/web/bbs_member_icon/member/1681260536.jpg" />김****</td> -->
<!-- 								<td class=""><span class="txtNum">2023-11-01 23:49:31</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">1</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td>485843</td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 									<span class="displaynone">  -->
<!-- 										<a href="#none" onclick="BOARD.viewTarget('1728275','6',this);"> -->
<!-- 										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기" /></a> -->
<!-- 									</span> <a href="/article/상품문의/6/1728275/" style="color: #555555;">상품 문의합니다 ♡</a>  -->
<!-- 									<img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image" /> -->
<!-- 									<img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image" /><span class="txtEm"></span></td> -->
<!-- 								<td> -->
<!-- 									<img src="https://cafe24img.poxo.com/anne2173/web/bbs_member_icon/member/1681260592.jpg" />박****</td> -->
<!-- 								<td class=""><span class="txtNum">2023-11-01 22:47:59</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td>485842</td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 									<span class="displaynone">  -->
<!-- 										<a href="#none" onclick="BOARD.viewTarget('1728271','6',this);"> -->
<!-- 										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기" /></a> -->
<!-- 									</span> <a href="/article/상품문의/6/1728271/" style="color: #555555;">상품 문의합니다 ♡</a> -->
<!-- 									<img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image" /> -->
<!-- 									<img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image" /><span class="txtEm"></span> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<img src="https://cafe24img.poxo.com/anne2173/web/bbs_member_icon/member/1681260536.jpg" />이****</td> -->
<!-- 								<td class=""><span class="txtNum">2023-11-01 21:20:35</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td>485841</td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 									<span class="displaynone">  -->
<!-- 										<a href="#none" onclick="BOARD.viewTarget('1728266','6',this);"> -->
<!-- 										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기" /></a> -->
<!-- 									</span> <a href="/article/상품문의/6/1728266/" style="color: #555555;">상품 문의합니다 ♡</a> -->
<!-- 									<img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image" /> -->
<!-- 									<img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image" /><span class="txtEm"></span> -->
<!-- 								</td> -->
<!-- 								<td><img -->
<!-- 									src="https://cafe24img.poxo.com/anne2173/web/bbs_member_icon/member/1681260536.jpg" />최****</td> -->
<!-- 								<td class=""><span class="txtNum">2023-11-01 20:00:02</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td>485840</td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 									<span class="displaynone"> -->
<!-- 										<a href="#none" onclick="BOARD.viewTarget('1728265','6',this);"> -->
<!-- 										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기" /></a> -->
<!-- 									</span> <a href="/article/상품문의/6/1728265/" style="color: #555555;">상품 문의합니다 ♡</a> -->
<!-- 									<img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image" /> -->
<!-- 									<img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image" /><span class="txtEm"></span> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<img src="https://cafe24img.poxo.com/anne2173/web/bbs_member_icon/member/1681260592.jpg" />박****</td> -->
<!-- 								<td class=""><span class="txtNum">2023-11-01 20:00:01</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">1</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr style="background-color: #FFFFFF; color: #555555;" -->
<!-- 								class="xans-record-"> -->
<!-- 								<td>485839</td> -->
<!-- 								<td class="displaynone"></td> -->
<!-- 								<td class="subject left txtBreak"> -->
<!-- 									<span class="displaynone"> -->
<!-- 										<a href="#none" onclick="BOARD.viewTarget('1728263','6',this);"> -->
<!-- 										<img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기" /></a> -->
<!-- 									</span> <a href="/article/상품문의/6/1728263/" style="color: #555555;">상품 문의합니다 ♡</a> -->
<!-- 									<img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image" /> -->
<!-- 									<img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image" /><span class="txtEm"></span> -->
<!-- 								</td> -->
<!-- 								<td><img -->
<!-- 									src="https://cafe24img.poxo.com/anne2173/web/bbs_member_icon/member/1681260743.jpg" />고****</td> -->
<!-- 								<td class=""><span class="txtNum">2023-11-01 -->
<!-- 										19:43:46</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><span class="txtNum">0</span></td> -->
<!-- 								<td class="displaynone"><img -->
<!-- 									src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" -->
<!-- 									alt="0점" /></td> -->
<!-- 							</tr> -->
						</tbody>
					</table>
					<p
						class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 message displaynone "></p>
				</div>
				<div
					class="xans-element- xans-board xans-board-buttonlist-4 xans-board-buttonlist xans-board-4  ec-base-button typeBG ">
					<span class="gRight"> <a
						href="/board/product/write.html?board_no=6"
						class="btnSubmitFix sizeS ">WRITE</a>
					</span>
				</div>
			</div>

			<div
				class="xans-element- xans-board xans-board-paging-4 xans-board-paging xans-board-4 ec-base-paginate">
				<a href="?board_no=6&page=1"><img src="/resources/images/icon_prev2.png" /></a>
				<ol>
					<li class="xans-record-"><a href="?board_no=6&page=1"
						class="this">1</a></li>
					<li class="xans-record-"><a href="?board_no=6&page=2"
						class="other">2</a></li>
					<li class="xans-record-"><a href="?board_no=6&page=3"
						class="other">3</a></li>
					<li class="xans-record-"><a href="?board_no=6&page=4"
						class="other">4</a></li>
					<li class="xans-record-"><a href="?board_no=6&page=5"
						class="other">5</a></li>
					<li class="xans-record-"><a href="?board_no=6&page=6"
						class="other">6</a></li>
					<li class="xans-record-"><a href="?board_no=6&page=7"
						class="other">7</a></li>
					<li class="xans-record-"><a href="?board_no=6&page=8"
						class="other">8</a></li>
					<li class="xans-record-"><a href="?board_no=6&page=9"
						class="other">9</a></li>
					<li class="xans-record-"><a href="?board_no=6&page=10"
						class="other">10</a></li>
				</ol>
				<a href="?board_no=6&page=2"><img src="/resources/images/icon_next2.png" /></a>
			</div>

			<form id="boardSearchForm" name="" action="/board/qa/6" method="get"
				target="_top" enctype="multipart/form-data">
				<input id="board_no" name="board_no" value="6" type="hidden" /> <input
					id="page" name="page" value="1" type="hidden" /> <input
					id="board_sort" name="board_sort" value="" type="hidden" />
				<div
					class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 ">
					<fieldset class="boardSearch">
						<legend>게시물 검색</legend>
						<p class="category displaynone"></p>
						<p>
							<select id="search_date" name="search_date" fw-filter=""
								fw-label="" fw-msg="">
								<option value="week">일주일</option>
								<option value="month">한달</option>
								<option value="month3">세달</option>
								<option value="all">전체</option>
							</select> <select id="search_key" name="search_key" fw-filter=""
								fw-label="" fw-msg="">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="writer_name">글쓴이</option>
								<option value="member_id">아이디</option>
								<option value="nick_name">별명</option>
								<option value="product">상품정보</option>
							</select> <input id="searchs" name="searchs" fw-filter="" fw-label=""
								fw-msg="" class="searchs" placeholder="" value=""
								type="text" /> <a href="#none" class="btnEmFix"
								onclick="BOARD.form_submit('boardSearchForm');">FIND</a>
						</p>
					</fieldset>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer/footer.jsp" />
</div>
</body>
</html>
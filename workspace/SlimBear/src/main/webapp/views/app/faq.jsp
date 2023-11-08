<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setAttribute("title", "FAQ");
	ArrayList<String> boards = new ArrayList<String>();
	boards.add("필독");
	boards.add("하우스앤드");
	boards.add("하우스앤드2");
	boards.add("하우스앤드3");
	
	request.setAttribute("boards", boards);
%>
<jsp:include page="header/header.jsp" />

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
<div id="wrap">
	<div id="container">
		<div id="contents">
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
			<div class="path">
				<span>현재 위치</span>
				<ol>
					<li><a href="/">home</a></li>
					<li title="현재 위치"><strong>community</strong></li>
				</ol>
			</div>

			<div
				class="xans-element- xans-board xans-board-title-3 xans-board-title xans-board-3 titleArea ">
				<h2>${title}</h2>
				<p class="desc">자주 묻는 질문 안내드립니다♡</p>
			</div>

			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
			<div class="boardnavi">
				<a href="/views/app/notice.jsp" class="navi01"><span>공지사항</span></a> 
				<a href="/views/app/inquiry.jsp" class="navi02"><span>문의게시판</span></a>
				<a href="/views/app/review_page.jsp" class="navi04"><span>사용후기</span></a> 
				<a href="/views/app/faq.jsp" class="navi05"><span>자주묻는질문</span></a>
			</div>
			<script>
				
			</script>

			<div
				class="xans-element- xans-board xans-board-listpackage-3 xans-board-listpackage xans-board-3 board ">
				<div class="boardSort">
					<!-- span module="board_category_3"></span -->
					<div class="boardnavitxt">
						<a href="/board/index.html" class="faq01"><span>전체보기</span></a> <a
							href="/board/index.html?board_no=3&amp;category_no=1"
							class="faq02"><span>상품관련</span></a> <a
							href="/board/index.html?board_no=3&amp;category_no=2"
							class="faq03"><span>배송관련</span></a> <a
							href="/board/index.html?board_no=3&amp;category_no=3"
							class="faq04"><span>교환/반품관련</span></a> <a
							href="/board/index.html?board_no=3&amp;category_no=4"
							class="faq05"><span>기타관련</span></a> <a
							href="/board/index.html?board_no=3&amp;category_no=5"
							class="faq06"><span>쇼룸관련</span></a>
					</div>
				</div>
				
				<table border="1" summary="">
					<caption>이용안내 목록</caption>
					<tbody class="xans-element- xans-board xans-board-list-3 xans-board-list xans-board-3 center">
					
					<c:forEach items="${boards}" var="board">
			            <tr class="xans-record-">
			                <td class="subject" data-cate="${board}">
			                    <a href="javascript:void(0);" class="toggle-button">
			                        <b class="toggle-icon">Q</b>
			                        <span>${board}</span>
			                        ${board}
			                        <z class="fold"></z>
			                    </a>
			                </td>
			            </tr>
			            <tr id="content-view" style="display: none;" class>
			                <td colspan="1" class>
			                    <div class="fr-view fr-view-article">
			                        <p class="p-indented"><span style="font-family: Verdana,Geneva,sans-serif;">${board}&nbsp;</span></p>
			                        <p class="p-indented"><span style="font-family: Verdana,Geneva,sans-serif;"><strong>${board}&nbsp;</strong></span></p>
			                        <p class="p-indented"><span style="font-family: Verdana,Geneva,sans-serif;">${board}&nbsp;</span></p>
			                    </div>
			                </td>
			            </tr>
			        </c:forEach>
					
<%-- 							<c:forEach items="${boards}" var="board"> --%>
<!-- 								<tr class="xans-record-"> -->
<%-- 									<td class="subject" data-cate="${board}"> --%>
<!-- 										<a href="#none" onclick="BOARD.viewTarget('1711257', '3', this);"> -->
<!-- 											<b>Q</b> -->
<%-- 											<span class>${board}</span> --%>
<%-- 											${board} --%>
<!-- 											<z class="fold"></z> -->
<!-- 										</a> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr id="content_view" class> -->
<!-- 									<td colspan="1" class> -->
<!-- 										<div class="fr-view fr-view-article"> -->
<%-- 											<p><span style="font-family: Verdana,Geneva,sans-serif;">${board}&nbsp;</span></p> --%>
<%-- 											<p><span style="font-family: Verdana,Geneva,sans-serif;"><strong>${board}&nbsp;</strong></span></p> --%>
<%-- 											<p><span style="font-family: Verdana,Geneva,sans-serif;">${board}&nbsp;</span></p> --%>
<!-- 										</div> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
							
							
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="쇼룸관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1711257','3',this);"><b>Q</b> -->
<!-- 							<span class="">쇼룸관련</span> 결제수단은 어떻게 될까요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="쇼룸관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1711244','3',this);"><b>Q</b> -->
<!-- 							<span class="">쇼룸관련</span> 환불 규정이 궁금합니다. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="쇼룸관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1711242','3',this);"><b>Q</b> -->
<!-- 							<span class="">쇼룸관련</span> 상품을 구매했는데 불량이에요. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="쇼룸관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1711235','3',this);"><b>Q</b> -->
<!-- 							<span class="">쇼룸관련</span> 하우스앤드 제품 교환/반품이 가능할까요? <i class="fold"></i></a> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="쇼룸관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1711233','3',this);"><b>Q</b> -->
<!-- 							<span class="">쇼룸관련</span> 재고 현황 확인이 가능할까요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="쇼룸관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1711184','3',this);"><b>Q</b> -->
<!-- 							<span class="">쇼룸관련</span> 온라인 주문 후 매장에서 픽업이 가능한가요? <i class="fold"></i></a> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="쇼룸관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1711182','3',this);"><b>Q</b> -->
<!-- 							<span class="">쇼룸관련</span> 쇼룸에는 어떤 상품이 있나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="쇼룸관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1711179','3',this);"><b>Q</b> -->
<!-- 							<span class="">쇼룸관련</span> 하우스앤드 구매 시 온라인 회원 적용이 안되나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="쇼룸관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1711178','3',this);"><b>Q</b> -->
<!-- 							<span class="">쇼룸관련</span> 주차는 가능한가요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="쇼룸관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1711177','3',this);"><b>Q</b> -->
<!-- 							<span class="">쇼룸관련</span> 운영시간이 어떻게 되나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1550599','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 업데이트 하자마자 구매했는데 바로배송 가능한가요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1052369','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 도서산간지역은 배송비가 얼마인가요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1038955','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 부분 배송 가능한가요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037472','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 주문한 상품이 배송 시 누락됐어요. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="기타관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037464','3',this);"><b>Q</b> -->
<!-- 							<span class="">기타관련</span> 콜센터 전화연결이 안돼요. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="기타관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037461','3',this);"><b>Q</b> -->
<!-- 							<span class="">기타관련</span> 주문 후 언제까지 입금해야 하나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037457','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 구매한 상품 입고 날짜를 알고싶어요. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="상품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037444','3',this);"><b>Q</b> -->
<!-- 							<span class="">상품관련</span> 신상품 할인 기간을 알고 싶어요. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="상품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037443','3',this);"><b>Q</b> -->
<!-- 							<span class="">상품관련</span> 신상품은 언제 업데이트되나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="기타관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037424','3',this);"><b>Q</b> -->
<!-- 							<span class="">기타관련</span> 리뷰글을 작성했는데 적립금 지급이 안되었어요. <i class="fold"></i></a> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="기타관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037416','3',this);"><b>Q</b> -->
<!-- 							<span class="">기타관련</span> 해외 배송 가능한가요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="기타관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037360','3',this);"><b>Q</b> -->
<!-- 							<span class="">기타관련</span> 환불 관련 자주 하시는 질문 <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="기타관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037177','3',this);"><b>Q</b> -->
<!-- 							<span class="">기타관련</span> 입금했는데 입금확인이 안돼요. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="기타관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037171','3',this);"><b>Q</b> -->
<!-- 							<span class="">기타관련</span> 예치금/적립금 안내 <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="기타관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037166','3',this);"><b>Q</b> -->
<!-- 							<span class="">기타관련</span> 현금영수증 신청은 어떻게 하나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="교환/반품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037165','3',this);"><b>Q</b> -->
<!-- 							<span class="">교환/반품관련</span> 휴대폰결제로 주문했는데 취소/반품이 가능한가요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="교환/반품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037164','3',this);"><b>Q</b> -->
<!-- 							<span class="">교환/반품관련</span> 다른 택배사로 교환/반품 택배를 보내도 되나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="교환/반품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037162','3',this);"><b>Q</b> -->
<!-- 							<span class="">교환/반품관련</span> 상품을 보냈는데 환불처리는 언제 되나요? <i class="fold"></i></a> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="교환/반품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037159','3',this);"><b>Q</b> -->
<!-- 							<span class="">교환/반품관련</span> 교환/반품처리가 어려운 경우가 있나요? <i class="fold"></i></a> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="교환/반품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037157','3',this);"><b>Q</b> -->
<!-- 							<span class="">교환/반품관련</span> 상품을 받아봤는데 오배송/불량상품이 왔어요. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="교환/반품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037155','3',this);"><b>Q</b> -->
<!-- 							<span class="">교환/반품관련</span> 교환/반품 시 배송비는 어떻게 하나요? <i class="fold"></i></a> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037153','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 배송전에 상품을 변경/추가 하고 싶어요. <i class="fold"></i></a> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037150','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 주문을 취소하고 싶어요. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037133','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 배송전 주소지를 변경하고 싶어요. <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037131','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 따로 주문했는데 합배송으로 받을 수 있나요? <i class="fold"></i></a> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037128','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 당일발송 구매했는데 언제 배송되나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037125','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 무료배송 조건은 어떻게 되나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="상품관련" -->
<!-- 							><a ref="#none" onclick="BOARD.viewTarget('1037123','3',this);"><b>Q</b> -->
<!-- 							<span class="">상품관련</span> 굿바이특가 / 라스트찬스 <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="상품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037122','3',this);"><b>Q</b> -->
<!-- 							<span class="">상품관련</span> 옷을 받았는데 세탁은 어떻게 하나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="교환/반품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037054','3',this);"><b>Q</b> -->
<!-- 							<span class="">교환/반품관련</span> 교환/반품 접수는 어떻게 하나요? <i class="fold"></i></a> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="배송관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037041','3',this);"><b>Q</b> -->
<!-- 							<span class="">배송관련</span> 배송은 얼마나 걸리나요? <i class="fold"></i></a></td> -->
<!-- 						</tr> -->
<!-- 						<tr class="xans-record-"> -->
<!-- 							<td class="subject" data-cate="상품관련"> -->
<!-- 							<a ref="#none" onclick="BOARD.viewTarget('1037022','3',this);"><b>Q</b> -->
<!-- 							<span class="">상품관련</span> 품절된 상품은 재입고 안되나요? <i class="fold"></i></a></td> -->
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/notice.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xicons@2.0.2/xicons.min.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/xeicon.min.css"> -->
<title>슬림베어</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script defer src="/resources/js/inquiry.js"></script>
<%
    String categoryNoParam = request.getParameter("category_no");
    String categoryNo = (categoryNoParam != null) ? categoryNoParam : "PRODUCT";
%>
</head>
<body>
<jsp:include page="header/header.jsp" />
<div id="wrap">
	<div id="container">
		<div id="contents">
			<div class="xans-element- xans-board xans-board-listpackage-4 xans-board-listpackage xans-board-4 ">
				<div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
					<div class="path">
						<span>현재 위치</span>
						<ol>
							<li><a href="/">홈</a></li>
							<li><a href="/board/index.html">게시판</a></li>
							<li title="현재 위치"><strong>상품문의</strong></li>
						</ol>
					</div>
					
					<div class="titleArea">
                        <h2 id="inquiryH2">
                            <font color="333333">문의사항</font>
                        </h2>
                        <p id="inquiryP"></p>
                    </div>
					
					<p class="imgArea"></p>
				</div>
				
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
				<div class="boardnavi">
					<a href="/app/board/notice" class="navi01"><span>공지사항</span></a> 
					<a href="/app/board/inquiry" class="navi02"><span>문의게시판</span></a>
					<a href="/app/board/faq" class="navi05"><span>자주묻는질문</span></a>
				</div>
				
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
				<div class="subnavi" style="display: block;">
					<a href="/app/board/inquiry" class="qna01">
						<span>상품문의</span></a>
					<a href="/app/board/inquiry?category_no=DELIVERY" class="qna02">
						<span>배송문의</span></a>
					<a href="/app/board/inquiry?category_no=DELIVERY_C" class="qna03" >
						<span>기타문의</span></a>
				</div>
				
				<div class="boardSort">
					<span class="xans-element- xans-board xans-board-replysort-4 xans-board-replysort xans-board-4 "></span>
				</div>
				<div class="ec-base-table typeList gBorder">
					<table border="1" summary="">
						<caption>상품 게시판 목록</caption>
						<colgroup class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
							<col style="width: 80px;" />
							<col style="width: 130px;" class="displaynone" />
							<col style="width: auto;" />
							<col style="width: 120px;" />
							<col style="width: 100px;" class="" />
							<col style="width: 80px;" class="displaynone" />
							<col style="width: 55px;" class="displaynone" />
							<col style="width: 80px;" class="displaynone" />
						</colgroup>
						<thead class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
							<tr style="">
								<th scope="col">NO</th>
								<th scope="col">TITLE</th>
								<th scope="col">NAME</th>
								<th scope="col" class="">DATE</th>
							</tr>
						</thead>
						
						<!-- 문의게시글 목록 -->
						<tbody class="xans-element- xans-board xans-board-notice-4 xans-board-notice xans-board-4 center">
						    <c:set var="pageSize" value="10" />
							<c:set var="totalInquiries" value="${inquiries.size()}" />
							<c:set var="startIndex" value="${totalInquiryCount - (currentPage - 1) * pageSize}" />
						    
						    <c:if test="${startIndex < 1}">
						        <c:set var="startIndex" value="${totalInquiries}" />
						    </c:if>
						
						    <c:forEach items="${inquiries}" var="board" varStatus="loop">
						        <tr style="background-color: #FFFFFF; color: #555555;" class="xans-record-">
						            <td>${startIndex - loop.index}</td>
						            
						            
						            <td class="displaynone"></td>
						            <td class="subject left txtBreak">
						                <strong>
						                    <a href="/app/board/inquiry/detail/${board.uid}" style="color: #555555;">${board.title}</a>
						                    <!-- 비밀글인 경우에만 아이콘 표시 -->
						                    <c:if test="${board.secure eq '1'}">
						                        <img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image"/>
						                    </c:if>
						                    <span class="txtEm"></span>
						                </strong>
						            </td>
						            <td>${board.writer_id}</td>
						            <td><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd"/></td>
						        </tr>
						        <!-- 답변 목록 출력 -->
						        <c:if test="${not empty board.answers}">
						            <c:forEach items="${board.answers}" var="answer">
						                <tr style="background-color: #FFFFFF; color: #555555;" class="xans-record-">
						                    <td></td>
						                    <td class="displaynone"></td>
						                    <td class="subject left txtBreak">
						                        <strong>
						                            <!-- 답변의 링크는 원래의 문의게시글 링크로 -->
						                            <a href="/app/board/inquiry/detail/${board.uid}" style="color: #555555;">${answer.title}</a>
						                            <c:if test="${board.secure eq '1'}">
								                        <img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image"/>
								                    </c:if>
						                            <span class="txtEm"></span>
						                        </strong>
						                    </td>
						                    <td>${answer.mem_id}</td>
						                    <td><fmt:formatDate value="${answer.reg_date}" pattern="yyyy-MM-dd"/></td>
						                </tr>
						            </c:forEach>
						        </c:if>
						    </c:forEach>
						</tbody>
					</table>
					<p class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 message displaynone "></p>
				</div>
				
				<sec:authorize access="isAuthenticated()">
					<div class="xans-element- xans-board xans-board-buttonlist-4 xans-board-buttonlist xans-board-4  ec-base-button typeBG ">
						<span class="gRight"> 
							<a href="/app/board/write" class="btnSubmitFix sizeS ">WRITE</a>
						</span>
					</div>
				</sec:authorize>
			</div>
			
			
			<!-- 페이지 수 계산 -->
			<div class="xans-element- xans-product xans-product-normalpaging ec-base-paginate">
				<ol>
					<!-- Previous Page Button -->
					<li class="page-item ${currentPage eq 1 ? 'disabled' : ''}">
						<a class="page-link" href="/app/board/inquiry?category_no=${categoryNo}&currentPage=${currentPage - 1}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a>
					</li>
					<!-- Page Number Buttons -->
					<c:forEach begin="${startPage}" end="${endPage}" var="pageNumber">
					    <li class="xans-record-">
					        <c:choose>
					            <c:when test="${pageNumber eq currentPage}">
					                <!-- 현재 페이지인 경우 active-page 클래스를 추가하여 스타일을 적용 -->
					                <a href="/app/board/inquiry?category_no=${categoryNo}&currentPage=${pageNumber}" class="this">${pageNumber}</a>
					            </c:when>
					            <c:otherwise>
					                <!-- 현재 페이지가 아닌 경우 일반적인 스타일을 적용 -->
					                <a href="/app/board/inquiry?category_no=${categoryNo}&currentPage=${pageNumber}" class="other">${pageNumber}</a>
					            </c:otherwise>
					        </c:choose>
					    </li>
					</c:forEach>

					<!-- Next Page Button -->
					<li class="page-item ${currentPage eq totalPages ? 'disabled' : ''}">
						<a class="page-link"
						href="/app/board/inquiry?category_no=${categoryNo}&currentPage=${currentPage + 1}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a>
					</li>
				</ol>
				<!-- 마지막 페이지 여부 확인 후 출력 -->
				<c:if test="${currentPage eq totalPages && !hasNextBlock}">
					<li class="page-item disabled">
					<span class="page-link">마지막 페이지입니다.</span></li>
				</c:if>
			</div>
			
			<!-- 검색기능 -->
			<form id="boardSearchForm" name="" action="/app/board/inquiryS" method="get" target="_top" enctype="multipart/form-data">
				<div class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 ">
					<fieldset class="boardSearch">
						<legend>게시물 검색</legend>
						<p class="category displaynone"></p>
						<p><select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer_id">글쓴이</option>
								<option value="prod_uid">상품정보</option>
							</select>
							<input id="searchs" name="searchs" fw-filter="" fw-label="" fw-msg="" class="searchs" placeholder="" value="" type="text" /> 
							<button type="submit" class="btnEmFix">FIND</button>
						</p>
					</fieldset>
				</div>
			</form>
			<p><br></p>
			<p><br></p>
			<p><br></p>
			<p><br></p>
		</div>
	</div>
	<jsp:include page="footer/footer.jsp" />
</div>

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
</script>
<script>
    $(document).ready(function() {
        // 현재 카테고리에 해당하는 메뉴 활성화
        $(".subnavi a.qna01").removeClass("on");
        $(".subnavi a.qna02").removeClass("on");
        $(".subnavi a.qna03").removeClass("on");

        var categoryNo = "<%= categoryNo %>";
        if (categoryNo === "DELIVERY") {
            $(".subnavi a.qna02").addClass("on");
        } else if (categoryNo === "DELIVERY_C") {
            $(".subnavi a.qna03").addClass("on");
        } else {
            $(".subnavi a.qna01").addClass("on");
        }
    });
</script>
</body>
</html>
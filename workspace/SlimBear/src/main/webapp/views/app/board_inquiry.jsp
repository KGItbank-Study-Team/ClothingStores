<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/notice.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script defer src="js/main.js"></script>
<script src="https://kit.fontawesome.com/09decccad8.js" crossorigin="anonymous"></script>
<script defer src="/resources/js/boards.js"></script>
<title>BOARD INQUIRY</title>
</head>

<body>
<jsp:include page="header/header.jsp" />
<div id="wrap">
<div id="container">
	<div id="contents">
		<div
			class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 ">
			<div
				class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
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
						<font color="#555555">INQUIRY</font>
					</h2>
					<p></p>
				</div>
			</div>
			<form id="BoardDelForm" name="" action="/exec/front/Board/del/1"
				method="post" target="_self" enctype="multipart/form-data">
				<input id="no" name="no" value="1724624" type="hidden" />
				<!-- Add more input fields here if needed -->
				<input id="bulletin_no" name="bulletin_no" value="900281" type="hidden" />
				<input id="board_no" name="board_no" value="1" type="hidden" />
					<input id="member_id" name="member_id" value="slowmastercr" type="hidden" />
					<input id="list_url" name="list_url" value="/board/free/list.html?board_no=1" type="hidden" />
					<input id="bdf_modify_url" name="bdf_modify_url" value="/board/free/modify.html?board_act=edit&amp;no=1724624&amp;board_no=1" type="hidden" />
					<input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/1" type="hidden" />
					<input id="bdf_action_type" name="bdf_action_type" value="" type="hidden" />
				<div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">
					<div class="ec-base-table typeWrite ">
						<table border="1" summary="">
							<caption>게시판 상세</caption>
							<colgroup>
								<col style="width: 130px;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">TITLE</th>
									<td>${inquiries.title}</td>
								</tr>
								<tr>
									<th scope="row">NAME</th>
									<td>${inquiries.writer_id}</td>
								</tr>
								<tr class="row">
									<th scope="row">DATE</th>
									<td><fmt:formatDate value="${inquiries.reg_date}" pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<td colspan="2" class="bon">
										<div class="detail">
											<div class="fr-view fr-view-article">
												<p><br></p>
												<p style="margin: 0px; padding: 0px; display: block; line-height: 2.2 !important; text-align: center;">
													${inquiries.content}</p>
												<p><br></p>
											</div>
										</div>
									</td>
								</tr>
								<tr class="attach displaynone">
									<th scope="row">FILE</th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="ec-base-button ">
						<span class="gLeft">
							<a href="/app/board/inquiry" class="btnNormalFix sizeS">LIST</a>
						</span> 
						<span class="gRight">
						<c:set var="isAuthor" value="false" />
							<c:if test="${pageContext.request.userPrincipal != null}">
								<!-- 사용자가 인증되었는지 확인 -->
								<c:set var="isAuthor" value="${inquiries.writer_id eq pageContext.request.userPrincipal.name}" />
							</c:if> 
							<c:choose>
								<c:when test="${isAuthor}">
									<a href="/app/board/inquiry/detail/delete/${inquiries.uid}" onclick="return confirm('게시글을 삭제하시겠습니까?');"
										class="btnNormalFix sizeS">DELETE</a>
									<a href="/app/board/inquiry/detail/update/${inquiries.uid}"
										class="btnEmFix sizeS">EDIT</a>
								</c:when>
							</c:choose>
						</span>
						<p><br></p>
						<p><br></p>
						<p><br></p>
						<span class="gLeft"> 
						<c:forEach var="answer" items="${inquiries.answers}">
							<div class="fr-view fr-view-article">
								<div class="ec-base-table typeWrite ">
									<table border="1" summary="">
										<caption>게시판 상세</caption>
										<colgroup>
											<col style="width: 130px;" />
											<col style="width: auto;" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">TITLE</th>
												<td>${answer.title}</td>
											</tr>
											<tr>
												<th scope="row">NAME</th>
												<td>${answer.mem_id}</td>
											</tr>
											<tr class="row">
												<th scope="row">DATE</th>
												<td><fmt:formatDate value="${answer.reg_date}" pattern="yyyy-MM-dd" /></td>
											</tr>
											
											<%-- <tr>
												<td colspan="2" class="bon">
													<div class="detail">
														<div class="fr-view fr-view-article">
															<p><br></p>
															<p style="margin: 0px; padding: 0px; display: block; line-height: 2.2 !important; text-align: center;">
																${answer.content}</p>
															<p>
																<br>
															</p>
														</div>
													</div>
												</td>
											</tr> --%>
											<c:if test="${not empty inquiries.answers}">
										    <c:forEach var="answer" items="${inquiries.answers}">
										        <c:choose>
										            <c:when test="${inquiries.secure eq 0 or currentUser.id eq inquiries.writer_id}">
										                <!-- 
										                    inquiries의 secure가 0이거나
										                    answer의 작성자와 현재 사용자의 ID가 같은 경우에만 보여줌 
										                -->
										                <tr>
										                    <td colspan="2" class="bon">
										                        <div class="detail">
										                            <div class="fr-view fr-view-article">
										                                <p><br></p>
										                                <p style="margin: 0px; padding: 0px; display: block; line-height: 2.2 !important; text-align: center;">
										                                    ${answer.content}
										                                </p>
										                                <p>
										                                    <br>
										                                </p>
										                            </div>
										                        </div>
										                    </td>
										                </tr>
										            </c:when>
										            <c:otherwise>
										                <!-- 그 외의 경우에는 inquiries의 content를 보여줌 -->
										                <tr>
										                    <td colspan="2" class="bon">
										                        <div class="detail">
										                            <div class="fr-view fr-view-article">
										                                <p><br></p>
										                                <p style="margin: 0px; padding: 0px; display: block; line-height: 2.2 !important; text-align: center;">
										                                    ${inquiries.content}
										                                </p>
										                                <p><br></p>
										                            </div>
										                        </div>
										                    </td>
										                </tr>
										            </c:otherwise>
										        </c:choose>
										    </c:forEach>
										</c:if>

											
											<%-- <c:if test="${not empty inquiries.answers}">
										    <c:forEach var="answer" items="${inquiries.answers}">
										        <c:choose>
										            <c:when test="${inquiries.secure ne 1}">
										                <!-- inquiries의 secure가 1이 아닌 경우에만 보여줌 -->
										                <tr>
										                    <td colspan="2" class="bon">
										                        <div class="detail">
										                            <div class="fr-view fr-view-article">
										                                <p><br></p>
										                                <p style="margin: 0px; padding: 0px; display: block; line-height: 2.2 !important; text-align: center;">
										                                    ${answer.content}</p>
										                                <p>
										                                    <br>
										                                </p>
										                            </div>
										                        </div>
										                    </td>
										                </tr>
										            </c:when>
										            <c:otherwise>
										                <!-- inquiries의 secure가 1인 경우에는 안 보여줌 -->
										                <tr>
										                    <td colspan="2" class="bon">
										                        <div class="detail">
										                            <div class="fr-view fr-view-article">
										                                <p><br></p>
										               					 <p style="margin: 0px; padding: 0px; display: block; line-height: 2.2 !important; text-align: center;">
										                                    ${inquiries.content}</p>
										                                <p><br></p>
										                            </div>
										                        </div>
										                    </td>
										                </tr>
										            </c:otherwise>
										        </c:choose>
										    </c:forEach>
											</c:if> --%>
											
											
											
											<tr class="attach displaynone">
												<th scope="row">FILE</th>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</c:forEach>
						</span>
					</div>
				</div>
			</form>
		</div>
	</div>
<jsp:include page="footer/footer.jsp" />
</div>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/notice.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<title>BOARD WRITE</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script defer src="/resources/js/board_write.js"></script>
</head>
<body id="main">
<jsp:include page="header/header.jsp" />
<div id="wrap">
	<div id="container">
		<div id="contents">
			<div class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 ">
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
						<h2>
							<font color="333333">상품문의</font>
						</h2>
						<p></p>
					</div>
				</div>
				
<!-- 				<form id="boardWriteForm" name="boardWriteForm" action="/board/write" method="post" target="_self" enctype="multipart/form-data"> -->
				<form id="boardWriteForm" action="/app/board/inquiry/detail/update/${inquiries.uid}" method="post" enctype="multipart/form-data">
					
					<input id="fix_add_content" name="fix_add_content" value="" type="hidden" />
					<input id="type" name="type" value="" type="hidden" />
				    <input id="reg_date" name="reg_date" type="hidden" />
				    <input id="writer_id" name="writer_id" type="hidden" />
						
						
					<div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
					<div class="ec-base-box typeProduct displaynone ">
						<p class="thumbnail">
							<a href="">
							<img id="iPrdImg"
								src="https://cafe24img.poxo.com/anne2173/web/product/tiny/"
								onerror="this.src='//img.echosting.cafe24.com/thumb/75x75.gif'"
								alt="" />
							</a>
						</p>
						<div class="information">
							<span id="sPrdCommonImg"></span>
							<h3>
								<a href="/product/detail.html?product_no=0" id="aPrdNameLink"><span
									id="sPrdName"></span></a>
							</h3>
							<p class="price">
								<span id="sPrdPrice"></span> 
								<span id="sPrdTaxText"></span>
							</p>
							<p class="button">
								<span id="iPrdView" class="displaynone"><a
									href="/product/detail.html?product_no=0" id="aPrdLink"
									class="btnEm" target="_blank">상품상세보기</a></span>
								<span
									class="displaynone"><a href="#none" class="btnNormal"
									onclick="BOARD_WRITE.product_popup('/product/search_board_list.html')">상품정보선택</a></span>
								<span class="displaynone"><a href="#none"
									class="btnNormal"
									onclick="BOARD_WRITE.product_popup('/order/search_board_list.html')">주문상품선택</a></span>
							</p>
						</div>
					</div>
					
					<div class="ec-base-table typeWrite ">
						<table border="1" summary="">
							<caption>글쓰기 폼</caption>
							<colgroup>
								<col style="width: 130px;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">TITLE</th>
									<td>
<!-- 									<select id="subject" name="subject" fw-filter="isFill" fw-label="제목" fw-msg=""> -->
									<select id="subject" name="title" th:field="*{title}">
										<option value="상품 문의합니다 ♡">상품 문의합니다 ♡</option>
										<option value="배송 문의합니다 ♡">배송 문의합니다 ♡</option>
										<option value="불량/오배송 문의합니다 ♡">불량/오배송 문의합니다 ♡</option>
									</select>
									</td>
								</tr>
								<tr class="displaynone">
									<th scope="row">NAME</th>
									<td></td>
								</tr>
								<tr class="displaynone">
									<th scope="row">E-MAIL</th>
									<td></td>
								</tr>
								<tr class="displaynone">
									<th scope="row">VOTE</th>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" class="clear">
									
										<!-- CSS -->
										<link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css?vs=2311171259">
            							<link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/css/themes/ec_froala.css?vs=2311171259">
										
										<!-- HTML content--> 
										<textarea style="width: 100%;" name="content" id="content" class="ec-fr-never-be-duplicated">
										${inquiries.content}
										</textarea> 
										<input type="hidden" id="content_hidden" fw-filter="isSimplexEditorFill" fw-label="내용" value="EC_FROALA_INSTANCE" />
										
										<!-- JavaScript --> 
										<script type="text/javascript"
											src="//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2310251253"></script>
										<script type="text/javascript"
											src="//img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js?vs=2310251253"></script>
										<script type="text/javascript"
											src="//img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js?vs=2310251253"></script>
										
									</td>
								</tr>
								<tr class="ucc">
									<th scope="row">UCC</th>
									<td><input id="ucc" name="ucc" size="35" fw-filter=""
										fw-label="UCC URL" value="" type="text" /></td>
								</tr>
							</tbody>
							<tbody class="">
								<tr>
									<th scope="row">FILE 1</th>
									<td><input name="attach_file[]" type="file" /></td>
								</tr>
								<tr>
									<th scope="row">FILE 2</th>
									<td><input name="attach_file[]" type="file" /></td>
								</tr>
								<tr>
									<th scope="row">FILE 3</th>
									<td><input name="attach_file[]" type="file" /></td>
								</tr>
								<tr>
									<th scope="row">FILE 4</th>
									<td><input name="attach_file[]" type="file" /></td>
								</tr>
								<tr>
									<th scope="row">FILE 5</th>
									<td><input name="attach_file[]" type="file" /></td>
								</tr>
							</tbody>
							<tbody>
								<tr class="">
									<th scope="row">PASSWORD</th>
									<td><input id="password" name="password" fw-filter=""
											fw-label="비밀번호" fw-msg="" value="" type="password" />
										<span class="displaynone">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</span>
									</td>
								</tr>
								<tr class="">
									<th scope="row">SECRET</th>
									<td><input id="secure0" name="secure" fw-filter="isFill"
										fw-label="비밀글설정" fw-msg="" value="F" type="radio"
										checked="checked" />
									<label for="secure0">공개글</label>
									<input id="secure1" name="secure" fw-filter="isFill"
										fw-label="비밀글설정" fw-msg="" value="T" type="radio" />
									<label for="secure1">비밀글</label></td>
								</tr>
								<tr class="captcha displaynone">
									<th scope="row">보안문자</th>
									<td>
										<p class="gBlank5">
											<span class="ec-base-help txtInfo">
											영문, 숫자 조합을 공백없이 입력하세요(대소문자구분)</span>
										</p>
									</td>
								</tr>
								<tr class="agree displaynone">
									<th scope="row">개인정보 수집 및 <br/>이용 동의</th>
									<td><br/> 개인정보 수집 및 이용에 동의하십니까?</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="ec-base-button ">
						<span class="gLeft">
							<span class="displaynone">
								<a href="#none" class="btnNormal sizeS" onclick="">관리자 답변보기</a>
							</span>
						<a href="/app/board/inquiry/" class="btnNormalFix sizeS">LIST</a>
						</span>
						<span class="gRight">
                            <button type="submit" class="btnSubmitFix sizeS">OK</button>
                            <button type="submit" class="btnBasicFix sizeS">EDIT</button>
<%--                             <a href="/app/board/inquiry/detail/update/${inquiries.uid }" class="btnBasicFix sizeS">edit</a> --%>
<%--                             <a href="/app/board/inquiry/detail/${inquiries.uid}" class="btnBasicFix sizeS">EDIT</a> --%>
                            
                            
                            <a href="/app/board/inquiry/detail/${inquiries.uid}" class="btnBasicFix sizeS">CANCEL</a>
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

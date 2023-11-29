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
							<font color="333333">문의 작성</font>
						</h2>
						<p></p>
					</div>
				</div>
				
				<form id="boardWriteForm" action="/app/board/inquiry" method="post" enctype="multipart/form-data">
					<input id="board_no" name="board_no" value="6" type="hidden" /> 
					<input id="product_no" name="product_no" value="0" type="hidden" /> 
					<input id="move_write_after" name="move_write_after"
						value="/board/product/list.html?board_no=6" type="hidden" /> 
					<input id="cate_no" name="cate_no" value="" type="hidden" /> 
					<input id="bUsePassword" name="bUsePassword" value="" type="hidden" /> 
					<input id="order_id" name="order_id" value="" type="hidden" /> 
					<input id="is_post_checked" name="is_post_checked" value="" type="hidden" />
					<input id="isExceptBoardUseFroalaImg" name="isExceptBoardUseFroalaImg" 
						value="" type="hidden" /> 
					<input id="isGalleryBoard" name="isGalleryBoard" value="" type="hidden" />

				    <input id="8c38aded9ea5c1d7aceb6746dbc" name="8c38aded9ea5c1d7aceb6746dbc"
				           value="31229fd71b38048ee21b09cd695c0ed0" type="hidden" /> 
							
					<input id="fix_title_form_0" name="fix_title_form_0" value="상품 문의합니다 ♡"
							type="hidden" /> 
					<input id="fix_title_form_1" name="fix_title_form_1" value="불량/오배송 문의합니다 ♡" 
							type="hidden" /> 
					<input id="fix_title_form_2" name="fix_title_form_2" value=" 기타 문의합니다 ♡"
							type="hidden" /> 
					<input id="bulletin_type" name="bulletin_type" value="title" type="hidden" /> 
					<input id="fix_content_0" name="fix_content_0"
						value="이곳은 상품문의를 위한 게시판입니다!&lt;br /&gt;
							게시판 성격에 맞지 않는 내용을 문의하실 경우 처리가 불가할 수 있습니다.&lt;br /&gt;
							&lt;br /&gt;
							배송 후 변심 교환/반품의 경우 바로 홈페이지 [MY PAGE]-[ORDER LIST]에서 직접 접수가 가능합니다.&lt;br /&gt;
							불량 문의/오배송의 경우 사진과 함께 이곳에 원하시는 처리 방향 문의하시면 확인 후 안내 도와드리겠습니다.&lt;br /&gt;
							&lt;br /&gt;
							--------------------------------------------------------------&lt;br /&gt;
							"
						type="hidden" /> 
					<input id="fix_content_1" name="fix_content_1"
						value="[문의글 등록 전 확인해 주세요♥]&lt;br /&gt;
							지그재그 결제건은 게시판이 아닌 해당 어플에서&lt;br /&gt;
							교환/반품 신청 부탁드립니다!&lt;br /&gt;
							&lt;br /&gt;
							*변심 교환/반품은 '실시간 문의'로 접수해주시면 &lt;br /&gt;
							빠르게 처리 도와드리겠습니다.&lt;br /&gt;
							&lt;br /&gt;
							---------------------------------------------------------&lt;br /&gt;
							*불량/오배송*&lt;br /&gt;
							&lt;br /&gt;
							▷불량사진&lt;br /&gt;
							(필수 첨부 부탁드립니다!)&lt;br /&gt;
							&lt;br /&gt;
							주문번호 :&lt;br /&gt;
							교환/반품(원하시는 처리 선택해주세요!) :&lt;br /&gt;
							상품명(사이즈,컬러) :&lt;br /&gt;
							불량/오배송 사유 :&lt;br /&gt;
							검수번호(숫자나 알파벳) :&lt;br /&gt;
							(상품 바코드 옆 검수자 숫자 한자리/두자리를 기재합니다.)"
						type="hidden" />
					<input id="fix_content_2" name="fix_content_2"
						value="이곳은 기타문의를 위한 게시판입니다!&lt;br /&gt;
							게시판 성격에 맞지 않는 내용을 문의하실 경우 처리가 불가할 수 있습니다.&lt;br /&gt;
							&lt;br /&gt;
							배송 후 변심 교환/반품의 경우 바로 홈페이지 [MY PAGE]-[ORDER LIST]에서 직접 접수가 가능합니다.&lt;br /&gt;
							불량 문의/오배송의 경우 사진과 함께 이곳에 원하시는 처리 방향 문의하시면 확인 후 안내 도와드리겠습니다.&lt;br /&gt;
							&lt;br /&gt;
							--------------------------------------------------------------"
						type="hidden" />
					<input id="fix_add_content" name="fix_add_content" value="" type="hidden" />
					
<!-- 					<input id="type" name="type" value="" type="hidden" /> -->
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
										<select id="subject" name="type" th:field="*{type}">
											<option value="PRODUCT">상품 문의</option>
											<option value="DELIVERY">배송 문의</option>
											<option value="DELIVERY_C">기타 문의</option>
										</select>
										<textarea style="width: 30%;" name=title id=inquiryTitle class="ec-fr-never-be-duplicated" th:field="*{title}"></textarea>
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
										
										<!-- HTML --> 
										<textarea style="width: 100%;" name="content" id="content" class="ec-fr-never-be-duplicated">
										이곳은 문의 게시판입니다!&lt;br /&gt;
										게시판 성격에 맞지 않는 내용을 문의하실 경우 처리가 불가할 수 있습니다.&lt;br /&gt;
										&lt;br /&gt;
										배송 후 변심 교환/반품의 경우 바로 홈페이지 [MY PAGE]-[ORDER LIST]에서 직접 접수가 가능합니다.&lt;br /&gt;
										불량 문의/오배송의 경우 사진과 함께 이곳에 원하시는 처리 방향 문의하시면 확인 후 안내 도와드리겠습니다.&lt;br /&gt;
										&lt;br /&gt;
										--------------------------------------------------------------&lt;br /&gt;
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
							</tbody>
							<tbody class="">
								<tr>
									<th scope="row">FILE 1</th>
									<td><input name="imageFile" type="file" id="fileInput" onchange="handleFileChange()" /></td>
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
									<th scope="row">SECRET</th>
									<td>
										<input id="secure0" name="secure" fw-filter="isFill"
											fw-label="비밀글설정" fw-msg="" value="0" type="radio" checked="checked" />
										<label for="secure0">공개글</label>
										
										<input id="secure1" name="secure" fw-filter="isFill"
											fw-label="비밀글설정" fw-msg="" value="1" type="radio" />
										<label for="secure1">비밀글</label>
									</td>
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
                            <a href="/app/board/inquiry/" class="btnBasicFix sizeS">CANCEL</a>
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

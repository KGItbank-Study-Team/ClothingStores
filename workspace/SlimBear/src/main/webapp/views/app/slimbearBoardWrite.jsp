<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/slimNotice2.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/xeicon.min.css"> -->
<title>SLIMBEAR</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="/resources/js/boardWrite.js"></script>
<script src="/resources/js/boardEmpty.js"></script>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div id="contents">
			<div
				class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 ">
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
				</div>
				<!-- 
				<div class="one_tab">
					<ul module="Layout_BoardInfo">
						<li><a href=""></a></li>
						<li><a href=""></a></li>
					</ul>	
				</div>
				 -->
				<form id="boardWriteForm" name="" action="/exec/front/Board/write/6"
					method="post" target="_self" enctype="multipart/form-data">
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
						type="hidden" /> <input id="fix_content_2" name="fix_content_2"
						value="이곳은 상품문의를 위한 게시판입니다!&lt;br /&gt;
							게시판 성격에 맞지 않는 내용을 문의하실 경우 처리가 불가할 수 있습니다.&lt;br /&gt;
							&lt;br /&gt;
							배송 후 변심 교환/반품의 경우 바로 홈페이지 [MY PAGE]-[ORDER LIST]에서 직접 접수가 가능합니다.&lt;br /&gt;
							불량 문의/오배송의 경우 사진과 함께 이곳에 원하시는 처리 방향 문의하시면 확인 후 안내 도와드리겠습니다.&lt;br /&gt;
							&lt;br /&gt;
							--------------------------------------------------------------"
						type="hidden" /> <input id="fix_add_content"
						name="fix_add_content" value="" type="hidden" />
					<div
						class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
						<!--
				           $write_success_url = /board/product/list.html
				           $product_select_url = /product/search_board_list.html
				           $order_select_url = /order/search_board_list.html
				           $login_page_url = /member/login.html
				           $deny_access_url = /index.html
				       -->
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
									<select id="subject" name="subject"
										fw-filter="isFill" fw-label="제목" fw-msg="">
										<option value="상품 문의합니다 ♡">상품 문의합니다 ♡</option>
										<option value="불량/오배송 문의합니다 ♡">불량/오배송 문의합니다 ♡</option>
										<option value=" 기타 문의합니다 ♡">기타 문의합니다 ♡</option>
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
										<link rel="stylesheet"
											href="//img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css?vs=2310251253">
										<link rel="stylesheet"
											href="//img.echosting.cafe24.com/editors/froala/css/themes/ec_froala.css?vs=2310251253">

										<!-- HTML --> 
										<textarea style="width: 100%;" name="content"
											id="content" class="ec-fr-never-be-duplicated">
										</textarea> 
										<input type="hidden" id="content_hidden" 
											fw-filter="isSimplexEditorFill" fw-label="내용"
											value="EC_FROALA_INSTANCE" /> <!-- JavaScript --> 
										<script type="text/javascript"
											src="//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2310251253"></script>
										<script type="text/javascript"
											src="//img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js?vs=2310251253"></script>
										<script type="text/javascript"
											src="//img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js?vs=2310251253"></script>

										<!-- Run Froala Script --> 
										<script>
											var EC_FROALA_ID = null;
											// isSimplexEditorFill 체크시에 필요함
											var EC_FROALA_INSTANCE = null;
											// scroll 버그 대응을 위해 필요.
											var fScrollPosition = 0;
											// 다중 이미지 삽입시 생기는 버그 대응
											var iCheckedImageListCount = 0;
											var aCheckedImageList = [];
											var aInsertedImageList = [];
											var isBeforeImageRemove = false;

											(function() {
												var d = "이곳은 상품문의를 위한 게시판입니다!<br />\n게시판 성격에 맞지 않는 내용을 문의하실 경우 처리가 불가할 수 있습니다.<br />\n<br />\n배송 후 변심 교환/반품의 경우 바로 홈페이지 [MY PAGE]-[ORDER LIST]에서 직접 접수가 가능합니다.<br />\n불량 문의/오배송의 경우 사진과 함께 이곳에 원하시는 처리 방향 문의하시면 확인 후 안내 도와드리겠습니다.<br />\n<br />\n--------------------------------------------------------------<br />\n<br>";
												try {
													var o = {
														"key" : "DUA2yF3G1E1A5A2A2pZGCTRSAPJWTLPLZHTQQe1JGZxC4B3A3E2B5A1E1E4I1C2==",
														"toolbarSticky" : false,
														"theme" : "ec-froala",
														"attribution" : false,
														"htmlRemoveTags" : [ "script" ],
														"htmlAllowedEmptyTags" : [ "*" ],
														"iframe" : true,
														"iframeStyle" : ".fr-view{font-size: 12px;}",
														"iframeStyleFiles" : [ "\/\/img.echosting.cafe24.com\/editors\/froala\/css\/froala_style.min.css?vs=2310251253" ],
														"heightMin" : 400,
														"language" : "ko_KR",
														"paragraphFormatSelection" : true,
														"fontFamilySelection" : true,
														"fontSize" : [ "8",
																"9", "10",
																"12", "14",
																"16", "18",
																"20", "22",
																"24", "26",
																"28", "30" ],
														"fontSizeSelection" : true,
														"linkInsertButtons" : [ "linkBack" ],
														"quickInsertButtons" : [
																"ul", "ol",
																"hr" ],
														"codeMirror" : false,
														"entities" : "&#60;&#62;",
														"imageEditButtons" : [
																"imageAlign",
																"imageRemove",
																"|",
																"imageLink",
																"linkOpen",
																"linkEdit",
																"linkRemove",
																"-",
																"imageDisplay",
																"imageStyle",
																"imageAlt",
																"imageSize" ],
														"tableEditButtons" : [],
														"tableInsertHelper" : false,
														"imageDefaultMargin" : 0,
														"imageDefaultWidth" : 0,
														"imageUpload" : false,
														"imageInsertButtons" : [ "imageUpload" ],
														"imageMaxSize" : 5242880,
														"filesManagerMaxSize" : 5242880,
														"toolbarButtons" : {
															"moreText" : {
																"buttons" : [
																		"paragraphFormat",
																		"fontFamily",
																		"fontSize",
																		"bold",
																		"italic",
																		"underline",
																		"strikeThrough",
																		"textColor",
																		"backgroundColor",
																		"subscript",
																		"superscript",
																		"clearFormatting" ],
																"buttonsVisible" : 5
															},
															"moreParagraph" : {
																"buttons" : [
																		"formatOL",
																		"formatUL",
																		"alignLeft",
																		"alignCenter",
																		"alignRight",
																		"outdent",
																		"indent",
																		"alignJustify",
																		"lineHeight" ],
																"buttonsVisible" : 5
															},
															"moreRich" : {
																"buttons" : [
																		"insertTable",
																		"insertLink",
																		"insertHR",
																		"emoticons",
																		"specialCharacters" ],
																"buttonsVisible" : 0
															},
															"moreMisc" : {
																"buttons" : [
																		"undo",
																		"redo",
																		"fullscreen",
																		"html",
																		"print",
																		"spellChecker",
																		"selectAll" ],
																"align" : "right",
																"buttonsVisible" : 2
															}
														},
														"toolbarButtonsSM" : {
															"moreText" : {
																"buttons" : [
																		"paragraphFormat",
																		"fontFamily",
																		"fontSize",
																		"bold",
																		"italic",
																		"underline",
																		"strikeThrough",
																		"textColor",
																		"backgroundColor",
																		"subscript",
																		"superscript",
																		"clearFormatting" ],
																"buttonsVisible" : 4
															},
															"moreParagraph" : {
																"buttons" : [
																		"formatOL",
																		"formatUL",
																		"alignLeft",
																		"alignCenter",
																		"alignRight",
																		"outdent",
																		"indent",
																		"alignJustify",
																		"lineHeight" ],
																"buttonsVisible" : 2
															},
															"moreRich" : {
																"buttons" : [
																		"insertTable",
																		"insertLink",
																		"insertHR",
																		"emoticons",
																		"specialCharacters" ],
																"buttonsVisible" : 0
															},
															"moreMisc" : {
																"buttons" : [
																		"undo",
																		"redo",
																		"fullscreen",
																		"html",
																		"print",
																		"spellChecker",
																		"selectAll" ],
																"align" : "right",
																"buttonsVisible" : 2
															}
														},
														"toolbarButtonsXS" : {
															"moreText" : {
																"buttons" : [
																		"paragraphFormat",
																		"textColor",
																		"backgroundColor",
																		"bold",
																		"italic",
																		"underline",
																		"strikeThrough" ],
																"buttonsVisible" : 1
															},
															"moreParagraph" : {
																"buttons" : [
																		"formatOL",
																		"formatUL",
																		"alignLeft",
																		"alignCenter",
																		"alignRight" ],
																"buttonsVisible" : 0
															},
															"moreRich" : {
																"buttons" : [ "insertLink" ]
															},
															"moreMisc" : {
																"buttons" : [
																		"undo",
																		"redo",
																		"html" ],
																"buttonsVisible" : 0,
																"align" : "right"
															}
														},
														"htmlDoNotWrapTags" : [
																"script",
																"style",
																"meta",
																"link" ],
														"htmlAllowedStyleProps" : [ ".*" ],
														"htmlAllowedTags" : [ ".*" ],
														"htmlAllowedAttrs" : [ ".*" ],
														"fontFamily" : {
															"Dotum,sans-serif" : "Dotum",
															"Gulim,sans-serif" : "Gulim",
															"Batang,sans-serif" : "Batang",
															"Gungsuh,sans-serif" : "Gungsuh",
															"Arial,Helvetica,sans-serif" : "Arial",
															"Tahoma,Geneva,sans-serif" : "Tahoma",
															"Verdana,Geneva,sans-serif" : "Verdana",
															"Fixedsys,sans-serif" : "Fixedsys",
															"'Times New Roman',Times,serif" : "Times New Roman",
															"helvetica,sans-serif" : "Helvetica",
															"sans-serif" : "Sans-serif",
															"palatino,sans-serif" : "Palatino",
															"'Comic Sans MS',sans-serif" : "Comic Sans MS",
															"sand,sans-serif" : "Sand",
															"'Courier New',sans-serif" : "Courier New",
															"courier,sans-serif" : "Courier",
															"monospace,sans-serif" : "Monospace",
															"Georgia,serif" : "Georgia",
															"SimSun,sans-serif" : "SimSun",
															"SimHei,sans-serif" : "SimHei",
															"'MS PGothic',sans-serif" : "MS PGothic",
															"'MS PMincho',sans-serif" : "MS PMincho",
															"'MS UI PGothic',sans-serif" : "MS UI PGothic",
															"Meiryo,sans-serif" : "Meiryo"
														},
														"colorsText" : [
																"#FF0000",
																"#FF6C00",
																"#FFAA00",
																"#FFEF00",
																"#A6CF00",
																"#009E25",
																"#00B0A2",
																"#0075C8",
																"#3A32C3",
																"#7820B9",
																"#EF007C",
																"#000000",
																"#252525",
																"#464646",
																"#636363",
																"#7D7D7D",
																"#9A9A9A",
																"#FFE8E8",
																"#F7E2D2",
																"#F5EDDC",
																"#F5F4E0",
																"#EDF2C2",
																"#DEF7E5",
																"#D9EEEC",
																"#C9E0F0",
																"#D6D4EB",
																"#E7DBED",
																"#F1E2EA",
																"#ACACAC",
																"#C2C2C2",
																"#CCCCCC",
																"#E1E1E1",
																"#EBEBEB",
																"#FFFFFF",
																"#E97D81",
																"#E19B73",
																"#D1B274",
																"#CFCCA2",
																"#61B977",
																"#53AEA8",
																"#518FBB",
																"#6A65BB",
																"#9A54CE",
																"#E573AE",
																"#5A504B",
																"#767B86",
																"#951015",
																"#6E391A",
																"#785C25",
																"#5F5B25",
																"#4C511F",
																"#1C4827",
																"#0D514C",
																"#1B496A",
																"#2B285F",
																"#45245B",
																"#721947",
																"#352E2C",
																"#3C3F45" ],
														"colorsBackground" : [
																"#FF0000",
																"#FF6C00",
																"#FFAA00",
																"#FFEF00",
																"#A6CF00",
																"#009E25",
																"#00B0A2",
																"#0075C8",
																"#3A32C3",
																"#7820B9",
																"#EF007C",
																"#000000",
																"#252525",
																"#464646",
																"#636363",
																"#7D7D7D",
																"#9A9A9A",
																"#FFE8E8",
																"#F7E2D2",
																"#F5EDDC",
																"#F5F4E0",
																"#EDF2C2",
																"#DEF7E5",
																"#D9EEEC",
																"#C9E0F0",
																"#D6D4EB",
																"#E7DBED",
																"#F1E2EA",
																"#ACACAC",
																"#C2C2C2",
																"#CCCCCC",
																"#E1E1E1",
																"#EBEBEB",
																"#FFFFFF",
																"#E97D81",
																"#E19B73",
																"#D1B274",
																"#CFCCA2",
																"#61B977",
																"#53AEA8",
																"#518FBB",
																"#6A65BB",
																"#9A54CE",
																"#E573AE",
																"#5A504B",
																"#767B86",
																"#951015",
																"#6E391A",
																"#785C25",
																"#5F5B25",
																"#4C511F",
																"#1C4827",
																"#0D514C",
																"#1B496A",
																"#2B285F",
																"#45245B",
																"#721947",
																"#352E2C",
																"#3C3F45" ],
														"docId" : "content"
													};
													// IE tableEditbuttons 이슈
													o["tableEditButtons"] = FroalaEditor.DEFAULTS.tableEditButtons
															.filter(function(
																	tableEditButtonName) {
																return tableEditButtonName
																		.indexOf("Style") === -1;
															});

													o["events"] = {
														"filesManager.beforeUpload" : function(
																files) {
															this.opts.filesManagerUploadURL = getConvertUrlBeforeUpload(this.opts.filesManagerUploadURL);
														},
														"image.beforeUpload" : function(
																images) {
															this.opts.imageUploadURL = getConvertUrlBeforeUpload(this.opts.imageUploadURL);
														},

														"image.inserted" : function(
																oImage,
																response) {
															var sInstanceId = "content";
															// 파일업로더로 이미지가 넘어오는경우에는 itslog가 이미 생성된 이미지기때문에 처리하지않음.
															if ((sInstanceId === "product_description" || sInstanceId === "product_description_mobile")
																	&& typeof response !== "undefined") {
																oImage
																		.attr(
																				"data-use_its",
																				true);
															}

															if (iCheckedImageListCount >= 0) {
																iCheckedImageListCount++;
																aInsertedImageList
																		.push(oImage);

																if (aCheckedImageList.length === iCheckedImageListCount
																		|| aCheckedImageList.length === 0) {
																	// 마지막 이미지
																	for (var i = 0; i < aInsertedImageList.length; i++) {
																		aInsertedImageList[i]
																				.after("<br>");
																	}

																	// 리셋
																	iCheckedImageListCount = 0;
																	aCheckedImageList = [];
																	aInsertedImageList = [];
																}
															}
														},
														"image.error" : function(
																error,
																response) {
															if (typeof JSON != "undefined") {
																r = JSON
																		.parse(response);
																alert(r["error"]);
															}
														},
														"image.loaded" : function(
																$img) {
															// IE에서 이미지 로드 후, 커서 위치 재조정
															if (/(trident).+rv[:\s]([\w\.]{1,9}).+like\sgecko/i
																	.test(navigator.userAgent)) {
																var _this = this;
																var _img = $img[0];
																setTimeout(
																		function() {
																			_this.selection
																					.setAfter(_img);
																			_this.selection
																					.restore();
																		},
																		300);
															}
														},
														"filesManager.error" : function(
																error,
																response) {
															if (typeof JSON != "undefined") {
																r = JSON
																		.parse(response);
																alert(r["error"]);
															}
														},
														"commands.before" : function(
																sCommand) {
															// 코드뷰 토글시
															if (sCommand === "html") {
																var sContent = this.el.innerHTML;
																sContent = sContent
																		.replace(
																				/<\/?null>/gi,
																				"");
																this.el.innerHTML = getReplaceZeroWidthSpace(sContent);
																replaceToFroalaNewLine(this);
															}

															// 전체화면 모드 켜기
															if (sCommand === "fullscreen"
																	&& !this.fullscreen
																			.isActive()) {
																this.$box[0]
																		.setAttribute(
																				"data-window-scroll-y",
																				window.scrollY
																						|| window.pageYOffset);
															}
															// 다중 이미지 삽입
															if (sCommand === "insertAll") {
																var popup = this.popups
																		.get("filesManager.insert");
																aCheckedImageList = popup
																		.find(".fr-files-checkbox .fr-file-insert-check:checked")
															}

															if (sCommand === "insertSpecialCharacter") {
																setScrollPosition(
																		this,
																		getIframeCursorPoint(this));
															}
														},
														"commands.after" : function(
																sCommand) {
															if (sCommand === "html") {
																removeFroalaNewLine(this);
															}

															if (sCommand === "insertFiles") {
																var enableButton = document
																		.querySelector(".fr-trim-button.fr-plugins-enable");
																if (enableButton)
																	enableButton
																			.click();
															}

															if (sCommand === "selectAll") {
																this.el
																		.focus();
															}

															// 전체 화면 토글시에 컨텐츠 높이를 정상적으로 반영하지못하는 이슈 대응
															if (sCommand === "fullscreen") {
																var _this = this;
																setTimeout(
																		function() {
																			_this.size
																					.syncIframe();
																		},
																		300);

																if (this.fullscreen
																		.isActive() === false) {
																	window
																			.scrollTo(
																					0,
																					this.$box[0]
																							.getAttribute("data-window-scroll-y"));
																}
															}

															if (sCommand === "insertSpecialCharacter") {
																this.$wp
																		.get(0).scrollTop = fScrollPosition;
															}
														},
														"focus" : function() {
															if (this.iframe_document) {
																var iframeHeight = this.iframe_document.body.scrollHeight;
																this.$iframe[0].style.height = iframeHeight
																		+ "px";
															}

															this.el.innerHTML = getReplaceZeroWidthSpace(this.el.innerHTML);
														},

														"image.beforeRemove" : function(
																aImage) {
															isBeforeImageRemove = true;
															var cursorPoint = aImage[0].offsetTop; // 제거 대상 이미지의 offsetTop 값으로 정의
															setScrollPosition(
																	this,
																	cursorPoint);
														},
														"image.removed" : function() {
															if (isBeforeImageRemove === true) {
																this.$wp
																		.get(0).scrollTop = fScrollPosition; // 에디터 자체 버그동작이 수행 된 후 계산 해 둔 값으로 스크롤 위치를 이동
															}
															isBeforeImageRemove = false;
														},
														"keydown" : function(
																e) {
															if (isScrollFix(
																	this, e) === true) {
																setScrollPosition(
																		this,
																		getIframeCursorPoint(this));
															}
														},
														"keyup" : function(
																e) {
															if (isScrollFix(
																	this, e) === true) {
																this.$wp
																		.get(0).scrollTop = fScrollPosition;
															}
														},
														"paste.before" : function() {
															if (this.fullscreen
																	.isActive() === false) {
																setScrollPosition(
																		this,
																		getIframeCursorPoint(this));
															}
														},
														"paste.after" : function(
																e) {
															if (this.fullscreen
																	.isActive() === false) {
																this.$wp
																		.get(0).scrollTop = fScrollPosition;
															}
														},
														"codeView.update" : function() {
															this.el.innerHTML = getReplaceZeroWidthSpace(this.el.innerHTML);
															this.el.innerHTML = decodeUriAttribute(this.el.innerHTML);
														}
													};

													EC_FROALA_INSTANCE = new FroalaEditor(
															"textarea#content.ec-fr-never-be-duplicated",
															o,
															function() {
																EC_FROALA_ID = this.id;
																if (d != "") {
																	this.el.innerHTML = this.clean
																			.html(d);
																	// 타겟 textarea 태그에 change 트리거링
																	this.undo
																			.saveStep();
																}
																var script = document
																		.createElement("script");
																script.src = "//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2310251253";
																this.$iframe
																		.get(0).contentWindow.document.head
																		.appendChild(script);
																if (this.el.innerHTML === "<br>") {
																	this.el.innerHTML = "<p><br></p>";
																}
															});

													EC_FROALA_INSTANCE.$iframe[0]
															.setAttribute(
																	"id",
																	"content"
																			+ "_IFRAME");
													EC_FROALA_INSTANCE.$iframe[0].contentWindow.document.body
															.setAttribute(
																	"id",
																	"content"
																			+ "_BODY");

													EC_FROALA_INSTANCE.isEmptyContent = function() {
														var c = getContentFromFroala(this.id);
														// 스페이스바만 입력 저장시, validation을 위해 처리
														var val = c
																.replace(
																		/\<br\/?\>|\<\/?p\>|\s|&nbsp;/gi,
																		"");
														if ("" == val)
															return true;
														return false;
													};

													EC_FROALA_INSTANCE.getContentFromFroala = function() {
														return getContentFromFroala(this.id);
													};

													EC_FROALA_INSTANCE.applyContentToFroala = function(
															content) {
														return applyContentToFroala(
																content,
																this.id);
													};

													EC_FROALA_INSTANCE.setValueBeforeSubmit = function(
															sSection) {
														return setValueBeforeSubmit(
																sSection,
																this.id);
													};

													if (typeof $Editor === "undefined") {
														$Editor = {};
													}
													$Editor["content"] = EC_FROALA_INSTANCE;
												} catch (e) {
													document
															.getElementById("content").value = d;
													console.error(e);
												} finally {
												}
											})();

											function decodeUriAttribute(
													content) {
												return content
														.replace(
																/(?:href=|src=)(?:"([^"]+)|'([^']+))[^>]/g,
																function(
																		match,
																		p1,
																		p2) {
																	var p = p1 ? p1
																			: p2;
																	if (/%20|\s|%3A/g
																			.test(p)) {
																		try {
																			return match
																					.replace(
																							p,
																							decodeURIComponent(
																									p)
																									.trim());
																		} catch (e) {
																			return match;
																		}
																	} else {
																		return match;
																	}
																});
											}

											//플로알라 에디터 내용 조회
											function getContentFromFroala(
													id) {
												try {
													var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID
															: id;
													var oEditor = FroalaEditor.INSTANCES
															.filter(function(
																	instance) {
																return instance.id === sFroalaId;
															});
													if (oEditor[0].codeView
															.isActive()) {
														oEditor[0].codeView
																.toggle();
													}

													oEditor[0].el.innerHTML = decodeUriAttribute(oEditor[0].el.innerHTML);

													return oEditor[0].el.innerHTML;

												} catch (e) {
													console.error(e);
													return false;
												}
											}

											//플로알라 에디터 내용 적용
											function applyContentToFroala(
													content, id) {
												try {
													var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID
															: id;
													var oEditor = FroalaEditor.INSTANCES
															.filter(function(
																	instance) {
																return instance.id === sFroalaId;
															});

													oEditor[0].el.innerHTML = oEditor[0].clean
															.html(content);

													// textarea 태그에 change 트리거링
													oEditor[0].undo
															.saveStep();
													return true;
												} catch (e) {
													console.error(e);
													return false;
												}
											}

											// useclasses 옵션 사용시, froala 커스텀 속성값 (fr-draggable) 제거
											function setValueBeforeSubmit(
													sSection, id) {
												try {
													var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID
															: id;
													var oEditor = FroalaEditor.INSTANCES
															.filter(function(
																	instance) {
																return instance.id === sFroalaId;
															});

													var contents = oEditor[0].el.innerHTML;
													document
															.getElementById(sSection).value = contents
															.replace(
																	/\sclass=("|')fr-draggable("|')|\s?fr-draggable\s?|<\/?null>/gi,
																	"");

													return true;
												} catch (e) {
													console.error(e);
													return false;
												}
											}

											//플로알라 front reset CSS 가져오기
											//Deprecated
											function getFroalaResetCSS() {
												return "//img.echosting.cafe24.com/editors/froala/css/froala_editor_reset.css?vs=2310251253;"
											}

											//플로알라 front style CSS 가져오기
											function getFroalaStyleCSS() {
												return "//img.echosting.cafe24.com/editors/froala/css/froala_style.min.css?vs=2310251253";
											}

											//플로알라 front style EC CSS 가져오기
											function getFroalaECStyleCSS() {
												return "//img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2310251253";
											}

											// 파일 업로드시 랜덤한 파라미터 값 추가
											function getConvertUrlBeforeUpload(
													sUploadUrl) {
												var aSplitUrl = sUploadUrl
														.split("?");
												var oParam = getParameterUploadUrl(aSplitUrl[1]);

												return decodeURIComponent(aSplitUrl[0]
														+ "?"
														+ "uploadPath="
														+ oParam["uploadPath"]
														+ "&uploadId="
														+ Math
																.floor(
																		(Math
																				.random() * 100000))
																.toString());
											}

											function getParameterUploadUrl(
													sQueryString) {
												var aParam = {};

												if (sQueryString) {
													var aFields = sQueryString
															.split("&");
													var aField = [];
													for (var i = 0; i < aFields.length; i++) {
														aField = aFields[i]
																.split("=");
														aParam[aField[0]] = aField[1];
													}
												}
												return aParam;
											}

											// 스크롤 위치 수정해야하는지 확인
											function isScrollFix(oEditor,
													event) {
												if (oEditor.fullscreen
														.isActive() === true) {
													return false;
												}
												var sKey = event.key
														.toUpperCase();
												var bResult = false;
												if (sKey === "ENTER") {
													// 구문의 중간 지점의 엔터 입력만 요구 조건에 해당함
													bResult = oEditor.selection
															.get().focusNode !== oEditor.$el
															.get(0);
												} else if (sKey === "BACKSPACE"
														|| sKey === "DELETE") {
													bResult = true;
												}
												return bResult;
											}

											// 스크롤 위치 수정
											function setScrollPosition(
													oEditor, fCursorPoint) {
												var oContentWrapper = oEditor.$wp
														.get(0); // 에디터 편집 영역 컨테이너
												var fStartPoint = oContentWrapper.scrollTop; // 보여지는 편집 영역의 시작 지점
												var fEndPoint = oContentWrapper.scrollTop
														+ (oContentWrapper.clientHeight - 20); // 보여지는 편집 영역의 끝 지점 (여백 포함)

												if (fCursorPoint > 0
														&& fCursorPoint < fStartPoint) {
													// 커서가 보여지는 영역보다 위에 위치
													fScrollPosition = fCursorPoint;
												} else if (fCursorPoint > 0
														&& fCursorPoint > fEndPoint) {
													// 커서가 보여지는 영역보다 아래에 위치
													fScrollPosition = fCursorPoint
															- (oContentWrapper.clientHeight - 20); // 여백 포함
												} else {
													// 값이 0 이라서 무효화 됐거나, 보여지는 영역에 있는 경우 - 위치를 그대로 유지
													fScrollPosition = fStartPoint;
												}
											}

											// 커서 포인트 반환
											function getIframeCursorPoint(
													editor) {
												var iframeDocument = editor.$iframe
														.get(0).contentDocument;
												var anchorNode = iframeDocument
														.getSelection().anchorNode;
												var iframeRange = iframeDocument
														.createRange();
												iframeRange
														.selectNode(anchorNode);
												return iframeRange
														.getBoundingClientRect().top;
											}

											// 폭없는 공백에서 폭과 줄바꿈 없는 공백으로 치환 (폭없는 공백은 플로알라버그로인해 지원하지않음)
											function getReplaceZeroWidthSpace(
													sContent) {
// 												return sContent.replace(
														/\u200B/g,
														"&#65279;");
											}

											// \n 제거되는 사양에대한 대응 : 플로알라에서 코드뷰 토글시 줄바꿈되는 태그로 변경
											function replaceToFroalaNewLine(
													oEditor) {
												if (oEditor.codeView
														.isActive() === true) {
													return;
												}

												var oWhiteSpacePreElements = oEditor.$el
														.get(0)
														.querySelectorAll(
																'*[style*="white-space: pre"], *[style*="white-space:pre"]');
												for (var iIndex = 0; iIndex < oWhiteSpacePreElements.length; iIndex++) {
													oWhiteSpacePreElements[iIndex].innerHTML = oWhiteSpacePreElements[iIndex].innerHTML
															.replace(/\n/g,
																	'<span class="fr-newline"></span>');
												}
											}

											// \n 제거되는 사양에대한 대응 : 코드뷰 토글시 줄바꿈 태그 \n으로 변경
											function removeFroalaNewLine(
													oEditor) {
												if (oEditor.codeView
														.isActive() === false) {
													return;
												}

												var sCodeViewValue;
												if (typeof oEditor.opts.codeMirror === "function") {
													// 상품 등록/수정 에디터는 코드미러를 사용하기때문에 분기처리
													sCodeViewValue = oEditor.$wp
															.get(0)
															.querySelector(
																	".CodeMirror").CodeMirror
															.getValue();
													oEditor.$wp
															.get(0)
															.querySelector(
																	".CodeMirror").CodeMirror
															.setValue(sCodeViewValue
																	.replace(
																			/<span class=[',"]fr-newline[',"]><\/span>/g,
																			'\n'));
												} else {
													sCodeViewValue = oEditor.$wp
															.get(0)
															.querySelector(
																	".fr-code").value;
													oEditor.$wp
															.get(0)
															.querySelector(
																	".fr-code").value = sCodeViewValue
															.replace(
																	/<span class=[',"]fr-newline[',"]><\/span>/g,
																	'\n');
												}
											}
										</script>
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
										fw-label="비밀번호" fw-msg="" value="" type="password" /> <span
										class="displaynone">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,
											10자~16자)</span></td>
								</tr>
								<tr class="">
									<th scope="row">SECRET</th>
									<td><input id="secure0" name="secure" fw-filter="isFill"
										fw-label="비밀글설정" fw-msg="" value="F" type="radio"
										checked="checked" /><label for="secure0">공개글</label> <input
										id="secure1" name="secure" fw-filter="isFill"
										fw-label="비밀글설정" fw-msg="" value="T" type="radio" /><label
										for="secure1">비밀글</label></td>
								</tr>
								<tr class="captcha displaynone">
									<th scope="row">보안문자</th>
									<td>
										<p class="gBlank5">
											<span class="ec-base-help txtInfo">영문, 숫자 조합을 공백없이
												입력하세요(대소문자구분)</span>
										</p>
									</td>
								</tr>
								<tr class="agree displaynone">
									<th scope="row">개인정보 수집 및 <br />이용 동의
									</th>
									<td><br /> 개인정보 수집 및 이용에 동의하십니까?</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<script>
					function validateForm() {
					  var content = document.getElementsByName("content")[0].value;
					  if (content.trim() === "") {
					    var errorMessage = "내용을 입력하여 주십시오.";
					    document.getElementById("error-message").innerText = errorMessage;
					    return false; // 폼 제출을 막음
					  }
					  return true; // 유효성 검사 통과 시 폼을 제출
					}
					</script>
					<div class="ec-base-button ">
						<span class="gLeft">
							<span class="displaynone">
							<a href="#none" class="btnNormal sizeS" onclick="">관리자 답변보기</a>
							</span>
						<a href="/board/상품문의/6/" class="btnNormalFix sizeS">LIST</a>
						</span>
						<span class="gRight">
						<a href="#" class="btnSubmitFix sizeS" onsubmit="checkk()">OK</a> 
						
						<input type="submit" value="ok" class="btnSubmitFix sizeS" />ok
							<a href="/board/상품문의/6/" class="btnBasicFix sizeS">CANCEL</a>
						</span>
					</div>
					</form>
				</div>
			
		</div>
	</div>
	<form method="post" name="find_frm" action="#" onsubmit="return check()">
<div id="table_search">
<select class="select_box" name="find" size="1">
<option value="writer">이름</option>
<option value="subject">제목</option>
<option value="content">내용</option>
</select>
<input type="text" class="input_box" name="find_box" />
<input type="submit" value="search" class="btn" />
</div>
</form>
	<jsp:include page="footer/footer.jsp" />
</div>
</div>
</body>
</html>

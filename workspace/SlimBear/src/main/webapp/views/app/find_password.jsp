<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>

<!--  추후에 아이디찾기jsp랑 합쳐볼게요 -->
<script th:if="${error != null}" th:inline="javascript">
	window.onload = function() {
		var errorMessage = "${error}";
		if (errorMessage.trim() !== "") {
			alert(errorMessage);
			// 또는 모달 창을 띄우는 스크립트를 추가할 수 있습니다.
			// 모달 창을 띄우기 위해 별도의 JavaScript 라이브러리(예: Bootstrap 등) 사용 가능
		}
	};
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/optimizer.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/optimizeruser.css" />

<link
	href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;800&amp;display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link rel="stylesheet" href="/resources/css/swiper.css" />
<script src="/resources/js/swiper.js"></script>
<script src="/resources/js/optimizeruser.js"></script>
<script type="text/javascript"
	src="https://login2.cafe24ssl.com/crypt/AuthSSLManager.js"></script>
<script type="text/javascript"
	src="https://login2.cafe24ssl.com/crypt/AuthSSLManager.plugin.js"></script>


<title>비밀번호찾기-슬림베어</title>
</head>
<body>

	<div id="wrap">
		<div id="container">






			<jsp:include page="header/header.jsp"></jsp:include>


			<div id="contents">
				<form id="findPasswordForm" name="findPasswordForm"
					action="/app/findPassword" method="post">
					<div
						class="xans-element- xans-member xans-member-findid ec-base-box typeThin ">
						<!--
        $returnURL = /member/id/find_id_result.html
     -->
						<div class="findId">
							<div class="titleArea">
								<h2>FIND PASSWORD</h2>
								<ul>
									<li>가입하신 방법에 따라 비밀번호 찾기가 가능합니다.</li>
									<li>이메일, 전화번호 또는 주민등록번호 중 찾을 방법을 선택한 후,<br />이름과 정보를 입력해
										주세요.
									</li>
									<li>(주의)비밀번호 찾기 진행시 기존 비밀번호는 삭제되며,<br/>
												새로운 임시 비밀번호가 발급됩니다.</li>
								</ul>
							</div>
							<fieldset>
								<legend>비밀번호 찾기</legend>
								<p class="check">
									<input id="check_method1" name="check_method" value="1"
										type="radio" onclick="toggleFields('1')" /> <label
										for="check_method1">이메일</label> <input id="check_method2"
										name="check_method" value="2" type="radio"
										onclick="toggleFields('2')" checked="checked" /> <label
										for="check_method2">휴대폰 번호</label> <input id="check_method3"
										name="check_method" value="3" type="radio"
										onclick="toggleFields('3')" /> <label for="check_method3">주민등록번호</label>
									<p id="name_view" class="name">
										<strong>이름</strong> <input id="name" name="name" fw-filter=""
											fw-label="이름" fw-msg="" class="lostInput" placeholder="이름"
											value="" type="text" />
									</p>
									<p id="id_view" class="id">
										<strong>아이디</strong> <input id="id" name="id" fw-filter=""
											fw-label="아이디" fw-msg="" class="lostInput" placeholder="아이디"
											value="" type="text" />
									</p>
								<p id="email_view" class="email" style="display: none;">
									<strong>이메일로 찾기</strong> <input id="email" name="email"
										fw-filter="isEmail" fw-label="이메일" fw-msg="" class="lostInput"
										placeholder="이메일" value="" type="text" />
								</p>
								<p id="mobile_view" class="phone" style="display: block;">
									<strong>휴대폰 번호로 찾기</strong> <input id="phone" name="phone"
										fw-filter="" fw-label="휴대전화 번호"
										fw-msg="" class="phone" placeholder="-없이 전화번호를 적어주세요" maxlength="11"
										value="" type="text" />
								</p>
								<p id="ssn_view" class="ssn_no" style="display: none;">
									<strong>주민등록번호로 찾기</strong> <input id="ssn1" name="ssn1"
										fw-filter="isMin[6]&isMax[6]&isNumber" fw-label="주민등록번호"
										fw-msg="" class="lostInput" placeholder="000000" maxlength="6"
										value="" type="text" /> - <input id="ssn2" name="ssn2"
										fw-filter="isMin[7]&isMax[7]&isNumber" fw-label="주민등록번호"
										fw-msg="" class="lostInput" placeholder="0000000"
										maxlength="7" value="" type="password" />
								</p>
								<div class="ec-base-button gColumn">
										<button type="submit" class="btnLogin2">확인</button>
									</div>
							</fieldset>
						</div>
					</div>
				</form>
			</div>

			<jsp:include page="footer/footer.jsp" flush="true" />

			<!-- #bottom_info -->

			<!-- #footer -->

		</div>
	</div>


</body>
</html>

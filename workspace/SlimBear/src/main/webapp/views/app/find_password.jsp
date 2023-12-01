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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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
						class="xans-element- xans-member xans-member-findid ec-base-box typeThin">
						<div class="findId">
							<div class="titleArea">
								<h2>FIND PASSWORD</h2>
								<ul>
									<li>가입하신 방법에 따라 비밀번호 찾기가 가능합니다.</li>
									<li>이메일, 전화번호 또는 주민등록번호 중 찾을 방법을 선택한 후,<br />이름과 정보를 입력해
										주세요.
									</li>
									<li>(주의)비밀번호 찾기 진행시 기존 비밀번호는 삭제되며,<br />새로운 임시 비밀번호가
										발급됩니다.
									</li>
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
										for="check_method2">휴대폰 번호</label>
								</p>
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
										fw-filter="" fw-label="휴대전화 번호" fw-msg="" class="phone"
										placeholder="-없이 전화번호를 적어주세요" maxlength="11" value=""
										type="text" /> <
									<div class="ec-base-button gColumn">
										<button type="button" class="btnLogin2" 
											onclick="sendVerificationCode()">인증번호 받기</button>
									</div>
									
								<p id="verification_code_view" style="display: none;">
									<strong>인증번호</strong> <input id="verificationCode"
										name="verificationCode" fw-filter="" fw-label="인증번호" fw-msg=""
										class="lostInput" placeholder="인증번호" value="" type="text" />
										<button id=type="button" class="btnLogin2" onclick="verifyCode()">인증번호
											확인</button>
									
								</p>
								<div class="ec-base-button gColumn">
									<button type="submit" class="btnLogin2">확인</button>
								</div>
							</fieldset>
						</div>
					</div>
				</form>
			</div>

			<script>
				function sendVerificationCode() {
					// 선택된 방법 (이메일 또는 휴대폰) 가져오기
					disableButton();
					var method = document
							.querySelector('input[name="check_method"]:checked').value;

					// 선택된 방법에 따라 이메일 또는 휴대폰 번호 가져오기
					var target = method === '1' ? 'email' : 'phone';
					var inputValue = document.getElementById(target).value;

					// 값이 비어 있으면 경고 메시지 표시 후 함수 종료
					if (!inputValue.trim()) {
						alert('유효하지 않은 ' + target + '입니다. 유효한 값을 입력하세요.');
						return;
					}

					// AJAX를 이용해 서버로 인증번호 전송
					var xhr = new XMLHttpRequest();
					xhr.open('POST', '/app/findPassword', true);
					xhr.setRequestHeader('Content-Type',
							'application/x-www-form-urlencoded');

					// 서버 응답 처리
					xhr.onload = function() {
						if (xhr.status === 200) {
							var response = xhr.responseText;

							if (response === "success") {
								alert('인증코드 전송에 성공했습니다.');
								// 인증번호 입력 필드 표시
								document
										.getElementById('verification_code_view').style.display = 'block';
							} else {
								alert('인증코드 전송에 실패했습니다.');
							}
						} else {
							alert('인증코드 전송에 실패했습니다.');
						}
					};

					// 전송할 데이터 설정
					var params = 'method='
							+ method
							+ '&target='
							+ inputValue
							+ '&name='
							+ encodeURIComponent(document
									.getElementById('name').value)
							+ '&id='
							+ encodeURIComponent(document.getElementById('id').value)
							+ '&email='
							+ encodeURIComponent(document
									.getElementById('email').value)
							+ '&phone='
							+ encodeURIComponent(document
									.getElementById('phone').value);

					xhr.send(params);
				}

				function verifyCode() {
					var verificationCode = document
							.getElementById('verificationCode').value;

					// AJAX를 이용한 서버와의 통신
					var xhr = new XMLHttpRequest();
					xhr.open('POST', '/app/verifyCode', true);
					xhr.setRequestHeader('Content-Type',
							'application/x-www-form-urlencoded');

					// sendVerificationCode에서 전달한 method와 target 값을 가져와서 전송
					var method = document
							.querySelector('input[name="check_method"]:checked').value;
					var target = method === '1' ? 'email' : 'phone';

					xhr.onload = function() {
						if (xhr.status === 200) {
							// 서버에서의 응답 처리
							var response = xhr.responseText; // 수정된 부분

							if (response === "success") { // 수정된 부분
								alert('인증에 성공했습니다. 발급받은 임시 비밀번호로 로그인 해주세요.');
								// 응답을 받은 후에 페이지 이동
								console.log('페이지 이동: /find_password_result'); // 로그 추가
								window.location.href = '/views/app/find_password_result.jsp';
							} else {
								alert('인증에 실패했습니다. 인증코드를 다시 확인해주세요.');
								// 응답을 받은 후에 페이지 이동
								console.log('페이지 이동: /app/find_password'); // 로그 추가
								window.location.href = '/views/app/find_password.jsp';
							}
						} else {
							alert('인증에 실패했습니다. 인증코드를 다시 확인해주세요.');
							// 응답을 받은 후에 페이지 이동
							console.log('페이지 이동: /app/find_password'); // 로그 추가
							window.location.href = '/views/app/find_password.jsp';
						}
					};

					// 보낼 데이터 설정
					var params = 'enteredCode=' + verificationCode + '&method='
							+ method + '&target=' + target;
					xhr.send(params);
				}
				function disableButton() {
			        // 버튼 비활성화
			        $('#email_view button').prop('disabled', true);
			    }
			</script>


			<jsp:include page="footer/footer.jsp" flush="true" />

			<!-- #bottom_info -->

			<!-- #footer -->

		</div>
	</div>


</body>
</html>

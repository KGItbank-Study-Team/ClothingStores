<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
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
<script th:if="${error}" th:inline="javascript">
    window.onload = function() {
        var errorMessage = /*[[${error}]]*/ "";
        if (errorMessage.trim() !== "") {
            alert(errorMessage);
            // 또는 모달 창을 띄우는 스크립트를 추가할 수 있습니다.
            // 모달 창을 띄우기 위해 별도의 JavaScript 라이브러리(예: Bootstrap 등) 사용 가능
        }
    };
</script>
<title>비밀번호찾기-슬림베어</title>
</head>
<body>
	<div id="wrap">
		<div id="container">
			<jsp:include page="header/header.jsp"></jsp:include>
			<div class="path">
				<span>현재 위치</span>
				<ol>
					<li><a href="/">홈</a></li>
					<li title="현재 위치"><strong>비밀번호 찾기</strong></li>
				</ol>
			</div>
			<div class="titleArea">
				<h2>비밀번호 찾기</h2>
			</div>
			<form id="findPasswdMethod" name=""
				action="/exec/front/Member/FindPasswdMethod/" method="post"
				target="_self" enctype="multipart/form-data">
				<input id="nextUrl" name="nextUrl"
					value="/member/passwd/find_passwd_result.html" type="hidden" /> <input
					id="member" name="member"
					value="5030e8a83c49a4b778e7b8bfffb4be6df771b305feead73b8a75a8f36c552d9182f6ce2ed4c91420e0265f4e39be274f4b084d7b9b0b1f9b201646b81e2ebdd4387458e73b03fd5894d9d4a8c7102b3765ba75adbecfca5ee23ce9484d37bb75a8c611694523d22a2ec170ac337b18c97012a55174b3aa30175c503ff60d41c224465216b5cb5cd3ea3d723fff814692faf5244130e128a8be29df8f532b994ea2bd7733c1b8a2c3bb41f8107ab5aa518c798c09fb60456f8c22196c2189a0112f0502151195540b55557f408eb08e12c94c5c8b67454fc7f831a7010eb7cdcc0ab82a6491e80b442aaf2b2991b62ee258a6411414b78b3992e32d142df95577bf20dccf5adaffbd2011194320150da0"
					type="hidden" />
				<div
					class="xans-element- xans-member xans-member-findpasswdmethod ec-base-box typeThin ">
					<!--
        $nextURL = /member/passwd/find_passwd_result.html
     -->
					<div class="inner">
						<h3 class="boxTitle">임시 비밀번호 발급 완료</h3>
						<fieldset>
							<legend>임시 비밀번호 발급 완료</legend>
							<ul class="ec-base-desc">
								<li><strong class="term">임시 비밀번호</strong><span class="desc"><input
										id="passwd_method_type0" name="passwd_method_type"
										fw-filter="isFill" fw-label="임시 비밀번호" fw-msg="" value="email"
										type="radio" checked="checked" /><label
										for="passwd_method_type0">이메일</label> <input
										id="passwd_method_type1" name="passwd_method_type"
										fw-filter="isFill" fw-label="임시 비밀번호" fw-msg="" value="mobile"
										type="radio" /><label for="passwd_method_type1">휴대폰</label></span></li>
								<li id="passwd_method_email_info"><strong class="term">이메일</strong><span
									class="desc"><strong class="txtEm"><span
											class="authssl_c_email">${member.email }</span></strong></span></li>
								<li id="passwd_method_mobile_info"><strong class="term">휴대폰
										번호</strong><span class="desc">${member.phone}<strong class="txtEm number"></strong></span>
								</li>
							</ul>
							<div class="ec-base-button gColumn">
								<a href="/app/login" class="btnSubmit sizeM">로그인</a> <a href="/"
									class="btnNormal sizeM">홈</a>
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
</body>
</html>

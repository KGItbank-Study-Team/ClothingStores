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

<title>아이디찾기-슬림베어</title>
</head>
<body>
	<div id="wrap">
		<div id="container">
			<jsp:include page="header/header.jsp"></jsp:include>
			<div id="contents">
                <div class="path">
                    <span>현재 위치</span>
                    <ol>
                        <li>
                            <a href="/">홈</a>
                        </li>
                        <li title="현재 위치">
                            <strong>아이디 찾기</strong>
                        </li>
                    </ol>
                </div>
                <div class="titleArea">
                </div>
                <div class="xans-element- xans-member xans-member-findidresult ec-base-box typeThin">
                    <div class="findId">
                        <h3 class="boxTitle">아이디 찾기</h3>
                        <p class="info">고객님 아이디 찾기가 완료 되었습니다.</p>
                        <div class="ec-base-box typeMember gMessage">
                            <p class="message">
                                저희 쇼핑몰을 이용해주셔서 감사합니다.<br/>
                                다음정보로 가입된 아이디가 총 <span class="txtEm">1</span>
                                개 있습니다.
                            </p>
                            <div class="information">
                                <p class="thumbnail">
                                    <img src="//img.echosting.cafe24.com/skin/base/member/img_member_default.gif" alt=""/>
                                </p>
                                <div class="description">
                                    <ul class="ec-base-desc gSmall">
                                        <li>                                        
                                            <strong class="term">이름</strong>
                                            <strong class="desc">
                                                : <span class="authssl_name">${member.name}</span>
                                            </strong>
                                        </li>
                                        <li>
                                            <strong class="term">아이디</strong>
                                            <strong class="desc">
                                                : <span class="authssl_searchInfo">${member.id }</span>
                                            </strong>
                                        </li>
                                        <li>
                                            <strong class="term">이메일</strong>
                                            <span class="desc">
                                                : <span class="authssl_searchInfo">${member.email }</span>
                                            </span>
                                        </li>                                        
                                        <li>
                                            <strong class="term">성별</strong>
                                            <span class="desc">
                                                : <span class="authssl_searchInfo">${member.sex }</span>
                                            </span>
                                        </li>
                                        <li>
                                            <strong class="term">가입날짜</strong>
                                            <span class="desc">
                                                : <span class="authssl_searchInfo">${member.reg_date }</span>
                                            </span>
                                        </li>                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="ec-base-button gBlank20">
                            <a href="/app/login" class="btnSubmitFix sizeM ">로그인</a>
                            <a href="/views/app/find_password.jsp" class="btnEmFix sizeM ">비밀번호 찾기</a>
                        </div>
                    </div>
                </div>
            </div>
			<jsp:include page="footer/footer.jsp" flush="true" />
			<!-- #bottom_info -->
			<!-- #footer -->
		</div>
	</div>
</body>
</html>

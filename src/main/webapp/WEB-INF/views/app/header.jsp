 <%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="header.css" />
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script defer src="js/main.js"></script>
    <script src="https://kit.fontawesome.com/09decccad8.js" crossorigin="anonymous"></script>
    <title>SLIIMBEAR</title>
     <style type="text/css">
     @font-face {
  font-family: 'Noto Sans KR';
  font-style: normal;
  font-weight: 100;
  src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'), url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'), url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');
}

@font-face {
  font-family: 'Noto Sans KR';
  font-style: normal;
  font-weight: 300;
  src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'), url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'), url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');
}

@font-face {
  font-family: 'Noto Sans KR';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'), url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'), url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');
}

@font-face {
  font-family: 'Noto Sans KR';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'), url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'), url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');
}

@font-face {
  font-family: 'Noto Sans KR';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'), url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'), url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');
}

html,
body,
div,
dl,
dt,
dd,
ul,
ol,
li,
h1,
h2,
h3,
h4,
h5,
h6,
pre,
code,
form,
fieldset,
legend,
input,
textarea,
p,
blockquote,
th,
td,
img {
  margin: 0;
  padding: 0;
}

html {
  width: 100%;
  height: 100%;
}

body,
code {
  /* font: 13px 'Outfit','Noto Sans KR',Dotum,AppleGothic,sans-serif; */
  font-size: 13px;
  color: rgb(0, 0, 0);
  background: #ffffff;
  letter-spacing: 0;
  line-height: 1.7;
}

body {
  min-width: 900px;
}

#oneTop {
  position: relative;
  background: #655345;
  text-align: center;
  padding: 0px 60px;
  font-size: small;
}
.slide-sentence {
  /* margin-top: 10px; */
  line-height: 1cm;
}
#oneTop * {
  position: relative;
  color: rgba(255, 255, 255, 0.8);
  line-height: 38px;
  padding: 0 60px;
  overflow: hidden;
  height: 38px;
  visibility: visible;
  opacity: 1;
  transition: all 0.35s;
}
li {
  list-style: none;
}
a {
  text-decoration: none;
  font-weight: bolder;
  color: rgb(0, 0, 0);
}
header {
  /* box-shadow: 1px 1px 1px 1px rgb(153, 144, 144);
*/
}
.logo {
  display: flex;
  align-items: center;
  margin-left: 20px;
}
.logo>a>img {
  padding-top: 15px;
  width: 180px;
}
.menu-list {
  position: relative;
  top: 7px;
  padding-left: 20px;
}
.menu-list > li {
  font: 13px 'Outfit','Noto Sans KR',Dotum,AppleGothic,sans-serif;
}
.mainMenu {
  width: 100%;

  display: flex;
  align-items: center;
  top: 4%;
}
.menu-item {
  float: left;
  position: relative;
  cursor: pointer;
  padding: 8px 15px;
  text-align: center;
  font-weight: bold;
}
.dropdown-content {
  position: absolute;
  min-width: 150px;
  display: none;
}
.dropdown-content a {
  display: flex;
  width: auto;
}
.dropdown-content > li {
  padding-top: 10px;
}
.dropdown {
  position: relative;
}
.menu-item:hover {
  color: #3f3f3f;
}
.menu-item:hover .dropdown-content {
  display: block;
}
.banner-container {
  width: 100%;
  position: relative;
  opacity: 1;
  overflow: hidden;
  z-index: 0;
}
.menu-list {
  z-index: 1;
}
.banner-container img {
  /* overflow: hidden; */
  display: block;
  width: 100%;
  height: 100%;
}
.image-slider {
  overflow: hidden;
}

.image-slider, img {
  height: auto;
}

.slider {
  display: none;
}
.userArea > ul {
  display: flex;
  align-content: center;
  position: absolute;
  right: 80px;
  top: 8%;
}
.userArea>ul>li {
  position: relative;
  vertical-align: middle;
  padding-left: 15px;
}
.userArea img {
  width: 15px;
  height: auto;
  vertical-align: middle;
  opacity: 1;
}
.fuck {
  position: relative;
  top: 20%;
  right: 12px;
}

/*======================================================  */
/* 검색 영역 */
/*======================================================  */
input {
  background: transparent;
  border: 0;
  outline: none;
  border-bottom: 1px solid rgb(0, 0, 0);
  width: 80px;
  position: relative;
  top: 9px;
}
i {
  position: relative;
  top: 9px;
}
#one-text {
  position: relative;
  padding-top: 50px;
  color: #000;
}
main,
code {
  color: #3f3f3f;
  text-align: center;
}

#one-best {
  padding-top: 100px;
  padding-bottom: 50px;
  text-align: center;
  /* position: absolute; */
}

.image-list>img {
  width: 370px;
  height: 492px;
}
.menu-item2 {
  float: right;
  display: flex;
  position: absolute;
  cursor: pointer;
}
     
     
     </style>
</head>

<body>
    <div id="top_sentence">
        <div id="oneTop">
            <ul class="text-slide">
                <li class="slide-sentence"><a href="#none">♥핸드메이드 코트 10% SALE♥ ~2023.10.31 23:59PM</a></li><br />
                <li class="slide-sentence"><a href="#none">쌀쌀해진 날씨, 슬로우앤드와 함께 준비하기</a></li><br />
                <li class="slide-sentence"><a href="#none">로그인 후 슬로우앤드의 다양한 혜택을 만나보세요</a></li><br />
            </ul>
        </div>
    </div>
    <header>
            <div id="users-container"> <!-- "menu clearfix" -->
                <ul class="mainMenu">
                    <div class="logo">
                        <a href=""><img src="../images/SlimBear-Logo01.png " alt=""></a>
                    </div>
                    <div class="menu-list">
                        <li class="menu-item"><a href="">BEST🔥</a>
                            <ul class="dropdown-content">
                                <li><a href="">TOP</a></li>
                                <li><a href="">BOTTOM</a></li>
                                <li><a href="">OUTER</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">NEW</a></li>
                        <li class="menu-item"><a href="">TOP</a>
                            <ul class="dropdown-content">
                                <li><a href="">맨투맨</a></li>
                                <li><a href="">후드</a></li>
                                <li><a href="">셔츠</a></li>
                                <li><a href="">니트</a></li>
                                <li><a href="">반발티</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">BOTTOM</a>
                            <ul class="dropdown-content">
                                <li><a href="">팬츠</a></li>
                                <li><a href="">슬랙스</a></li>
                                <li><a href="">데님</a></li>
                                <li><a href="">반바지</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">OUTER</a>
                            <ul class="dropdown-content">
                                <li><a href="">코트</a></li>
                                <li><a href="">패딩</a></li>
                                <li><a href="">블레이저</a></li>
                                <li><a href="">레더</a></li>
                                <li><a href="">무스탕</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">UNDERWEAR</a>
                            <ul class="dropdown-content">
                                <li><a href="">상의</a></li>
                                <li><a href="">하의</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">SPORTS</a>
                            <ul class="dropdown-content">
                                <li><a href="">상의</a></li>
                                <li><a href="">하의</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">ACC</a>
                            <ul class="dropdown-content">
                                <li><a href="">벨트</a></li>
                                <li><a href="">양말</a></li>
                                <li><a href="">목도리</a></li>
                                <li><a href="">장갑</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">COMMUNITY</a>
                            <ul class="dropdown-content">
                                <li><a href="">공지사항</a></li>
                                <li><a href="">REVIEW</a></li>
                                <li><a href="">상품문의</a></li>
                                <li><a href="">FAQ</a></li>
                            </ul>
                        </li>
                    </div>
                    <div class="userArea">
                        <ul>
                            <li>
                                <div class="search">
                                    <input type="text" value="search" style="color: rgb(0, 0, 0);">
                                    <i class="fas fa-search"></i>
                                </div>
                            </li>
                            <li class="menu-item">
                                <a href="#"><img src="../images/icon_user.png" alt="user"></a>
                                <ul class="dropdown-content">
                                    <li><a href="">로그인</a></li>
                                    <li><a href="">회원가입</a></li>
                                    <li><a href="">주문조회</a></li>
                                </ul>
                            </li>
                            <li><a href="#"><img class="fuck" src="../images/icon_cart.png" alt="cart"></a></li>
                        </ul>
                    </div>
                </ul>
            </div><!-- 메인메뉴 끝-->
       
    </header>

</html>
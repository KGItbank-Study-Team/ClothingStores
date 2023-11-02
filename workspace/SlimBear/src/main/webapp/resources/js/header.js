//상하슬라이딩
setInterval(function(){
  $('#oneTop>ul>li').delay(2500);
  $('#oneTop>ul>li').animate({marginTop: "-39px"})
  $('#oneTop>ul>li').delay(2500);
  $('#oneTop>ul>li').animate({marginTop: "-51px"})
  $('#oneTop>ul>li').delay(2500);
  $('#oneTop>ul>li').animate({marginTop: "0px"})
});

// 스크롤시 메뉴바 색깔 변화
/*
$(document).ready(function () {
  $(window).scroll(function () {
    let scroll = $(window).scrollTop();
    if (scroll > 1) {
      $(".mainMenu").css("background", "#655345");
    }
    else {
      $(".mainMenu").css("background", "#D7D2C3");
    }
  })
})
*/
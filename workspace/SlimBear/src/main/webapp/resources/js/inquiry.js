/**
 * 
 */

// inquiry.js 수정
function hideNewImageAfterOneWeek() {
    var images = document.querySelectorAll('.new-image'); // 클래스 변경

    images.forEach(function (image) {
        var regDateText = image.closest('tr').querySelector('td:nth-child(5)').textContent; // 5번째 열에 있는 reg_date 값 가져오기

        // 'yyyy-MM-dd HH:mm:ss' 형식의 날짜를 JavaScript Date 객체로 변환
        var regDate = new Date(regDateText.replace(/-/g, '/').replace(' ', 'T') + 'Z');

        var oneWeekAgo = new Date();
        oneWeekAgo.setDate(oneWeekAgo.getDate() - 7);

        // 현재 날짜와 등록 날짜를 비교
        if (regDate <= oneWeekAgo) {
            image.style.display = 'none'; // 이미지를 숨김
        } else {
            image.style.display = 'block'; // 이미지를 보임
        }
    });
}

// 페이지 로드 시 함수 호출
window.onload = function () {
    hideNewImageAfterOneWeek();
};
 
 
 
 
$(function() {
	var hrefCate = location.href;

	if (hrefCate.indexOf('/1/') != -1) {
		$('.navi01').addClass("on");
	}
	;

	if (hrefCate.indexOf('company.html') != -1) {
		$('.navi00').addClass("on");
	}
	;

	if (hrefCate.indexOf('/2/') != -1) {
		$('.navi03').addClass("on");
	}
	;

	if (hrefCate.indexOf('/4/') != -1) {
		$('.navi04').addClass("on");
	}
	;

	if (hrefCate.indexOf('/board/index.html') != -1) {
		$('.navi05').addClass("on");
	}
	;
});


$(function() {
	var hrefCate = location.href;

	if (hrefCate.indexOf('/board/index.html') != -1) {
		$('.subnavi').css('display', 'block');
	}
	;

	if (hrefCate.indexOf('/6/') != -1) {
		$('.subnavi').css('display', 'block');
		$('.navi02').addClass("on");
		$('.qna01').addClass("on");
	}
	;

	if (hrefCate.indexOf('board_no=6') != -1) {
		$('.subnavi').css('display', 'block');
		$('.navi02').addClass("on");
		$('.qna01').addClass("on");
	}
	;

	if (hrefCate.indexOf('/3001/') != -1) {
		$('.subnavi').css('display', 'block');
		$('.navi02').addClass("on");
		$('.qna02').addClass("on");
	}
	;

	if (hrefCate.indexOf('/101/') != -1) {
		$('.subnavi').css('display', 'block');
		$('.navi02').addClass("on");
		$('.qna03').addClass("on");
	}
	;

	if (hrefCate.indexOf('/5/') != -1) {
		$('.subnavi').css('display', 'block');
		$('.navi02').addClass("on");
		$('.qna04').addClass("on");
	}
	;

	/*
	if(hrefCate.indexOf('/14/')!=-1){
	    $('.subnavi').css('display','block');
	    $('.navi02').addClass("on");
	    $('.qna05').addClass("on");
	};
	 */

	if (hrefCate.indexOf('/13/') != -1) {
		$('.subnavi').css('display', 'block');
		$('.navi02').addClass("on");
		$('.qna06').addClass("on");
	}
	;
});


$(document).ready(function() {
    $(".qnaLink").click(function() {
        // 클릭된 링크의 인덱스를 가져오기
        var index = $(".qnaLink").index(this);
        // 상품문의 링크에 해당하는 type 값 설정
        var type = ["PRODUCT", "DELIVERY", "DELIVERY_R"][index];
        // 새로운 URL로 리다이렉트
        window.location.href = "/app/board/inquiry?type=" + type;
    });
});




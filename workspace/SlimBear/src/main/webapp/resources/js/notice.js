/**
 * 
 */

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

	if (hrefCate.indexOf('/13/') != -1) {
		$('.subnavi').css('display', 'block');
		$('.navi02').addClass("on");
		$('.qna06').addClass("on");
	}
	;
});










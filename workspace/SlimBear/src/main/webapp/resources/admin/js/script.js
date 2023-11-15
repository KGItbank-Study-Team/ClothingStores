//좌측 슬라이더 메뉴 펼치기
function pageSliderMenuActive(navID, menuIndex){
	$('#' + navID).find(".collapsed").removeClass("collapsed");
	$('#' + navID).find(".collapse").addClass("show");
	$('#' + navID).find('.collapse-item').eq(menuIndex).addClass("active");
}
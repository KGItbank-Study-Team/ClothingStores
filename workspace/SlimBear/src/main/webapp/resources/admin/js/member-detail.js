$(function(){
	pageSliderMenuActive("accordionSidebar_member_nav", 1);
});

function notFoundMember(beforeID){
	$('#memberIDInputor').find('.modal-title').html('해당 회원을 찾을 수 없었습니다. 다시 입력해주시기 바랍니다. 이전 입력한 아이디 : ' + beforeID);

	$('#memberIDInputor').modal('show');
}

function haveNotMemberID(){
	$('#memberIDInputor').find('.modal-title').html('조회하고 싶은 회원의 아이디를 입력해주세요.');

	$('#memberIDInputor').modal('show');
}

function memberSelect(){
	self.location='/admin/home/member?memberID=' + $('#id').val();
}
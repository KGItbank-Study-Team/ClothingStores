// board.js

function deleteInquiry(uid) {
    $.ajax({
        type: "GET",
        url: "/app/board/inquiry/detail/" + uid,
        success: function () {
            // 삭제가 성공하면 화면을 새로고침
            location.reload();
        },
        error: function () {
            alert("문의 삭제에 실패했습니다.");
        }
    });
}

$(document).ready(function() {
	$("#toggleAnswer").click(function() {
		$("#answerContent").slideToggle();
	});
});





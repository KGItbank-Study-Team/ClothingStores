$(document).ready(function () {
    $(".userpw-confirm").blur(checkPasswordMatch);
});

function checkPasswordMatch() {
    const password = $(".userpw").val();
    const confirmPassword = $(".userpw-confirm").val();
    const message = document.getElementById("password-match-message");

    if (password !== confirmPassword) {
        // 비밀번호와 비밀번호 확인이 일치하지 않을 때 메시지 표시
        message.textContent = "비밀번호가 일치하지 않습니다.";
    } else {
        // 비밀번호가 일치할 때 메시지 삭제
        message.textContent = "";
        // AJAX 요청을 사용하여 서버에서 비밀번호 일치 여부를 추가로 확인할 수 있음
        $.ajax({
            url: "/checkPasswordMatch",
            type: "POST",
            data: {
                password: password,
                confirmPassword: confirmPassword
            },
            success: function (data) {
                if (data.match === true) {
                    message.textContent = "비밀번호가 일치합니다.";
                }
            },
            error: function () {
                message.textContent = "비밀번호 확인 중 오류가 발생했습니다.";
            }
        });
    }
}

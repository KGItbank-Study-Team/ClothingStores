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

// // 로그인 세션 저장
$(document).ready(function () {
    // 페이지 로드 시, 저장된 아이디가 있으면 입력란에 표시
    var savedUsername = getCookie("savedUsername");
    if (savedUsername) {
        $("#usernameInput").val(savedUsername);
        $("#saveId").prop("checked", true);
    }

    // 체크박스 상태가 변경될 때
    $("#saveId").change(function () {
        if ($(this).is(":checked")) {
            // 체크되면 아이디를 쿠키에 저장 (7일 동안 유지)
            setCookie("savedUsername", $("#usernameInput").val(), 7);
        } else {
            // 체크가 해제되면 쿠키 삭제
            deleteCookie("savedUsername");
        }
    });
});

// 쿠키 저장 함수
function setCookie(cookieName, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

// 쿠키 삭제 함수
function deleteCookie(cookieName) {
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

// 쿠키 가져오기 함수
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if (start != -1) {
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if (end == -1)
            end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
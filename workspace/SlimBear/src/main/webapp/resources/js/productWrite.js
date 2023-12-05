document.addEventListener("DOMContentLoaded", function () {
    var urlParams = new URLSearchParams(window.location.search);
    var uid = urlParams.get("uid");

    // uid 값을 hidden input에 설정
    var uidInput = document.createElement("input");
    uidInput.type = "hidden";
    uidInput.name = "uid";
    uidInput.value = uid;

    // form에 추가
    var form = document.getElementById("boardWriteForm");
    form.appendChild(uidInput);

    // form action에 추가
    form.action = form.action + uid;
});

$(document).ready(function() {
    // 현재 URL 가져오기
    var currentURL = window.location.href;

    // 현재 URL에서 uid 매개변수 추출
    var uidParameter = getParameterByName('uid', currentURL);
    console.log(uidParameter);

    // 새로운 취소 버튼 URL 생성
    var newCancelURL = "/app/product?p=" + uidParameter;

    // 취소 버튼의 href 속성을 새 URL로 설정
    $('#cancelButton').attr('href', newCancelURL);
});

// 이름으로 URL에서 매개변수 추출하는 함수
function getParameterByName(name, url) {
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
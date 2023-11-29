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
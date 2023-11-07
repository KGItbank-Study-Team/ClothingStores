function toggleHiddenContent() {
    var hiddenContent = document.getElementById('hiddenContent03');
    var btn = document.querySelector('.btn');

    if (hiddenContent.style.display === 'none' || hiddenContent.style.display === '') {
        hiddenContent.style.display = 'block'; // 숨겨진 콘텐츠를 표시
        btn.textContent = '주문자 정보 ▽'; // 버튼 텍스트 변경
    } else {
        hiddenContent.style.display = 'none'; // 숨겨진 콘텐츠를 숨김
        btn.textContent = '주문자 정보 ▶'; // 버튼 텍스트 변경
    }
}
function validateForm() {
    const nameField = document.querySelector('.placehold-textt input[name="name"]');
    const newBasicAddrField = document.querySelector('.field.tel-number input[name="newbasicaddr"]');
    const newJasaeAddrField = document.querySelector('.field.tel-number input[name="newjasaeaddr"]');
    
    let errorMessages = [];

    if (nameField.value.trim() === "") {
    errorMessages.push('받는 사람을 입력하세요.');
}

    if (newBasicAddrField.value.trim() === "") {
    errorMessages.push('새로운 기본 주소를 입력하세요.');
}
    if (newJasaeAddrField.value.trim() === "") {
    errorMessages.push('새로운 상세 주소를 입력하세요.');
}

    if (errorMessages.length > 0) {
        alert(errorMessages.join('\n'));
        return false; // 폼 제출을 막음
    }

    return true; // 폼 제출을 허용
}	


document.addEventListener('DOMContentLoaded', function() {
    var orderbutton = document.getElementById('orderbutton');

    var orderButtonHandler = function() {
        // 주문하기 버튼을 클릭할 때, onbeforeunload 이벤트를 제거
        window.onbeforeunload = null;

        // 폼 서버로 제출
        var form = document.querySelector('form');
        form.submit();
    };

    orderbutton.addEventListener('click', orderButtonHandler);
});



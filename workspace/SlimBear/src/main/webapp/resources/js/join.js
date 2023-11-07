// HTML에서 필드 요소들을 가져옵니다.
const idField = document.querySelector('.idd');
const passwordField = document.querySelector('.userpw');
const confirmPasswordField = document.querySelector('.userpw-confirm');
const nameField = document.querySelector('.namee');
const telNumberField = document.querySelector('.tel-number input[type="tel"]');

// 가입하기 버튼 요소를 가져옵니다.
const submitButton = document.querySelector('input[type="submit"]');

// 가입하기 버튼 클릭 시 이벤트 핸들러를 추가합니다.
submitButton.addEventListener('click', function (event) {
    let errorMessages = [];

    // 아이디 필드 유효성 검사
    if (idField.value === '') {
        errorMessages.push('아이디를 입력하세요.');
        idField.style.border = '1px solid red';
    }else {
        idField.style.border = ''; // 유효한 경우 테두리를 초기화
    }

    // 비밀번호 필드 유효성 검사
    if (passwordField.value === '') {
        errorMessages.push('비밀번호를 입력하세요.');
    }

    // 비밀번호 재확인 필드 유효성 검사
    if (confirmPasswordField.value === '') {
        errorMessages.push('비밀번호를 다시 확인하세요.');
    } else if (passwordField.value !== confirmPasswordField.value) {
        errorMessages.push('비밀번호가 일치하지 않습니다.');
    }

    // 이름 필드 유효성 검사
    if (nameField.value === '') {
        errorMessages.push('이름을 입력하세요.');
    }

    // 인증번호 입력 필드 유효성 검사
    if (telNumberField.value === '') {
        errorMessages.push('인증번호를 입력하세요.');
    }

    // 에러 메시지가 있으면 경고창을 띄우고 폼 제출을 막습니다.
    if (errorMessages.length > 0) {
        event.preventDefault(); // 폼 제출 막음

        // 에러 메시지를 하나의 문자열로 결합합니다.
        const errorMessage = errorMessages.join('\n');

        // 경고 창을 띄웁니다.
        alert(errorMessage);
    }
});

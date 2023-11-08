// HTML에서 필드 요소들을 가져옵니다.
const idField = document.querySelector('.idd');
const passwordField = document.querySelector('.userpw');
const confirmPasswordField = document.querySelector('.userpw-confirm');
const nameField = document.querySelector('.namee');
const telNumberField = document.querySelector('.tel-number input[type="tel"]');
const addressField = document.querySelector('#sample6_address');

// 가입하기 버튼 요소를 가져옵니다.
const submitButton = document.querySelector('input[type="submit"]');

// 가입하기 버튼 클릭 시 이벤트 핸들러를 추가합니다.
submitButton.addEventListener('click', function (event) {
event.preventDefault();

    let errorMessages = [];
	
	// 함수를 사용하여 필드에 포커스를 주는 함수를 정의합니다.
	 checkDuplicateMemberID();
function focusOnField(field, isInvalid) {
    if (isInvalid) {
        field.focus();
        field.style.border = '1px solid red'; // 포커스를 받은 필드에 시각적으로 강조 효과를 줄 수 있습니다.
    } else {
        field.style.border = ''; // 유효한 경우 테두리를 초기화
    }
}

// 아이디 필드 유효성 검사
if (idField.value === '') {
    errorMessages.push('아이디를 입력하세요.');
    focusOnField(idField, true); // 유효하지 않음
    return;
} else {
    focusOnField(idField, false); // 유효함
}

// 비밀번호 필드 유효성 검사
if (passwordField.value === '') {
    errorMessages.push('비밀번호를 입력하세요.');
    focusOnField(passwordField, true); // 유효하지 않음
} else {
    focusOnField(passwordField, false); // 유효함
}

// 비밀번호 재확인 필드 유효성 검사
if (confirmPasswordField.value === '') {
    errorMessages.push('비밀번호를 다시 확인하세요.');
    focusOnField(confirmPasswordField, true); // 유효하지 않음
} else if (passwordField.value !== confirmPasswordField.value) {
    errorMessages.push('비밀번호가 일치하지 않습니다.');
    focusOnField(confirmPasswordField, true); // 유효하지 않음
    return;
} else {
    focusOnField(confirmPasswordField, false); // 유효함
}

// 이름 필드 유효성 검사
if (nameField.value === '') {
    errorMessages.push('이름을 입력하세요.');
    focusOnField(nameField, true); // 유효하지 않음
    return;
} else {
    focusOnField(nameField, false); // 유효함
}

// 주소 필드 유효성 검사
if (addressField.value === '') {
    errorMessages.push('주소를 입력하세요.');
    focusOnField(addressField, true); // 유효하지 않음
    return;
} else {
    focusOnField(addressField, false); // 유효함
}

// 인증번호 입력 필드 유효성 검사
if (telNumberField.value === '') {
    errorMessages.push('인증번호를 입력하세요.');
    focusOnField(telNumberField, true); // 유효하지 않음
    return;
} else {
    focusOnField(telNumberField, false); // 유효함
}


    // 에러 메시지가 있으면 경고창을 띄우고 폼 제출을 막습니다.
    if (errorMessages.length > 0) {
        event.preventDefault(); // 폼 제출 막음

        // 에러 메시지를 하나의 문자열로 결합합니다.
        const errorMessage = errorMessages.join('\n');

        // 경고 창을 띄웁니다.
        alert(errorMessage);
    }
    var address = $('#sample6_postcode').val() + '|' + $('#sample6_address').val()
    console.log(address)
    $('#realdata_address').val(address)
});
$(document).ready(function(){
          $(".idd").blur(checkDuplicateMemberID);
       });
       
       function checkDuplicateMemberID(){
          $.ajax({
              url: "/app/member/id/duplicate",
              type: "POST",
              data: {
                 id: $(".idd").val()
              },
              success: function(data){
                 $("#id_check").text(data.text);
              },
              error: function(){
                  alert("err");
              }
          });
       }
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


function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
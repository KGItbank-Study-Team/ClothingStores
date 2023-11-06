/*function toggleHiddenContent() {
    var hiddenContent = document.getElementById('hiddenContent03');
    if (hiddenContent.style.display === 'none' || hiddenContent.style.display === '') {
        hiddenContent.style.display = 'block'; // 숨겨진 콘텐츠를 표시
        document.querySelector('.btn').textContent = '주문자 정보 ▲';
    } else {
        hiddenContent.style.display = 'none'; // 숨겨진 콘텐츠를 숨김
        document.querySelector('.btn').textContent = 'ssss'
        }
}
*/
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
    var client = document.querySelector('.iddd').value;
    var email = document.querySelector('.userpw').value;
    var phonenum1 = document.querySelector('.field.birth input:nth-child(1)').value;
    var phonenum2 = document.querySelector('.field.birth input:nth-child(2)').value;
    var phonenum3 = document.querySelector('.field.birth input:nth-child(3)').value;
    // 다른 필드도 유사하게 추가합니다.
	 if (client === "" || email === "" || phonenum1 === "" || phonenum2 === "" || phonenum3 === "") {
        alert("필수 입력 필드를 모두 작성해주세요.");
        return false;
    }
    if (phonenum1 === "" || phonenum2 === "" || phonenum3 === "") {
        alert("휴대 전화를 모두 작성해주세요.");
        return false;
    }
    if (newJasaeAddr === "") {
        alert("상세 주소를 입력해주세요.");
        return false;
    }
    if (name === "") {
        alert("보내는 분 성함을 입력해주세요.");
        return false;
    }
    if (email === "") {
        alert("이메일를 입력해주세요.");
        return false;
    }
    if (newbasicaddr === "") {
        alert("기본 주소를 입력해주세요.");
        return false;
    }
    
    return true;
}
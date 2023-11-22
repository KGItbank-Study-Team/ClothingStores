// 체크박스 전체선택 (위시리스트)
function selectAll(selectAll)  {
    const checkboxes 
         = document.getElementsByName('wish_idx');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = selectAll.checked;
    })
  }

// 주소찾기
function searchAddress() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 우편번호와 주소 정보를 가져온 후 폼에 채우기
                document.getElementById('address_zip1').value = data.zonecode;
                document.getElementById('address_addr1').value = data.address;
                document.getElementById('address_addr2').value = '';
            }
        }).open();
    }
    

// submit 추가

function subMit() {
        //유효성 검사

    // HTML에서 필드 요소 가져오기
    const nameField = document.getElementById('ma_rcv_name');
    const addressField = document.getElementById('address_addr1');

    // 에러 메시지를 담을 배열
    const errorMessages = [];

    // 이름 필드 유효성 검사
    if (nameField.value.trim() === '') {
        errorMessages.push('성명을 입력하세요.');
    }

    // 주소 필드 유효성 검사
    if (addressField.value.trim() === '') {
        errorMessages.push('주소를 입력하세요.');
    }

    // 에러가 있을 경우 처리
    if (errorMessages.length > 0) {
        // 에러 메시지 출력
        alert('유효성 검사에 실패하였습니다:\n' + errorMessages.join('\n'));

        // 페이지 이동 막기
        return false;
    }

 
        // 폼 제출
        document.getElementById("myForm").submit();
    }

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
    
    //주소삭제
function deleteSelectedAddresses() {
        var selectedAddresses = [];
        $("input[name='wish_idx']:checked").each(function () {
            selectedAddresses.push($(this).val());
        });

        if (selectedAddresses.length === 0) {
            alert('선택된 주소가 없습니다.');
            return;
        }

        if (confirm('선택한 주소를 삭제하시겠습니까?')) {
            // AJAX를 이용하여 선택한 주소들을 삭제하는 요청
            $.ajax({
                type: 'POST',
                url: '/app/member/myPage/addr',
                data: { selectedAddresses: selectedAddresses },
                success: function (data) {
                    // 삭제 성공 시, 페이지를 리로드 또는 다른 작업 수행
                    location.reload(); // 예시로 페이지 리로드
                },
                error: function () {
                    alert('주소 삭제에 실패했습니다.');
                }
            });
        }
    }

//쿠폰등록
function coupon_code_submit() {
    // 입력 필드에서 쿠폰 코드 가져오기
    var couponCode = document.getElementById('coupon_code').value;

    // AJAX를 사용하여 서버에 쿠폰 코드 전송
    $.ajax({
        type: "POST",
        url: "/app/member/register/coupon",
        data: { code: couponCode },
        success: function(response) {
            // 서버에서 받은 응답 처리
            if (response.success) {
                alert(response.success);
                // 성공적으로 쿠폰이 등록된 경우 추가 작업 수행
            } else {
                alert(response.failed);
                // 쿠폰 등록에 실패한 경우 사용자에게 알림
            }
        },
        error: function() {
            // AJAX 요청 실패 시 처리
            alert("쿠폰 등록 중 오류가 발생했습니다. 슈발");
        }
    });
}

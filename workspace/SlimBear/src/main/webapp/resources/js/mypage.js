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
    document.getElementById("deleteAddressForm").submit();
}

//쿠폰등록
function registerCoupon() {
    var couponCode = document.getElementById('coupon_code').value;

    $.ajax({
        type: 'POST',
        url: '/app/member/register/coupon',
        data: {
            code: couponCode
        },
        success: function (response) {
            if (response.success) {
                // 쿠폰 등록 성공 시 원하는 동작 수행
                alert('쿠폰이 정상적으로 등록되었습니다.');

                // 서버 응답을 받은 후 페이지 리로드
                location.reload();

            } else {
                // 쿠폰 등록 실패 시 원하는 동작 수행
                alert('쿠폰 등록에 실패했습니다. 이유: ' + response.failed);
            }
        },
        error: function (xhr, status, error) {
            // HTTP 요청 실패 시 원하는 동작 수행
            alert('쿠폰 등록 중에 오류가 발생했습니다. 이유: 이미 등록된 쿠폰입니다.');
        }
    });
}



// 위시리스트에서 아이템 삭제를 위한 함수
function deleteSelectedItems() {
    var selectedItems = [];
    $("input[name='wish_idx']:checked").each(function () {
        selectedItems.push($(this).val());
    });

    if (selectedItems.length > 0) {
        // 선택된 아이템을 form 데이터로 설정
        $("#deleteWishForm").append('<input type="hidden" name="uids" value="' + selectedItems.join(',') + '">');
        
        // form을 서버로 전송
        $("#deleteWishForm").submit();
    } else {
        alert('삭제할 아이템을 선택해주세요.');
    }
}

//문의게시판 분류
function filterRows() {
      var selectedOption = document.getElementById("board_sort").value;
      var rows = document.querySelectorAll('.center tr');

      rows.forEach(function(row) {
        var boardGroup = row.querySelector('td:nth-child(2)').textContent.trim();

        if (selectedOption === '전체보기' || boardGroup === selectedOption) {
          row.style.display = '';
        } else {
          row.style.display = 'none';
        }
      });
    }

//리뷰관리 페이징
function changePage(page) {
    // 페이지 변경 로직 구현
    // 페이지 변경 시 필요한 데이터를 컨트롤러로 전송하고, 필요한 처리를 수행
    // 예: window.location.href = "/app/member/myPage/reviewList?page=" + page;
    
    // 이 예시에서는 alert를 사용하여 페이지 변경 여부 확인
    alert("Change to page: " + page);
    
    // 페이지 변경 시 현재 페이지의 클래스 변경
    var currentPageElements = document.getElementsByClassName('this');
    for (var i = 0; i < currentPageElements.length; i++) {
        currentPageElements[i].classList.remove('this');
    }
    
    // 선택된 페이지에 'this' 클래스 추가
    var selectedPageElement = document.querySelector('.xans-record-:nth-child(' + page + ') a');
    selectedPageElement.classList.add('this');
}

//주문내역 달력
$(document).ready(function () {
    function toggleDatePicker(inputId) {
        var datePicker = $("#" + inputId);

        if (datePicker.datepicker("widget").is(":visible")) {
            datePicker.datepicker("hide");
        } else {
            datePicker.datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: false, //월 설정
                changeYear: false,	//년도 설정
                showAnim: 'slideDown', // 위아래로 슬라이드 효과
                duration: 500 // 슬라이드 지속 시간 (밀리초)
            }).datepicker("show");
        }
    }

    $("#start_date_button").on("click", function () {
        toggleDatePicker("start_date");
    });

    $("#end_date_button").on("click", function () {
        toggleDatePicker("end_date");
    });
});


// 리뷰 작성 창
$(document).ready(function(){
    $('#openWriteForm').click(function(){
        var windowFeature = 'width=420, height=790, top=' + (screen.height / 2) + '.left=' + (screen.width / 2) + ', resizable=no';

        window.open('/app/member/reviewWrite', '후기 작성', windowFeature);
    })
});

function memberEditAction(){

    var password = $('#passwd').val();
    if(password != null && password != ''){
        if( $('#passwd').val() != $('#user_passwd_confirm').val()) {
            alert('비밀번호 확인이 일치하지 않습니다.')
            return;
        }
    }
    
    if(password != null && password != ''){
        var passinput = $('<input type="hidden" name="password"></input>')
        passinput.val(password);
        $('#editForm').append(passinput);
    }
   
    $('#editForm').submit();
}

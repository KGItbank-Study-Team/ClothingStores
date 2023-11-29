$(function(){
    $('.select_coupon').on('change', function(){
        var selectCouponUid = $(this).val();

        $.ajax({
            url : '/app/order/coupon/apply',
            type : 'POST',
            data : {
                couponUID : selectCouponUid
            },
            success : function(res){
                $('.payment-pay-amount').text(res.paymentAmount);
                alert("쿠폰적용완료");
            },
            error : function(error){
                alert("error");
            }
        });

    });

    $('.btn-mileage-apply').on('click', function(){
        var mileage = $('.mileage-apply').val();

        $.ajax({
            url : '/app/order/mileage/apply',
            type : 'POST',
            data : {
                mileage : mileage
            },
            success : function(res){
                if(res.failed != undefined){
                    alert(res.failed);
                    $('.mileage-apply').val(0);
                }
                else{
                    alert("마일리지 적용완료");
                    $('.payment-pay-amount').text(res.paymentAmount);
                }
           },
            error : function(error){
                alert("error");
            }
        });

    });

});

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
    
 function validateForm() {
            // 여기에 JavaScript 유효성 검사 로직을 추가하세요
            // 필요한 변수와 로직을 작성하세요
            const nameField = document.querySelector('.placehold-textt input[name="name"]');
            const newBasicAddrField = document.querySelector('.field.tel-number input[name="newbasicaddr"]');
            const newJasaeAddrField = document.querySelector('.field.tel-number input[name="newjasaeaddr');
            
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




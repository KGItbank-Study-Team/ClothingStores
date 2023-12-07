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
            $('#postcode1').val(data.zonecode);
            $('#addr1').val(data.address);
            $('#addr2').val("");
        }
    }).open();
}

function searchAddressOnAddr() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 우편번호와 주소 정보를 가져온 후 폼에 채우기
            $('#address_zip1').val(data.zonecode);
            $('#address_addr1').val(data.address);
            $('#address_addr2').val("");
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
                window.location.reload();

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

    $('#start_date').on('change', function(){
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();
    
        if(start_date != null && start_date != "" && end_date != null && end_date != ""){
            start_date = new Date(start_date);
            end_date = new Date(end_date);
            if(start_date > end_date){
                $('#start_date').val($('#end_date').val());
            }
        }
    });

    $(' #end_date').on('change', function(){
        var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();
    
        if(start_date != null && start_date != "" && end_date != null && end_date != ""){
            start_date = new Date(start_date);
            end_date = new Date(end_date);
            if(start_date > end_date){
                $('#end_date').val($('#start_date').val());
            }
        }
    });
    submitOrderSearch();
});


// 리뷰 작성 창
$(document).ready(function(){
    $('#openWriteForm').click(function(){
        openPopup('/app/member/reviewWrite', '후기 작성', 420, 790);
    });

    submitOrderSearch();
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

function submitOrderSearch(){
    var start_date = $('#start_date').val();
    var end_date = $('#end_date').val();

    var searchType = $('#order_status').val();
    var searchStartDate = null;
    var searchendDate = null;

    if(start_date != null && start_date != ""){
        searchStartDate = new Date(start_date);
        searchStartDate.setHours(0);
    }
    if(end_date != null && end_date != ""){
        searchendDate = new Date(end_date);
        searchendDate.setHours(0);
    }

    $.ajax({
        url : '/app/member/myPage/orderList/search',
        type : 'POST',
        data : {
            searchType : searchType,
            searchStartDate : searchStartDate != null ? searchStartDate.getTime() : null,
            searchendDate : searchendDate != null ? searchendDate.getTime() : null,
        },
        success : function(res){
            initOrderList(res.data);
        },
        error : function(error){
            alert("주문리스트 조회 실패");
        }
    })
}

function openPopup(url, name, width, height){
    var status = 'scrollbars=no,resizable=no,width=' + width + ',height=' + height + ',' + 'top=' + ((screen.height-height) / 2) + ', left=' + ((screen.width - width) / 2) +"'";
    var popupWindow= window.open(url, name, status);
	popupWindow.onresize = (_=>{
	    popupWindow.resizeTo(width + 16, height + 73);
	})
}

function openOrderCancle(orderUID){
    localStorage.setItem("cancel_order_uid", orderUID);
    openPopup('/app/member/myPage/orderList/cancel','주문 취소 신청',700, 230);
}

function openOrderReturn(orderUID){
    localStorage.setItem("return_order_uid", orderUID);
    openPopup('/app/member/myPage/orderList/return','반품 신청',700, 230);
}

function openReviewWrite(orderUID, productCode, cnt){
    console.log("리뷰창 " + productCode);
    console.log(cnt);
    //localStorage.setItem("review_order_uid", orderUID);
     $.ajax({
        type: "POST", 
        url: "/app/member/reviewWrite/" + orderUID + "/" + productCode + "/" + cnt,
        //data: {productCode : productCode},
        success: function (data) {
            console.log("리뷰 작성 페이지로 이동");
            openPopup("/app/member/reviewWrite/" + orderUID + "/" + productCode + "/" + cnt, '후기 작성', 420, 790);
        },
        error: function (error) {
            console.error("오류 발생: ", error);
        }
    });
}

function initOrderList(datas){
    var html = [];

    if(datas.length <= 0) {
        html.push('<div class="gKYVxm">')
        html.push('<b>주문 내역이 없습니다.</b>')
        html.push('</div>')
    }else{
       datas.forEach(function(item){
          var orderUID = item.uid;
            var orderDate = new Date(item.orderDate);
            var orderStatus = item.status;
            var orderProductList = item.productList;

            var statusENUM = {
                STAY : '주문대기',
                PREPARING : '제품 준비',
                STAY_DLV : '배송 대기',
                DELIVERY : '배송',
                DONE : '완료',
                CANCEL : '취소',
                
                RETURN : '반품'
            };
            html.push('<div class="gKYVxm">')
            html.push('<div class="kcHmyx">');
            html.push('<div class="kSZYgn">' + statusENUM[orderStatus]+ '  (' + orderDate.getFullYear() +'/'+ (orderDate.getMonth()+1) +'/'+ orderDate.getDate() + '  ' + orderDate.toLocaleTimeString() + ')</div>');
            html.push('<div class="kcHmyx">');

            if(orderStatus == 'STAY' || orderStatus == 'PREPARING'|| orderStatus == 'STAY_DLV')
                html.push('<button onclick="openOrderCancle(' + orderUID +')" class="fTrGbC kiiuoA">취소 신청</button>')
            if(orderStatus == 'DELIVERY' || orderStatus == 'DONE')
                html.push('<button onclick="openOrderReturn(' + orderUID +')" class="fTrGbC kiiuoA">반품 신청</button>')

            html.push('</div>')
            html.push('<div class="kThsCL">');
            html.push('<a href="/app/member/myPage/orderList/detail?orderUID=' + orderUID +'" class="gSIruC">주문 상세보기</a>');
            html.push('<svg width="16" height="16" focusable="false" viewBox="0 0 16 16" aria-hidden="true" role="presentation" style="fill: rgb(0, 0, 0); vertical-align: middle; height: 100%;">');
            html.push('<path fill="#346aff" fill-rule="nonzero" d="M11.057 8L5.53 13.529c-.26.26-.26.682 0 .942.26.26.682.26.942 0l6-6c.26-.26.26-.682 0-.942l-6-6c-.26-.26-.682-.26-.942 0-.26.26-.26.682 0 .942L11.057 8z"></path></svg></div></div>');
            
            orderProductList.forEach(function(product){
                var main_image = product.main_image;
                var name = product.name;
                var option = product.desc;
                var price = product.price;
                var cnt = product.cnt;
                var productUid = product.productUid;
                var productCode = product.prodCode;
                var reviewUID = product.reviewUID;
                console.log(productCode);

                html.push('<div class="hCVtNj"><table class="sc-gnmni8-1 eSpcfO"><colgroup><col width="600"><col width=""></colgroup>');
                html.push('<tbody class="sc-gnmni8-2 hryMPB"><tr class="sc-gnmni8-3 gmGnuU"><td class="hUzAOG"><div class="bQVZKC"><div class="sc-ki5ja7-1 krPkOP"></div></div>');
                html.push('<div class="sc-1jiyjbz-0 dGiGeF"><div class="kCcQTc"><div class="gLgexz"><div class="cNiGzR"><div class="eEDOvs"><a href="/app/product?p=' + productUid + '"><img loading="lazy" width="64" height="64" ');
                html.push('src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/' + main_image + '"></a></div>');
                html.push('<div class="bmwSdh"><div class="jBCCpd"><a href="/app/product?p=' + productUid + '" class="yma-DD hPjYZj"><span color="#111111" class="ifMZxv">' + name + '</span></a>');
                html.push('<a href="/app/product?p=' + productUid + '" class="yma-DD hPjYZj"><span color="#111111" class="ifMZxv">' + option + '</span></a>');
                html.push('<a class="yma-DD iDQVMP"><div class="sc-8q24ha-3 gFbjJh"><div class="jxRaeI"><span font-weight="normal" color="#555555"');
                html.push('class="eDgzyT">' + price +'원</span> <span class="kYtEGM"> <span class="joIhoV"></span>');
                html.push('</span> <span class="jtWNEg">' + cnt + '개');
                html.push('</span></div></div></a><div class="igPkOG"></div></div></div></div></div></div></div></td><td class="gbTJl"><div class="bCQoer">');
                html.push('<button class="fUUUKW iiEWkt" onclick="location=' + "'/app/order/delivery'" +'">배송조회</button>');
                if(orderStatus == 'DONE'){
                    if(reviewUID == null){
                        html.push('<button class="fTrGbC kiiuoA" id="openWriteForm" onclick="openReviewWrite(' + orderUID + ',\'' + productCode + '\',' + cnt + ')">리뷰 작성하기</button>');
                    }else{
                        html.push('<button class="fTrGbC kiiuoA" id="openWriteForm">리뷰 작성완료</button>')
                    }
                }else{
                    html.push('<button class="fTrGbC kiiuoA" id="openWriteForm">배송 미완료</button>')
                }
                html.push('</div></td></tr></tbody></table></div>');
            });

            html.push('</div>');
        });
    }

    var orderList = $('#order-list');
    if(orderList != null){
        orderList.html(html.join(''));
    }
}


function orderCancel(reason){
    var orderUID = localStorage.getItem("cancel_order_uid");
    localStorage.removeItem("cancel_order_uid");

    $.ajax({
        url : '/app/order/cancel',
        type : 'POST',
        data : {
            orderUID : orderUID,
            reason : reason
        },
        success : function(res){
            if(res.success){
                submitOrderSearch();
                alert(res.success)
            }else{
                alert(res.failed)
            }
        },
        error : function(error){
            alert('취소 실패');
        }
    });
}


function orderReturn(reason){
    var orderUID = localStorage.getItem("return_order_uid");
    localStorage.removeItem("return_order_uid");

    $.ajax({
        url : '/app/order/return',
        type : 'POST',
        data : {
            orderUID : orderUID,
            reason : reason
        },
        success : function(res){
            if(res.success){
                submitOrderSearch();
                alert(res.success)
            }else{
                alert(res.failed)
            }
        },
        error : function(error){
            alert('반품 실패');
        }
    });
}
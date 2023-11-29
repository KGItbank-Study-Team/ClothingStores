// 옵션값을 담을 배열과 변수 선언
var selectOptionList = new Array();
var selectedColor = null;
var selectedSize = null;
var cnt = 1;
var productPrice = document.getElementById('productPrice').value;
var totalPrice = null;

// 상품 색상, 사이즈 옵션 선택
$(function () {
    $(".colorBtn").on("click", function () {
        if ($(this).hasClass("active")) {
            // 이미 선택한 상태라면 해제
            selectedColor = null;
            $(this).removeClass("active");
        } else {
            // 새로 선택한 옵션 처리
            $(".colorBtn").removeClass("active");
            $(this).addClass("active");
            selectedColor = $('.colorBtn').text();
            updateSelection($(this).find(".colorOption").text(), selectedSize);
        }
    });

    $(".sizeBtn").on("click", function () {
        if (selectedColor == null) {
            alert('색상 옵션을 선택해주세요.');
        } else if ($(this).hasClass("active2")) {
            // 이미 선택한 상태라면 해제
            selectedSize = null;
            $(this).removeClass("active2");
        } else {
            // 새로 선택한 옵션 처리
            $(".sizeBtn").removeClass("active2");
            $(this).addClass("active2");
            selectedSize = $('.sizeBtn').text();
            updateSelection(selectedColor, $(this).find(".sizeOption").text());
        }
    });


    // 행을 생성하고 선택한 옵션 값을 설정
    function addRowToTable(color, size, cnt) {
        var newRow = $("<tr id=" + makeProductElementID(color, size) + "></tr>");
        newRow.append($('<td class="tdOption"></td>').text(selectedColor));
        newRow.append($('<td class="tdOption"></td>').text(selectedSize));
        newRow.append($("<td></td>").html('<span class="quantity"><input type="text" name="pop_out" value="' + cnt + '" class="inputBox">'
            + '<a href="' + "javascript:upProductCount(" + makeColorAndSizeText(color, size) + ')"><img alt="수량증가" class="countUp" src="/resources/images/btn_count_up.gif"></a>'
            + '<a href="' + 'javascript:downProductCount(' + makeColorAndSizeText(color, size) + ')"><img alt="수량감소" class="countDown" src="/resources/images/btn_count_down.gif"></a>'
            + '</span><a href="' + 'javascript:removeProduct(' + makeColorAndSizeText(color, size) + ')" class="deleteBtn"><img alt="삭제" src="/resources/images/icon_delete.png" class="deleteImg"/></a>'));
        newRow.append($('<td><div class="tdCell">' + productPrice + '</div></td>'));

        $(".choiceOption").append(newRow);
    }
    function updateSelection(color, size) {
        beforeColor = selectedColor;
        beforesize = selectedSize;
        selectedColor = color;
        selectedSize = size;

        if (selectedColor != null && selectedSize != null) {
            if (beforeColor != color || beforesize != size) {
                var index = findProductIndexByOption(color, size);
                if (index == -1) {
                    // 이미 추가한 옵션이 아니면 새로 추가
                    selectOptionList.push({ color: selectedColor, size: selectedSize, cnt: 1, prod_Uid : prod_code });
                    addRowToTable(selectedColor, selectedSize, 1);
                }
                else {
                    // 이미 추가한 옵션이면 막음
                    alert("이미 선택한 옵션입니다");
                }
            }
        }
    }
});
// 옵션 리스트 결제페이지로 슝~
function addInput() {
    for (var i = 0; i < selectOptionList.length; i++) {
        var optionList = selectOptionList[i];
        console.log("optionList: " + optionList);
        var colorInput = document.createElement("input");
        colorInput.type = "hidden";
        colorInput.id = "color" + i;
        colorInput.name = "optionsList[" + i + "].color";
        colorInput.value = optionList.color;

        var sizeInput = document.createElement("input");
        sizeInput.type = "hidden";
        sizeInput.id = "size" + i;
        sizeInput.name = "optionsList[" + i + "].size";
        sizeInput.value = optionList.size;

        var cntInput = document.createElement("input");
        cntInput.type = "hidden";
        cntInput.id = "cnt" + i;
        cntInput.name = "optionsList[" + i + "].cnt";
        cntInput.value = optionList.cnt;

        var prodUIdInput = document.createElement("input");
        cntInput.type = "hidden";
        cntInput.name = "prod_Uid";
        cntInput.value = prod_code;

        $("#buyForm").append(colorInput);
        $("#buyForm").append(sizeInput);
        $("#buyForm").append(cntInput);
        $("#buyForm").append(prodUIdInput);


    }
    $("#buyForm").submit();
    console.log("optionList: " + optionList);
    //window.location.href = "/order/product";
};
function makeProductElementID(color, size) {
    return "product_" + color + "_" + size;
}

function makeColorAndSizeText(color, size) {

    return "'" + color + "','" + size + "'";
}

function findProductIndexByOption(color, size) {
    for (var i = 0; i < selectOptionList.length; i++) {
        if (selectOptionList[i].color === color && selectOptionList[i].size === size) {
            return i;
        }
    }
    return -1;
}

function removeProduct(color, size) {
    var index = findProductIndexByOption(color, size);

    if (index < 0 || index >= selectOptionList.length)
        return;

    var productElement = $('tr#' + makeProductElementID(color, size));

    selectOptionList.splice(index, 1);
    productElement.remove();
}

function upProductCount(color, size) {

    var index = findProductIndexByOption(color, size);

    if (index < 0 || index >= selectOptionList.length)
        return;


    var productElement = $('tr#' + makeProductElementID(color, size));

    // 데이터 변경 및 화면 값 변경
    selectOptionList[index].cnt += 1;

    productElement.find(".inputBox").val(selectOptionList[index].cnt);
}

function downProductCount(color, size) {
    var index = findProductIndexByOption(color, size);

    if (index < 0 || index >= selectOptionList.length || selectOptionList[index].cnt <= 1)
        return;


    var productElement = $('tr#' + makeProductElementID(color, size));

    // 데이터 변경 및 화면 값 변경
    selectOptionList[index].cnt -= 1;
    productElement.find(".inputBox").val(selectOptionList[index].cnt);
}
// 현재 페이지의 URL을 가져온다.
var currentUrl = window.location.href;
// URL에서 "p" 파라미터값을 추가한다.
var urlParams = new URLSearchParams(currentUrl.search);
var prod_code = urlParams.get("p");
// 장바구니 추가 기능
function addCart(uid) {
    //console.log(selectOptionList); // 테스트 출력
    console.log("prod_code", uid);
    $.ajax({
        url: "/app/insert/cart/" + uid,
        type: "POST",
        data: { selectOptionList: selectOptionList },
        success: function (result) {
            if (result.trim() === "add_success") {
                $('.popUp').css('display', 'block');

            } else {
                alert("동일한 상품이 장바구니에 있습니다.")
            }
        },
        error: function (request, status, error) {
            console.log("request:", request);
            console.log("status:", status);
            console.log("error:", error);
            alert('로그인 후 이용 가능합니다.');
            setTimeout(function () {
                window.location.href = "/app/login"
            })
        }
    });
};
// 결제 버튼 클릭 시 장바구니에 자동 추가
function buyClick(uid) {
    $.ajax({
        url: "/app/insert/payCart/" + uid,
        type: "POST",
        data: { selectOptionList: selectOptionList },
        success: function (arr) {
            var cartList = arr; // JSON.stringify를 사용하지 않음
            alert("선택된 옵션 리스트: " + JSON.stringify(selectOptionList));
            var matchingOptions = 0; // 동일한 옵션이 장바구니에 몇 개 있는지 추적하는 변수
            var matchingIndex = -1; // 일치하는 옵션의 인덱스를 추적하는 변수

            for (var i = 0; i < selectOptionList.length; i++) {
                console.log("color: " + cartList[i].color, "size: " + cartList[i].size + " cnt: " + cartList[i].cnt);

                if (cartList[i].color === selectOptionList[i].color && cartList[i].size === selectOptionList[i].size) {
                    // 동일옵션의 상품이 장바구니에 있음
                    matchingOptions++;
                    matchingIndex = i;
                }
            }

            if (matchingOptions > 0) {
                // 동일한 옵션의 상품이 하나 이상 있는 경우
                var userConfirm = confirm("동일한 상품이 장바구니에 있습니다. 함께 구매하시겠습니까? \n\n '취소'를 누를 경우 현재 선택한 수량만 구매됩니다.");
                if (userConfirm) {
                    // '확인' 클릭 시
                    selectOptionList[matchingIndex].cnt = cartList[matchingIndex].cnt;
                    alert("최종 옵션 리스트 : " + JSON.stringify(selectOptionList));
                    addInput();
                } else {
                    // '취소' 클릭 시
                    // 해당 옵션의 cnt를 원래 값으로 복원
                    selectOptionList[matchingIndex].cnt = cartList[matchingIndex].cnt - selectOptionList[matchingIndex].cnt;
                    console.log('selectOptionList: ' + JSON.stringify(selectOptionList));
                    alert("취소 클릭 시 옵션 리스트: " + JSON.stringify(selectOptionList));
                    addInput();
                }
            } else {
                // 동일한 옵션의 상품이 없는 경우
                alert("동일 옵션 없음: " + JSON.stringify(selectOptionList));
                addInput();
            }
        },
        error: function (request, status, error) {
            console.log("request:", request);
            console.log("status:", status);
            console.log("error:", error);
            alert("결제 ajax 에러");
        }
    });
}



// 장바구니 추가 관련 팝업창
$(function () {
    $(".keepShop").on("click", function () {
        $('.popUp').css('display', 'none');
    })
});
// 위시 리스트 추가
function addWish(uid) {
    $.ajax({
        url: "/app/insert/wish/" + uid,
        type: "POST",
        data: uid,
        success: function (result) {
            if (result.trim() === "add_success") {
                alert("위시리스트에 추가되었습니다.");
            } else {
                alert("이미 추가된 상품입니다.")
            }
        },
        error: function (request, status, error) {
            console.log("request:", request);
            console.log("status:", status);
            console.log("error:", error);
            alert('!!Error!!');
        }
    });
};
// GUIDE 정보 펼치고 접기
$(document).ready(function () {
    $("h2").click(function () {
        var submenu = $(this).next("div");

        // submenu가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if (submenu.is(":visible")) {
            submenu.slideUp();
        } else {
            submenu.slideDown();
        }
        // $(this).next("div").toggleClass("guideText");
    });
});
// 문의제목 클릭 -> 문의 내용 출력
$(document).ready(function () {
    $(".clickTitle").click(function () {
        var content = $(this).closest("tbody").find(".inquiryContent");

        if (content.is(":visible")) {
            content.slideUp();
        } else {
            content.slideDown();
        }
    });

});



// 리뷰 페이징
// $(document).ready(function () {
//     // 리뷰를 비동기적으로 불러오는 함수
//     function loadReviews(pageNumber) {
//         var urlParams = new URLSearchParams(window.location.search);
//         var uid = urlParams.get("p");
//         $.ajax({
//             type: 'GET',
//             url: '/app/product/getReview/' + uid, // 리뷰를 가져올 URL
//             data: { p: uid, page: pageNumber }, // 해당 페이지 번호를 서버에 전달
//             success: function (reviewList) {
//                 alert('success');
//                 console.log('reviewList: ' + JSON.stringify(reviewList));
//                 for (var i = 0; i < reviewList.length; i++) {
//                     console.log(reviewList[i].mem_id, reviewList[i].score, reviewList[i].reg_date, reviewList[i].content);
//                 }

//                 // 서버로부터 받은 리뷰 데이터를 표시하는 부분의 id나 class에 따라 수정
//                 var reviewsHtml = ''; // 리뷰를 담을 변수
//                 var reviewsPerPage = 5; // 페이지당 표시될 리뷰 수

//                 // 서버에서 받은 리뷰 데이터를 반복하여 HTML에 추가
//                 for (var i = 0; i < Math.min(reviewList.length, reviewsPerPage); i++) {
//                     // 리뷰 하나의 HTML을 생성하여 변수에 추가
// reviewsHtml += '<div class="review-section">' +
//     '<div class="info">' +
//     '<div>' +
//     '<span>' + reviewList[i].mem_id + '</span>' +
//     '<div>' +
//     '<p>' + reviewList[i].reg_date + '</p>' +
//     '</div>' +
//     '</div>' +
//     '<div class="review-score">' +
//     '<i class="far fa-star"></i>' + reviewList[i].score +
//     '</div>' +
//     '<input type="hidden" id="reviewList" value="' + reviewList[i].score + '"/>' +
//     '</div>' +
//     '<div class="photo-review">' +
//     '<a><img alt="상품" src="/resources/images/review_images01.jpg"></a>' +
//     '<a><img alt="상품" src="/resources/images/review_images02.jpg"></a>' +
//     '<a><img alt="상품" src="/resources/images/review_images03.jpg"></a>' +
//     '<a><img alt="상품" src="/resources/images/review_images04.jpg"></a>' +
//     '<a><img alt="상품" src="/resources/images/review_images05.jpg"></a>' +
//     '</div>' +
//     '<div class="review-text">' +
//     '<div>' + reviewList[i].content + '</div>' +
//     '</div>' +
//     '</div>';
//                 }
//                 // 리뷰를 표시하는 부분의 id나 class를 정확히 지정하여 수정
//                 // 선택한 요소의 내용을 지정한 HTML로 설정
//                 $('.review-section').html(reviewsHtml);
//                 // 페이징을 동적으로 추가
//                 addPaging(pageIndex, pageSize, totCnt);
//                 console.log('addPaging: ' + JSON.stringify(reviewList.pageIndex), JSON.stringify(reviewList.pageSize), JSON.stringify(reviewList.totCnt));
//             },
//             error: function (error) {
//                 alert(error + '에러가 났습니다.');
//             }
//         });
//     }
//     // 리뷰점수를 별모양으로 표시
//     window.onload = function () {
//         // showScoreByStars 함수에서 reviewScore 변수 사용
//         function showScoreByStars() {
//             const Score = Math.round(reviewScore);
//             const reviewScoreElements = document.getElementsByClassName('review-score');

//             // 각 리뷰에 대해 실행
//             for (let j = 0; j < reviewScoreElements.length; j++) {
//                 const stars = reviewScoreElements[j].getElementsByTagName('i');

//                 // 기존 클래스 초기화l
//                 for (let i = 0; i < stars.length; i++) {
//                     stars[i].classList.remove('fas');
//                 }

//                 // fas 클래스 적용
//                 for (let i = 0; i < Score / 10; i++) {
//                     stars[i].classList.add('fas');
//                 }
//             }
//         }
//         // 초기 페이지 로딩 시 첫 번째 페이지의 리뷰를 표시
//         loadReviews(1);
//     };
// });
let totalData; // 총 데이터 수
let dataPerPage = 5; // 한 페이지에 나타낼 글 수
let pageCount = 5; // 페이징에 나타낼 페이지 수
let globalCurrentPage = 1; // 현재 페이지
let dataList; // 표시하려는 데이터 리스트 
$(document).ready(function () {
    var urlParams = new URLSearchParams(window.location.search);
    var uid = urlParams.get("p");
    $.ajax({
        method: 'GET',
        url: '/app/product/getReview/' + uid,
        data: uid,
        success: function (reviewList) {
            // 총 리뷰수 구하기
            totalData = reviewList.length;
            dataList = reviewList;
            //alert('dataList === ' + JSON.stringify(dataList));
            console.log('totalData: ' + totalData);

            // 목록 표시 호출(테이블 생성)
            displayData(1, dataPerPage, dataList);

            // 페이징 표시 호출
            paging(totalData, dataPerPage, pageCount, 1, dataList);
        },
        error: function (request, status, error) {
            console.log("request:", request);
            console.log("status:", status);
            console.log("error:", error);
            alert('Ajax 실행 오류');
        }
    });
});
// 목록 표시 함수
// 현재 페이지(currentPage)와 페이지 당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage, dataList) {
    alert('reviewList : ' + JSON.stringify(dataList));
    let reviewHtml = '';
    // Number로 변환하지 않으면 + 할 경우  스트링 결합 되어버림
    currentPage = Number(currentPage); //alert('currentPage = ' + currentPage);
    dataPerPage = Number(dataPerPage); //alert('dataPerPage = ' + dataPerPage);


    for (var i = (currentPage - 1) * dataPerPage; i < (currentPage - 1) * dataPerPage + dataPerPage; i++) {
        reviewHtml += '<div class="review-section">' +
            '<div class="info">' +
            '<div>' +
            '<span>' + dataList[i].mem_id + '</span>' +
            '<div>' +
            '<p>' + dataList[i].reg_date + '</p>' +
            '</div>' +
            '</div>' +
            '<div class="review-score">' +
            '<i class="far fa-star"></i>' + dataList[i].score +
            '</div>' +
            '<input type="hidden" id="reviewList" value="' + dataList[i].score + '"/>' +
            '</div>' +
            '<div class="photo-review">' +
            '<a><img alt="상품" src="/resources/images/review_images01.jpg"></a>' +
            '<a><img alt="상품" src="/resources/images/review_images02.jpg"></a>' +
            '<a><img alt="상품" src="/resources/images/review_images03.jpg"></a>' +
            '<a><img alt="상품" src="/resources/images/review_images04.jpg"></a>' +
            '<a><img alt="상품" src="/resources/images/review_images05.jpg"></a>' +
            '</div>' +
            '<div class="review-text">' +
            '<div>' + dataList[i].content + '</div>' +
            '</div>' +
            '</div>';
    }
    $('.review-section').html(reviewHtml);
}
// 페이징 표시 함수
function paging(totalData, dataPerPage, pageCount, currentPage, dataList) {
    console.log('currentPage: ' + currentPage);

    totalPage = Math.ceil(totalData / dataPerPage); // 총 페이지 수

    if (totalPage < pageCount) {
        pageCount = totalPage;
    }

    let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
    let last = pageGroup * pageCount; // 화면에 보여질 마지막 페이지 번호

    if (last > totalPage) {
        last = totalPage;
    }

    let first = last - (pageCount - 1); // 화면에 보여질 첫번째 페이지 번호
    let next = last + 1;
    let prev = first - 1;

    let pageHtml = "";

    if (prev > 0) {
        pageHtml += '<li><a href="#" id="prev"> 이전 </a></li>';
    }

    // 페이징 번호 표시
    for (var i = first; i <= last; i++) {
        if (currentPage == i) {
            pageHtml += '<li><a href="#" id="' + i + '">' + i + '</a></li>';
        } else {
            pageHtml += '<li><a href="#" id="' + i + '">' + i + '</a></li>';
        }
    }

    if (last < totalPage) {
        pageHtml += '<li><a href="#" id="next"> 다음 </a></li>';
    }

    $("#pagingul").html(pageHtml);
    let displayCount = "";
    displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
    $("#displayCount").text(displayCount);

    // 페이징 번호 클릭 이벤트
    $("#pagingul li a ").click(function () {
        var urlParams = new URLSearchParams(window.location.search);
        var uid = urlParams.get("p");
        event.preventDefault(); // 기본 동작 중단
        //alert('reviewList = ' + JSON.stringify(dataList));
        let $id = $(this).attr("id");
        selectedPage = $(this).text();

        if ($id == "next") selectedPage = next;
        if ($id == "prev") selectedPage = prev;

        // 전역변수에 선택한 페이지 번호를 담는다.
        globalCurrentPage = selectedPage;
        // 페이징 표시 재호출
        paging(totalData, dataPerPage, pageCount, selectedPage, dataList);
        // 글 목록 표시 재호출
        displayData(selectedPage, dataPerPage, dataList);
    });
}
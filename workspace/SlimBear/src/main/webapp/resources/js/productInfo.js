// 옵션값을 담을 배열과 변수 선언
var selectOptionList = new Array();
var selectedColor = null;
var selectedSize = null;
var cnt = 1;
var productPrice = document.getElementById('productPrice').value;
var totalPrice = null;
var urlParams = new URLSearchParams(window.location.search);
var uid = urlParams.get("p");


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
        console.log('선택한 옵션: ' + JSON.stringify(selectOptionList));
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
                    selectOptionList.push({ color: selectedColor, size: selectedSize, cnt: 1 });
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
function addInput(uid) {
    console.log(selectOptionList);
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
        prodUIdInput.type = "hidden";
        prodUIdInput.id = "prodUIdInput" + i;
        prodUIdInput.name = "optionsList[" + i + "].prod_Uid";
        prodUIdInput.value = uid;

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

function addCart(uid) {
    // 선택한 옵션이 있는지 확인
    if (selectOptionList.length === 0) {
        alert("상품 옵션을 선택해주세요.");
        return;
    }

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
            console.log('1. 결제 버튼 ajax 실행 성공');
            console.log("받아온 데이터 : " + JSON.stringify(arr)); //return;
            console.log("2. 선택된 옵션 리스트 : " + JSON.stringify(selectOptionList));

            var containCart = false;
            for (var i = 0; i < arr.length; i++) {
                if ('containCnt' in arr[i]) { //containCnt값이 존재하는 경우
                    containCart = true;
                    break;
                }
            }

            if (containCart) { //containCnt값이 존재하는 경우
                var msg = '동일한 상품이 장바구니에 있습니다. 같이 구매하시겠습니까? \n\n' + "'취소' 클릭 시 현재 개수만 구매합니다."
                if (confirm(msg)) {
                    //확인 클릭 시, selectOptionList의 cnt 업데이트
                    for (var i = 0; i < arr.length; i++) {
                        if (selectOptionList[i].color === arr[i].color && selectOptionList[i].size === arr[i].size) {
                            selectOptionList[i].cnt = selectOptionList[i].cnt + arr[i].containCnt;
                            console.log("3. containCnt 값 : " + JSON.stringify(arr[i].containCnt));
                            console.log("4. 변경된 개수 : " + selectOptionList[i].cnt);
                        }
                    }
                    addInput(uid);
                } else {
                    //취소 클릭
                    console.lgo("옵션 리스트 : " + JSON.stringify(selectOptionList));
                    addInput(uid);
                    console.log('옵션리스트 : ' + selectOptionList);
                }
            } else { //containCnt값이 존재하지 않는 경우
                addInput(uid);
                console.log('containCnt가 존재하지 않습니다.');
            }
        },
        error: function (request, status, error) {
            console.log("request:", request);
            console.log("status:", status);
            console.log("error:", error);
            alert("로그인 후 이용해주세요.");
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
            alert('로그인 후 이용해주세요.');
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
// $(document).ready(function () {
//     $(".clickTitle").click(function () {
//         var content = $(this).closest("tbody").find(".inquiryContent");

//         if (content.is(":visible")) {
//             content.slideUp();
//         } else {
//             content.slideDown();
//         }
//     });
// });


let totalData; // 총 데이터 수
let dataPerPage = 5; // 한 페이지에 나타낼 글 수
let pageCount = 5; // 페이징에 나타낼 페이지 수
let globalCurrentPage = 1; // 현재 페이지
let dataList; // 표시하려는 데이터 리스트 

$(document).ready(function () {

    $.ajax({
        method: 'GET',
        url: '/app/product/getReview/' + uid,
        data: uid,
        success: function (reviewList) {
            //console.log('리뷰 Ajax 성공');
            // 총 리뷰수 구하기
            totalData = reviewList.length;
            dataList = reviewList;
            //alert('dataList === ' + JSON.stringify(dataList));
            //console.log('totalData: ' + totalData);

            // 목록 표시 호출(테이블 생성)
            displayData(1, dataPerPage, dataList);

            // 페이징 표시 호출
            paging(totalData, dataPerPage, pageCount, 1, dataList);
        },
        error: function (request, status, error) {
            console.log('리뷰 Ajax 실패');
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
    //console.log('reviewList : ' + JSON.stringify(dataList));
    let reviewHtml = '';
    // Number로 변환하지 않으면 + 할 경우  스트링 결합 되어버림
    currentPage = Number(currentPage); //alert('currentPage = ' + currentPage);
    dataPerPage = Number(dataPerPage); //alert('dataPerPage = ' + dataPerPage);


    for (var i = (currentPage - 1) * dataPerPage; i < Math.min(currentPage * dataPerPage, dataList.length); i++) {
        reviewHtml += '<div class="review-section">' +
            '<div class="info">' +
            '<div>' +
            '<span>' + dataList[i].mem_id + '</span>' +
            '<div class="reg_date">' +
            '<p>' + dataList[i].reg_date + '</p>' +
            '</div>' +
            '</div>' +
            '<div class="review-score">';
        // 리뷰 점수에 따라 별표 표시
        for (var j = 1; j <= 5; j++) {
            if (j <= dataList[i].score) {
                reviewHtml += '<i class="fas fa-star"></i>'; // 채워진 별
            } else {
                reviewHtml += '<i class="far fa-star"></i>'; // 빈 별
            }
        }
        reviewHtml += '</div>' +
            '<input type="hidden" id="reviewList" value="' + dataList[i].score + '"/>' +
            '</div>' +
            '<div class="photo-review">';
        for (var k = 1; k <= 4; k++) {
            reviewHtml +=
                '<a><img alt="상품" src="/resources/images/' + dataList[i]['image' + k] + '"></a>';
        }

        reviewHtml += '</div>' +
            '<div>' +
            '<div class="reviewContent">' + dataList[i].content + '</div>' +
            '</div>' +
            '</div>';
    }
    $('.review-section').html(reviewHtml);
}
// 페이징 표시 함수
function paging(totalData, dataPerPage, pageCount, currentPage, dataList) {
    //console.log('currentPage: ' + currentPage);

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



// 문의글, 문의답변 Ajax
let totalDataInq; // 총 데이터 수
let dataPerPageInq = 5; // 한 페이지에 나타낼 글 수
let pageCountInq = 5; // 페이징에 나타낼 페이지 수
let globalCurrentPageInq = 1; // 현재 페이지
let inqList; // 상품문의 데이터 리스트 
let inqAnswerList; // 문의답변 리스트

$(document).ready(function () {
    // 상품문의데이터
    $.ajax({
        method: 'GET',
        url: '/app/product/inquiry/' + uid,
        data: uid,
        success: function (inquiryList) {
            //console.log('inquiry Ajax 실행성공');
            totalDataInq = inquiryList.length; // 총 데이터 수
            inqList = inquiryList;
            //console.log('1. 상품문의 목록 : ' + JSON.stringify(inquiryList));
            //console.log('2. 총데이터수 : ' + totalDataInq);

            // 상품답변 데이터
            $.ajax({
                method: 'POST',
                url: '/app/product/answer',
                contentType: 'application/json',
                data: JSON.stringify(inquiryList),
                success: function (answerList) {
                    //console.log('inquiryAnswer Ajax 성공');

                    inqAnswerList = answerList;
                    //console.log('inqAnswerList : ' + JSON.stringify(inqAnswerList));


                    // 목록 표시 호출(테이블 생성)
                    displayDataInq(1, dataPerPageInq, inqList, inqAnswerList);

                    // 페이징 표시 호출
                    pagingInq(totalDataInq, dataPerPageInq, pageCountInq, 1, inqList);
                },
                error: function (request, status, error) {
                    console.log('answer Ajax 실행 오류');
                    console.log("request:", request);
                    console.log("status:", status);
                    console.log("error:", error);
                }
            })


        },
        error: function (request, status, error) {
            console.log("request:", request);
            console.log("status:", status);
            console.log("error:", error);
            alert('inquiry Ajax 실행 오류');
        }
    });
});
// 목록 표시 함수
// 현재 페이지(currentPage)와 페이지 당 글 개수(dataPerPage) 반영
function displayDataInq(currentPageIng, dataPerPageInq, inqList, inqAnswerList) {

    //console.log('3. inqList : ' + JSON.stringify(inqList));
    //console.log('4. inqAnswerList : ' + JSON.stringify(inqAnswerList));

    let inquiryHtml = '';
    // Number로 변환하지 않으면 + 할 경우  스트링 결합 되어버림
    currentPageIng = Number(currentPageIng); //console.log('5. currentPage : ' + currentPageIng);
    dataPerPageInq = Number(dataPerPageInq); //console.log('6. dataPerPageInq : ' + dataPerPageInq);


    for (var i = (currentPageIng - 1) * dataPerPageInq; i < Math.min(currentPageIng * dataPerPageInq, inqList.length); i++) {
        var regDate = new Date(inqList[i].reg_date);
        var formattedRegDate = regDate.toLocaleDateString();

        inquiryHtml +=
            '<tr>' +
            '<td class="borderRemove">' + inqList[i].uid + '</td>' + //inquiry_uid
            '<td>' +
            '<div class="clickTitle">' + inqList[i].title + '</div>' +
            '</td>' +
            '<td>' + inqList[i].writer_id + '</td>' +
            '<td>' + formattedRegDate + '</td>' +
            '</tr>' +
            '<tr class="inquiryContent">' +
            '<td>&nbsp;</td>' +
            '<td class="centerNo">' +
            '<div class="contentPadding">' + inqList[i].content + '</div>' +
            '</td>' +
            '<td>&nbsp;</td>' +
            '<td>&nbsp;</td>' +
            '</tr>';
        // 답변을 찾아서 출력
        var matchingAnswers = inqAnswerList.filter(answer => answer.inqr_uid === inqList[i].uid);
        for (var j = 0; j < matchingAnswers.length; j++) {
            var answerRegDate = new Date(matchingAnswers[j].reg_date);
            var formattedAnswerRegDate = answerRegDate.toLocaleDateString();

            inquiryHtml += '<tr>' +
                '<td>&nbsp;</td>' +
                '<td>' +
                '<div class="clickAnswer">' + matchingAnswers[j].title +
                '</div>' +
                '</td>' +
                '<td>슬림베어🐻</td>' +
                '<td>' + formattedAnswerRegDate + '</td>' +
                '</tr>' +
                '<tr class="answerContent">' +
                '<td>&nbsp;</td>' +
                '<td class="centerNo">' +
                '<div>' + matchingAnswers[j].content + '</div>' +
                '</td>' +
                '<td>&nbsp;</td>' +
                '<td>&nbsp;</td>' +
                '</tr>';
        }
    }

    $('.inquiry').html(inquiryHtml);
}
// 페이징 표시 함수
function pagingInq(totalDataInq, dataPerPageInq, pageCountInq, currentPageIng, inqList) {
    //console.log('7. currentPage: ' + currentPageIng);

    totalPageInq = Math.ceil(totalDataInq / dataPerPageInq); // 총 페이지 수

    if (totalPageInq < pageCountInq) {
        pageCountInq = totalPageInq;
    }

    let pageGroup = Math.ceil(currentPageIng / pageCountInq); // 페이지 그룹
    let last = pageGroup * pageCountInq; // 화면에 보여질 마지막 페이지 번호

    if (last > totalPageInq) {
        last = totalPageInq;
    }

    let first = last - (pageCountInq - 1); // 화면에 보여질 첫번째 페이지 번호
    let next = last + 1;
    let prev = first - 1;

    let inquiry2Html = "";

    if (prev > 0) {
        inquiry2Html += '<li><a href="#" id="prev"> 이전 </a></li>';
    }

    // 페이징 번호 표시
    for (var j = first; j <= last; j++) {
        //console.log('문의 currentPage : ' + currentPageIng);
        if (currentPageIng == j) {
            inquiry2Html += '<li><a href="#" id="' + j + '">' + j + '</a></li>';
        } else {
            inquiry2Html += '<li><a href="#" id="' + j + '">' + j + '</a></li>';
        }
    }

    if (last < totalPageInq) {
        inquiry2Html += '<li><a href="#" id="next"> 다음 </a></li>';
    }

    $("#pagingInq").html(inquiry2Html);


    // let displayCount = "";
    // displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalDataInq + "건";
    // $("#displayCount").text(displayCount);

    // 페이징 번호 클릭 이벤트
    $("#pagingInq li a ").click(function () {
        var urlParams = new URLSearchParams(window.location.search);
        var uid = urlParams.get("p");
        event.preventDefault(); // 기본 동작 중단
        //alert('reviewList = ' + JSON.stringify(dataList));
        let $id = $(this).attr("id");
        selectedPage = $(this).text();

        if ($id == "next") selectedPage = next;
        if ($id == "prev") selectedPage = prev;

        // 전역변수에 선택한 페이지 번호를 담는다.
        globalCurrentPageInq = selectedPage;
        // 페이징 표시 재호출
        pagingInq(totalDataInq, dataPerPageInq, pageCountInq, selectedPage, inqList);
        // 글 목록 표시 재호출
        displayDataInq(selectedPage, dataPerPageInq, inqList, inqAnswerList);
    });
}

// 문의 제목 클릭 -> 내용 출력
$(document).ready(function () {
    $(document).on('click', '.clickTitle', function () {
        console.log('클릭 실행');
        $(this).closest('tr').next('.inquiryContent').slideToggle();
    });
});

// 문의 답변 클릭 -> 문의 답변 출력
$(document).ready(function () {
    $(document).on('click', '.clickAnswer', function () {
        console.log('클릭 실행');
        $(this).closest('tr').next('.answerContent').slideToggle();
    });
});

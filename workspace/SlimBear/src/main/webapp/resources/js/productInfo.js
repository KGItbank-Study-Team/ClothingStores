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



    $("#buyBtn").click(function(){
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

            document.body.appendChild(colorInput);
            document.body.appendChild(sizeInput);
            document.body.appendChild(cntInput);
            
        }
        $("#buyForm").submit();       
        console.log("optionList: " + optionList);
        //window.location.href = "/order/product";
    });

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

// function () {
//     document.getElementById("hiddenInput").value = JSON.stringify(selectOptionList);
//     document.getElementById("buyForm").submit();
// }

// 현재 페이지의 URL을 가져온다.
var currentUrl = window.location.href;
// URL에서 "p" 파라미터값을 추가한다.
var urlParams = new URLSearchParams(currentUrl.search);
var prod_code = urlParams.get("p");

// 테스트 출력
console.log(selectedColor, selectedSize);
// 장바구니 추가 기능
function addCart(uid) {
    // 테스트 출력
    console.log(selectOptionList);
    console.log("prod_code", uid);

    // 컨트롤러로 보내는 데이터
    // prod_code, selectOptionList(옵션값을 저장한 배열)
    $.ajax({
        url: "/app/insert/cart/" + uid,
        type: "POST",
        data: { selectOptionList: selectOptionList },
        success: function (result) {
            if (result.trim() === "add_success") {
                //alert("장바구니에 추가되었습니다.");
                // var addToCart = "장바구니에 추가되었습니다.";
                // var moveToCart = "장바구니로 이동하시겠습니까?";
                // var choice = confirm(addToCart + "\n\n" + moveToCart);

                // if(choice) {
                //     window.location.href="/app/cart";
                // }

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

// var buyProduct = { uid: uid, color: selectedColor, size: selectedSize, cnt: 1 };

// 구매 버튼 클릭 시 카트로 전달
function buyClick(uid) {
    $.ajax({
        url: "/app/insert/cart" + uid,
        type: "POST",
        data: { buyProduct: buyProduct },
        success: function (result) {
            if (result.trim() === "add_success") {
                window.location.href = "/app/order/product"
            } else {
                alert("error")
            }
        },
        error: function (request, status, error) {
            console.log("request:", request);
            console.log("status:", status);
            console.log("error:", error);
            alert("error")
        }
    })

}



// 장바구니 추가 관련 팝업창
$(function () {
    $(".keepShop").on("click", function () {
        $('.popUp').css('display', 'none');
    })
})
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

// 리뷰점수를 별모양으로 표시
// window.onload = function() {
//     const reviewScore = document.getElementById('reviewList').value;
//     console.log('reviewScore: ' + reviewScore);

//     function showScoreByStars(reviewScore) {
//         const starRating = Math.ceil(reviewScore / 10);
//         const stars ='⭐'.repeat(starRating);
//         console.log('stars: ' + stars);
//         console.log('reviewScore: ' + reviewScore);
//         document.getElementById('review-score').innerHTML = '<div id="review-score">' + stars + '(' + reviewScore+ ')' +  '</div>';

//     }

//     showScoreByStars(reviewScore);
// }

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

// 리뷰점수를 별모양으로 표시
window.onload = function () {
    const reviewScore = document.getElementById('reviewList').value;
    console.log('reviewScore: ' + reviewScore);

    function showScoreByStars(reviewScore) {

        const Score = Math.round(reviewScore);
        const reviewScoreElement = document.getElementById('review-score');
        const stars = reviewScoreElement.getElementsByTagName('i');

        // 기존 클래스 초기화
        for (let i = 0; i < stars.length; i++) {
            stars[i].classList.remove('fas');
        }

        // fas 클래스 적용
        for (let i = 0; i < Score / 10; i++) {
            stars[i].classList.add('fas');
        }
    }
    showScoreByStars(reviewScore);
}



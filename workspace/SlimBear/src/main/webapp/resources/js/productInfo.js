var selectProduct = [];
var selectedColor = null;
var selectedSize = null;

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
            console.log(selectProduct);
        }
    });



    function addRowToTable(color, size, cnt) {
        // 행을 생성하고 선택한 옵션 값을 설정
        var newRow = $("<tr id=" + makeProductElementID(color, size) + "></tr>");
        newRow.append($('<td class="tdOption"></td>').text(selectedColor));
        newRow.append($('<td class="tdOption"></td>').text(selectedSize));
        newRow.append($("<td></td>").html('<span class="quantity"><input type="text" name="pop_out" value="' + cnt + '" class="inputBox">'
            + '<a href="' + "javascript:upProductCount(" + makeColorAndSizeText(color, size) + ')"><img alt="수량증가" class="countUp" src="/resources/images/btn_count_up.gif"></a>'
            + '<a href="' + 'javascript:downProductCount(' + makeColorAndSizeText(color, size) + ')"><img alt="수량감소" class="countDown" src="/resources/images/btn_count_down.gif"></a>'
            + '</span><a href="' + 'javascript:removeProduct(' + makeColorAndSizeText(color, size) + ')" class="deleteBtn"><img alt="삭제" src="/resources/images/icon_delete.png" class="deleteImg"/></a>'));
        // newRow.append($('<td><div class="tdCell">' + prodPrice + '</div></td>'));
        newRow.append($('<td><div class="tdCell">${product.price}</div></td>'));
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
                    selectProduct.push({ color: selectedColor, size: selectedSize, cnt: 1 });
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
    for (var i = 0; i < selectProduct.length; i++) {
        if (selectProduct[i].color === color && selectProduct[i].size === size) {
            return i;
        }
    }
    return -1;
}

function removeProduct(color, size) {
    var index = findProductIndexByOption(color, size);

    if (index < 0 || index >= selectProduct.length)
        return;

    var productElement = $('tr#' + makeProductElementID(color, size));

    selectProduct.splice(index, 1);
    productElement.remove();
}

function upProductCount(color, size) {

    var index = findProductIndexByOption(color, size);

    if (index < 0 || index >= selectProduct.length)
        return;


    var productElement = $('tr#' + makeProductElementID(color, size));

    // 데이터 변경 및 화면 값 변경
    selectProduct[index].cnt += 1;

    productElement.find(".inputBox").val(selectProduct[index].cnt);
}

function downProductCount(color, size) {
    var index = findProductIndexByOption(color, size);

    if (index < 0 || index >= selectProduct.length || selectProduct[index].cnt <= 1)
        return;


    var productElement = $('tr#' + makeProductElementID(color, size));

    // 데이터 변경 및 화면 값 변경
    selectProduct[index].cnt -= 1;
    productElement.find(".inputBox").val(selectProduct[index].cnt);
}

function buyClick() {
    console.log(selectProduct);
}

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

// 현재 페이지의 URL을 가져온다.
var currentUrl = window.location.href;

// URL에서 "p" 파라미터값을 추가한다.
var urlParams = new URLSearchParams(currentUrl.search);
var prod_code = urlParams.get("p");


console.log(selectedColor, selectedSize);
// 장바구니 추가 기능
function addCart(prod_code) {
    console.log(selectedColor, selectedSize);
    console.log("prod_code", prod_code);
    $.ajax({
        type: "POST",
        async: true,
        url: "/add/cart/" + prod_code,
        traditional: true,
        contentType: "application/json",
        data: JSON.stringify(selectProduct),
        success: function (result) {
            if (result.trim() === "add_success") {
                alert("장바구니에 추가되었습니다.");
            } else {
                alert("동일한 상품이 장바구니에 있습니다.")
            }
        },
        error: function (request, status, error) {
            console.log("request:", request);
            console.log("status:", status);
            console.log("error:", error);
        }
    });
};

function cartAlert(result) {
    if (result == '0') {
        alert("장바구니에 추가를 하지 못했습니다.")
    } else if (result == '1') {
        alert("장바구니에 추가되었습니다.");
    } else if (result == '2') {
        alert("장바구니에 동일 상품이 있습니다.")
    }
}

// BUY IT NOW 클릭 시 결제 페이지로
$("#buyBtn").click(function () {
    location.assign("");
});



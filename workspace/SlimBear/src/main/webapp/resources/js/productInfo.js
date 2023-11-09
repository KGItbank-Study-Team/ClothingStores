var selectProduct = [];

$(function () {
    var selectedColor = null;
    var selectedSize = null;

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
        if(selectedColor == null){
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

    $(".deleteBtn").on("click", function () {
        var row = $(this).closest("tr");
        if (row) { // row가 존재하는지 확인
            row.remove();
            selectedColor = null; // 옵션 선택 초기화
            selectedSize = null; // 옵션 선택 초기화
        }
        alert("삭제되었습니다."); // 작동하는 지 체크 확인 문구
    });

    function updateSelection(color, size) {

        beforeColor = selectedColor;
        beforesize = selectedSize;
        selectedColor = color;
        selectedSize = size;
    
        if (selectedColor != null && selectedSize != null) {
            if (beforeColor != color || beforesize != size)
            selectProduct.push(selectedColor,selectedSize);
            // 행을 생성하고 선택한 옵션 값을 설정
            var newRow = $("<tr></tr>");
            newRow.append($('<td class="tdOption"></td>').text(selectedColor));
            newRow.append($('<td class="tdOption"></td>').text(selectedSize));
            newRow.append($("<td></td>").html('<span class="quantity"><input type="text" value="1" class="inputBox"><a href="#none" class=""><img alt="수량증가" class="countUp" src="/resources/images/btn_count_up.gif"></a><a href="#none"><img alt="수량감소" class="countDown" src="/resources/images/btn_count_down.gif"></a></span><a href="#none" class="deleteBtn"><img alt="삭제" src="/resources/images/icon_delete.png" style="width:9px;height:9px;"></a>'));
            newRow.append($('<td><div class="tdCell">${price}</div></td>'))
            $(".choiceOption").append(newRow);
            console.log(selectProduct);
        }
    }
});

// 선택 상품 수량 증감 감소 
// DOM 요소 가져오기
const inputBox = document.querySelector(".inputBox");
const countUpButton = document.querySelector(".countUp");
const countDownButton = document.querySelector(".countDown");

// 증가 버튼 클릭 시
countUpButton.addEventListener("click", function () {
    const currentValue = parseInt(inputBox.value, 10); // 현재 값 가져오기
    inputBox.value = currentValue + 1; // 값 증가
});

// 감소 버튼 클릭 시
countDownButton.addEventListener("click", function () {
    const currentValue = parseInt(inputBox.value, 10); // 현재 값 가져오기
    if (currentValue > 1) {
        inputBox.value = currentValue - 1; // 값 감소 (최소값은 1로 설정)
    }
});
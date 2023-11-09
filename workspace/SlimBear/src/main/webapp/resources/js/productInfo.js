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

    var $devareBtn = $(".devareBtn");

    $devareBtn.on("click", function (event) {
        var row = $(event.target).closest("tr");

        if (row) {
            row.remove();

            selectedColor = null; // 옵션 선택 초기화
            selectedSize = null; // 옵션 선택 초기화
        }
    });

    function updateSelection(color, size) {

        beforeColor = selectedColor;
        beforesize = selectedSize;
        selectedColor = color;
        selectedSize = size;
    
        if (selectedColor != null && selectedSize != null) {
            if (beforeColor != color || beforesize != size)
            selectProduct.push('selectedColor','selectedSize');
            // 행을 생성하고 선택한 옵션 값을 설정
            var newRow = $("<tr></tr>");
            newRow.append($('<td class="tdOption">뭐야 ㅅㅂ</td>').text(selectedColor));
            newRow.append($('<td class="tdOption">도라이냐</td>').text(selectedSize));
            newRow.append($("<td></td>").html('<span class="quantity"><input type="text" value="1" class="inputBox"><a href="#none" class=""><img alt="수량증가" class="countUp" src="/resources/images/btn_count_up.gif"></a><a href="#none"><img alt="수량감소" class="countDown" src="/resources/images/btn_count_down.gif"></a></span><a href="#none" class="devareBtn"><img alt="삭제" src="/resources/images/icon_devare.png" style="width:9px;height:9px;"></a>'));
            newRow.append($('<td><div class="tdCell">${price}</div></td>'))
            $(".choiceOption").append(newRow);
        }
    }
});

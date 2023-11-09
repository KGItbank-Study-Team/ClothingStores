var selectProduct = [];

$(function () {
    var selectedColor = null;
    var selectedSize = null;
    var defaultCnt = 1;

    $(".colorBtn").on("click", function () {
        if ($(this).hasClass("active")) {
            // 이미 선택한 상태라면 해제
            selectedColor = null;
            $(this).removeClass("active");
        } else {
            // 새로 선택한 옵션 처리
            $(".colorBtn").removeClass("active");
            $(this).addClass("active");
            selectedColor = $(this).find(".colorOption").text();
            updateSelection(selectedColor, selectedSize, defaultCnt);
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
            selectedSize = $(this).find(".sizeOption").text();
            updateSelection(selectedColor, selectedSize, defaultCnt);
        }
    });

    // 증가 버튼 클릭 시 
    $(".choiceOption").on("click", ".countUp", function () {
        const currentValue = parseInt($(this).siblings(".quantity").find(".inputBox").val(), 10); // 현재 값 가져오기
        $(this).siblings(".quantity").find(".inputBox").val(currentValue + 1); // 값 증가, 10진수로 변환
        updateSelection(selectedColor, selectedSize, $(this).siblings(".quantity").find(".inputBox").val());
    });

    // 감소 버튼 클릭 시
    $(".choiceOption").on("click", ".countDown", function () {
        const currentValue = parseInt($(this).siblings(".quantity").find(".inputBox").val(), 10); // 현재 값 가져오기
        if (currentValue > 1) {
            $(this).siblings(".quantity").find(".inputBox").val(currentValue - 1); // 값 감소 (최소값은 1로 설정)
            updateSelection(selectedColor, selectedSize, $(this).siblings(".quantity").find(".inputBox").val());
        }
    });

    // 상품 삭제 버튼
    $(".choiceOption").on("click", ".deleteBtn", function () {
        var row = $(this).closest("tr");
        if (row.length) {
            var deletedColor = row.find('.tdOption:first-child').text();
            var deletedSize = row.find('.tdOption:nth-child(2)').text();
            deleteFromSelectProduct(deletedColor, deletedSize);
            row.remove();
            selectedColor = null;
            selectedSize = null;
            $(".sizeBtn").removeClass('active');
        }
    });

    function addRowToTable(color, size, cnt) {
        // 행을 생성하고 선택한 옵션 값을 설정
        var newRow = $("<tr></tr>");
        newRow.append($('<td class="tdOption"></td>').text(color));
        newRow.append($('<td class="tdOption"></td>').text(size));
        newRow.append($("<td></td>").html('<span class="quantity"><input type="text" name="pop_out" value="' + cnt + '" class="inputBox"><a href="#none"><img alt="수량증가" class="countUp" src="/resources/images/btn_count_up.gif"></a><a href="#none"><img alt="수량감소" class="countDown" src="/resources/images/btn_count_down.gif"></a></span><a href="#none" class="deleteBtn"><img alt="삭제" src="/resources/images/icon_delete.png" style="width:9px;height:9px;"/></a>'));
        newRow.append($('<td><div class="tdCell">${price}</div></td>'))
        $(".choiceOption").append(newRow);
    }

    function updateSelection(color, size, cnt) {
        var beforeColor = selectedColor;
        var beforeSize = selectedSize;

        selectedColor = color;
        selectedSize = size;
        defaultCnt = cnt;

        if (selectedColor != null && selectedSize != null) {
            if (beforeColor !== color || beforeSize !== size) {
                selectProduct.push({ color: selectedColor, size: selectedSize, cnt: defaultCnt });
                addRowToTable(selectedColor, selectedSize, defaultCnt);
            }
        }
    }

    function deleteFromSelectProduct(color, size) {
        var indexToDelete = -1;
        for (var i = 0; i < selectProduct.length; i++) {
            if (selectProduct[i].color === color && selectProduct[i].size === size) {
                indexToDelete = i;
                break;
            }
        }
        if (indexToDelete !== -1) {
            selectProduct.splice(indexToDelete, 1);
        }
    }
});
var selectedColor = null;
var selectedSize = null;

// 색상 옵션 버튼 클릭 시 css 변경
$(".colorBtn").on("click", function () {
    if ($(this).hasClass("active")) {
        // 이미 선택한 상태라면 해제
        selectedColor = null;
        $(this).removeClass("active");
    } else {
        // 새로 선택한 옵션 처리
        $(".colorBtn").removeClass("active");
        $(this).addClass("active");
        updateSelection($(this).find(".colorOption").text(), selectedSize);
    }
});

// 사이즈 옵션 버튼 클릭 시 css 변경
$(".sizeBtn").on("click", function () {
    if ($(this).hasClass("active2")) {
        // 이미 선택한 상태라면 해제
        selectedSize = null;
        $(this).removeClass("active2");
    } else {
        // 새로 선택한 옵션 처리
        $(".sizeBtn").removeClass("active2");
        $(this).addClass("active2");
        updateSelection(selectedColor, $(this).find(".sizeOption").text());
    }
});

// 삭제 버튼 클릭시 테이블의 행 삭제
$('.deleteBtn').on("click", function (event) {
    $(this).closest("tr").remove();
    selectedColor = null; // 선택한 색상 초기화
    selectedSize = null;  // 선택한 사이즈 초기화
});

function updateSelection(color, size) {
    selectedColor = color;
    selectedSize = size;

    if (selectedColor != null && selectedSize != null) {
        $(".displayNone td:nth-child(1)").text(selectedColor);
        $(".displayNone td:nth-child(2)").text(selectedSize);
        $(".displayNone").css("display", "table-row-group");
    }
}
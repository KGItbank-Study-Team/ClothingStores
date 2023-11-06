$(document).ready(function() {
    // 색상 옵션 버튼 클릭 시 버튼 색상 변경 #1
    $(".color").click(function() {
        $(".color").removeClass("active");
        $(this).addClass("active");
        showOptions();
    });

    // 사이즈 옵션 클릭 시 버튼 색상 변경 #2
    $(".size").click(function() {
        $(".size").removeClass("active2");
        $(this).addClass("active2");
        showOptions();
    });

    // 선택 상품 수량 증감 감소
    const inputBox = $(".inputBox");
    const countUpButton = $(".countUp");
    const countDownButton = $(".countDown");

    countUpButton.click(function() {
        const currentValue = parseInt(inputBox.val(), 10);
        inputBox.val(currentValue + 1);
    });

    countDownButton.click(function() {
        const currentValue = parseInt(inputBox.val(), 10);
        if (currentValue > 1) {
            inputBox.val(currentValue - 1);
        }
    });

    // 삭제 버튼 클릭 시
    $(".deleteItem").click(function() {
        const row = $(this).closest("tr");
        row.remove();
    });

    // showOptions 함수는 동일하게 유지됩니다
    function showOptions() {
        $(".displayNone").removeClass("displayNone");
    }
});
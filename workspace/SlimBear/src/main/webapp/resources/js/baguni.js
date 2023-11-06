function toggleHiddenContent(button) {
    var hiddenContent = button.nextElementSibling; // 다음 형제 요소인 .hiddenContent02를 선택
    var btn = button;

    if (hiddenContent.style.display === 'none' || !hiddenContent.style.display) {
        hiddenContent.style.display = 'block';
        btn.textContent = '옵션 변경';
    } else {
        hiddenContent.style.display = 'none';
        btn.textContent = '주문 추가/변경▽';
    }
}

function addQuantity(id, step) {
    var inputField = document.getElementById(id);
    if (inputField) {
        var currentValue = parseInt(inputField.value);
        if (!isNaN(currentValue)) {
            inputField.value = currentValue + step;
            updatePrice(id); // 수량을 업데이트한 후, 가격을 다시 업데이트
        }
    }
}

function outQuantity(id, step) {
    var inputField = document.getElementById(id);
    if (inputField) {
        var currentValue = parseInt(inputField.value);
        if (!isNaN(currentValue) && currentValue > 1) {
            inputField.value = currentValue - step;
            updatePrice(id); // 수량을 업데이트한 후, 가격을 다시 업데이트
        }
    }
}


function updatePrice(id) {
    var discountPriceElement = document.getElementById("price_" + id);
    if (discountPriceElement) {
        var quantity = parseInt(document.getElementById(id).value);
        var productPrice = 132622; // 상품의 가격 (실제 가격으로 설정해야 함)
        var newPrice = quantity * productPrice;
        discountPriceElement.textContent = "₩" + newPrice;
    }
}   

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
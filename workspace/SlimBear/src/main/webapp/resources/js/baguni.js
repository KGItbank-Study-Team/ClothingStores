
function toggleHiddenContent() {

    var hiddenContent = document.getElementById('hiddenContent02');
    var btn = document.querySelector('.btn');

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
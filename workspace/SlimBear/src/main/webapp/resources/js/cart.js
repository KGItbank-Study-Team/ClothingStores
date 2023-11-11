function toggleHiddenContent(button) {
    var hiddenContent = button.nextElementSibling;
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
    var inputField = document.getElementById('quantity_' + id);
    if (inputField) {
        var currentValue = parseInt(inputField.value);
        if (!isNaN(currentValue)) {
            inputField.value = currentValue + step;
            updatePrice(id); // 수량을 업데이트한 후, 가격을 다시 업데이트
        }
    }
}

function outQuantity(id, step) {
    var inputField = document.getElementById('quantity_' + id);
    if (inputField) {
        var currentValue = parseInt(inputField.value);
        if (!isNaN(currentValue) && currentValue > 1) {
            inputField.value = currentValue - step;
            updatePrice(id); // 수량을 업데이트한 후, 가격을 다시 업데이트
        }
    }
}

function updatePrice(productId) {
    var priceElement = document.getElementById('price_' + productId);
    if (priceElement) {
        var productPrice = 45000; // 상품의 가격 (실제 가격으로 설정해야 함)
        var quantity = parseInt(document.getElementById('quantity_' + productId).value);
        var newPrice = quantity * productPrice;
        priceElement.textContent = "₩" + newPrice;
    }
}


function updateQuantity(productId, change) {
    // 해당 productId에 대한 quantity input 요소를 찾기
    var quantityElement = document.getElementById('quantity_' + productId);

    if (quantityElement) {
        // quantity input 요소가 존재하면 수량 변경 로직 수행
        var currentQuantity = parseInt(quantityElement.value);
        var newQuantity = currentQuantity + change;

        // 수량이 1 미만으로 내려가지 않도록 보장
        newQuantity = Math.max(newQuantity, 1);

        // 수량 입력란을 업데이트
        quantityElement.value = newQuantity;

        // 추가적인 로직 수행...
        updatePrice(productId, newQuantity); // 가격 업데이트 함수 호출
    } else {
        console.error('Quantity element not found for productId ' + productId);
    }
}

$(document).ready(function () {
    // thead에 있는 체크박스 요소 선택
    const theadCheckbox = $("thead input[type='checkbox']");
    
    // tbody에 있는 체크박스 요소 선택
    const tbodyCheckboxes = $("tbody input[type='checkbox']");

    // thead 체크박스 클릭 이벤트 핸들러 추가
    theadCheckbox.on("click", function () {
        // thead 체크박스의 상태 (체크되었는지 여부) 가져오기
        const isChecked = theadCheckbox.prop("checked");
        
        // tbody에 있는 모든 체크박스 상태 변경
        tbodyCheckboxes.prop("checked", isChecked);
    });
});

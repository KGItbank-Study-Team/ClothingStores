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
    // 전체 선택 체크박스 요소 선택
    const selectAllCheckbox = $("#selectAll");

    // tbody에 있는 체크박스 요소 선택
    const tbodyCheckboxes = $("tbody input[type='checkbox']");

    // 전체 선택 체크박스 클릭 이벤트 핸들러 추가
    selectAllCheckbox.on("click", function () {
        // 체크 상태에 따라 tbody에 있는 모든 체크박스 상태 변경
        const isChecked = selectAllCheckbox.prop("checked");
        tbodyCheckboxes.prop("checked", isChecked);
    });

    // 삭제 버튼 클릭 시
    $("#deleteSelectedBtn").on("click", function () {
        deleteSelectedItems();
    });
});

function deleteSelectedItems() {
    const checkedItems = $("tbody input[type='checkbox']:checked");
    const ctg_uid = checkedItems.map(function() {
        return $(this).closest('tr').find('.quantity input').attr('id').replace('quantity_', '');
    }).get();

    // AJAX를 사용하여 서버에 선택된 상품 삭제 요청 전송
    $.ajax({
        type: "POST",
        url: "/deleteSelectedItems",
        data: { ctg_uid: ctg_uid },
        success: function(updatedCart) {
            // 성공 시: 서버에서 받은 업데이트된 장바구니 정보로 화면 업데이트
            updateCart(updatedCart);
        },
        error: function(error) {
            console.error('Error deleting items:', error);
        }
    });
}

function updateCart(updatedCart) {
    // 업데이트된 장바구니 정보를 사용하여 화면 업데이트
    // 이 부분은 실제로 업데이트하는 방식에 따라 다를 수 있습니다.
    console.log("Cart updated:", updatedCart);
    // 여기에서 화면 업데이트 로직을 추가하세요.
    // 예: location.reload(); 또는 특정 부분만 업데이트하는 등의 방법으로 화면을 갱신
}




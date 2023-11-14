
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

// JavaScript에서 totalprice를 업데이트하도록 수정
function addQuantity(id, step) {
    var inputField = document.getElementById('quantity_' + id);
    if (inputField) {
        var currentValue = parseInt(inputField.value);
        if (!isNaN(currentValue)) {
            inputField.value = currentValue + step;
            updateTotalPrice(id); // totalprice 업데이트 추가
            //updatePrice(id); // 기존의 price 업데이트
            updateServer(id, currentValue + step); // 서버에 업데이트된 수량 전송
        }
    }
}

function outQuantity(id, step) {
    var inputField = document.getElementById('quantity_' + id);
    if (inputField) {
        var currentValue = parseInt(inputField.value);
        if (!isNaN(currentValue) && currentValue > 1) {
            inputField.value = currentValue - step;
            updateTotalPrice(id); // totalprice 업데이트 추가
           // updatePrice(id); // 기존의 price 업데이트
            updateServer(id, currentValue - step); // 서버에 업데이트된 수량 전송
        }
    }
}

function updateTotalPrice(productId) {
    var totalpriceElement = document.getElementById('totalprice_' + productId);
    if (totalpriceElement) {
        var productPrice = 45000; // 상품의 가격 (실제 가격으로 설정해야 함)
        var quantity = parseInt(document.getElementById('quantity_' + productId).value);
        var newTotalPrice = quantity * productPrice;
        totalpriceElement.textContent = newTotalPrice +"원";
    }
}

// 서버에 업데이트된 수량을 전송하는 함수 추가
function updateServer(productId, newQuantity) {
    $.ajax({
        type: "POST",
        url: "/app/updateQuantity",
        data: { productId: productId, newQuantity: newQuantity },
        success: function () {
            console.log("Quantity updated on the server");
        },
        error: function (error) {
            console.error('Error updating quantity on the server:', error);
        }
    });
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

   
});
// ... (기존 코드) ...

$("#deleteSelectedBtn").on("click", function () {
    deleteSelectedItems();
});

function deleteSelectedItems() {
    var checkedItems = $("tbody input[type='checkbox']:checked");
    var ctg_uid = checkedItems.map(function() {
        return $(this).closest('tr').find('.quantity input').attr('id').replace('quantity_', '');
    }).get();

    var formData = new FormData();
    formData.append("ctg_uid", ctg_uid.join(','));

    fetch('/app/deleteSelectedItems', {
        method: 'POST',
        body: formData,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded' // Content-Type 설정
        }
    })
    .then(response => response.json())
    .then(data => {
        console.log("서버 응답:", data);
        updateCart(data);
    })
    .catch(error => {
        console.log('Error deleting items:', error);
    });
}


document.getElementById('myForm').addEventListener('submit', function (event) {
    event.preventDefault();

    var formData = new FormData(this);

    fetch('/app/deleteSelectedItems', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        console.log("서버 응답:", data);
        // 업데이트된 장바구니 정보를 사용하여 화면 업데이트
        updateCart(data);
    })
    .catch(error => {
        console.log('Error deleting items:', error);
    });
});

function updateCart(updatedCart) {
    console.log("장바구니 업데이트:", updatedCart);
    // 여기에서 화면 업데이트 로직을 추가하세요.
    // 예: location.reload(); 또는 특정 부분만 업데이트하는 등의 방법으로 화면을 갱신
}




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
    
        var quantity = parseInt(document.getElementById('quantity_' + productId).value);
 //      var productPrice = ${cart.price};
        var newTotalPrice = quantity * productPrice; // 변수 사용
        totalpriceElement.textContent = newTotalPrice + "원";
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

function updateQuantity(productId, action) {
    var quantityInput = document.getElementById("quantity_" + productId);
    var currentQuantity = parseInt(quantityInput.value);

    if (action === 'increase') {
        quantityInput.value = currentQuantity + 1;
    } else if (action === 'decrease' && currentQuantity > 1) {
        quantityInput.value = currentQuantity - 1;
    }

    // 서버에 수량을 업데이트하는 부분은 생략하고 페이지 전체를 새로고침합니다.
    location.reload();
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

function deleteSelectedItems() {
    var selectedItems = document.querySelectorAll('input[name="selectedItems"]:checked');
    var itemIds = [];
    
    selectedItems.forEach(function(item) {
        itemIds.push(item.value);
    });

    if (itemIds.length > 0) {
        // 선택된 상품의 UID를 hidden input에 할당
        document.getElementById('selectedItemsInput').value = itemIds.join(',');

        // 폼 제출
        document.getElementById('deleteForm').submit();
    }
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



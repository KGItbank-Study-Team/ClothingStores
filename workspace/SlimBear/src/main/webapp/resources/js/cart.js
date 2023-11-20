function toggleHiddenContent(button, index) {
    var hiddenContent = document.getElementsByClassName("hiddenContent04")[index];
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
    
}

function outQuantity(id, step) {
 
}
function updateServer(productId, newQuantity) {
    // 서버에 업데이트된 수량을 전송하고 서버 응답을 받은 후에 페이지를 새로고침
   $.ajax({
    type: "POST",  // POST로 변경
    url: "/app/updateQuantity",
    data: { productId: productId, newQuantity: newQuantity },
    success: function () {
        console.log("서버에서 수량이 업데이트되었습니다.");
        // 서버 응답을 받은 후에 페이지를 새로고침
         location.reload();
    },
    error: function (error) {
        console.log('서버에서 수량을 업데이트하는 중 오류 발생:', error);
    }
});

}
function deleteSelectedItems() {
    // 선택된 체크박스의 값을 가져오기
    var selectedItems = [];
    $('input[name="selectedItems"]:checked').each(function () {
        selectedItems.push($(this).val());
    });

    // 선택된 상품이 없으면 알림 메시지 출력
    if (selectedItems.length === 0) {
        alert("삭제할 상품을 선택하세요.");
        return;
    }

    // 서버로 선택된 상품 삭제 요청 보내기
    $.ajax({
        type: "POST",
        url: "/app/deleteSelectedItems",
        data: { selectedItems: selectedItems.join(",") },
        success: function (response) {
            console.log(response);
            // 삭제 성공 시 페이지 새로고침 또는 장바구니 업데이트 로직 추가
            location.reload();
        },
        error: function (error) {
            console.error('상품 삭제 중 오류 발생:', error);
        }
    });
}
function updateQuantity(productId, action) {
    var quantityInput = document.getElementById("quantity_" + productId);
    var currentQuantity = parseInt(quantityInput.value);
	
    if (action === 'increase') {
        quantityInput.value = currentQuantity + 1;
        updateServer(productId, currentQuantity + 1);
    } else if (action === 'decrease' && currentQuantity > 1) {
        quantityInput.value = currentQuantity - 1;
        updateServer(productId, currentQuantity - 1);
    }
}
function updateOptions(productUID) {
    var selectedColor = $("#color_" + productUID).val();
    var selectedSize = $("#size_" + productUID).val();

    $.ajax({
        type: "POST",
        url: "/updateProductOptions", // 실제 서버의 엔드포인트에 맞게 수정
        data: {
            productUID: productUID,
            color: selectedColor,
            size: selectedSize
        },
        success: function (response) {
            // 서버 응답에 따른 처리
            console.log(response);
        },
        error: function (error) {
            // 오류 발생 시 처리
            console.error(error);
        }
    });
}


function updateCartOnServerResponse() {
    fetch('/app/getUpdatedCartData')
        .then(response => response.json())
        .then(data => {
            console.log("서버 응답:", data);
            // 업데이트된 장바구니 정보를 사용하여 화면 업데이트
            updateCart(data);
        })
        .catch(error => {
            console.log('Error fetching updated cart data:', error);
        });
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
function updateCart(updatedCart) {
    console.log("장바구니 업데이트:", updatedCart);
    // 여기에서 화면 업데이트 로직을 추가하세요.
    // 예: location.reload(); 또는 특정 부분만 업데이트하는 등의 방법으로 화면을 갱신
}



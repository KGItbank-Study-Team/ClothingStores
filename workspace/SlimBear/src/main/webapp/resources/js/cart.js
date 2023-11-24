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



function getMemUidAndAddToCart(cartUid) {
    // 색상과 크기 선택 로직
    var selectedColor = $("#color_" + cartUid).val();
    var selectedSize = $("#size_" + cartUid).val();

    // memUid는 여기에서 적절한 방법으로 가져오도록 수정해야 합니다.
    var memUid = getMemUidSomehow();

    // addToCart 함수 호출 시 새로 선택한 색상과 크기 정보를 전달
    addToCart(memUid, "prodCode", 1, selectedColor, selectedSize);
}
function addToCart(memUid, prodCode, quantity, selectedColor, selectedSize) {
    // Ajax를 활용하여 서버에 상품 추가 요청을 보냅니다.
    $.ajax({
        type: "POST",
        url: "/addToCart",
        data: {
            memUid: memUid,
            prodCode: prodCode,
            quantity: quantity,
            selectedColor: selectedColor,
            selectedSize: selectedSize
        },
        success: function (response) {
            // 성공적으로 추가되면 화면 갱신 또는 사용자에게 알림을 표시할 수 있습니다.
            alert("상품이 장바구니에 추가되었습니다.");
            // 추가된 상품 수량 등을 화면에 업데이트하는 로직을 추가할 수 있습니다.
        },
        error: function () {
            // 실패 시 처리 로직을 추가할 수 있습니다.
            alert("상품 추가에 실패했습니다.");
        }
    });
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
$(document).ready(function () {
    // 주문하기 버튼 클릭 이벤트 핸들러 추가
    $(".cart__bigorderbtn.right").on("click", function () {
        // 선택된 상품들의 정보를 담을 배열
        var selectedProducts = [];

        // 선택된 체크박스의 상품 정보 수집
        $('input[name="selectedItems"]:checked').each(function (index,me) {
    
            var quantity = $(me).data('productuid');
            var productUid = $(me).data('productuid');
            var color  = $(me).data('color');
            var size = $(me).data('size');
           
            selectedProducts.push({

                color : color,
                size : size,
                prod_Uid : productUid,
                cnt : quantity
            });
        });

        // 선택된 상품이 없을 경우 알림 메시지 출력
        if (selectedProducts.length === 0) {
            alert("주문할 상품을 선택하세요.");
            return;
        }

        // 폼 동적 생성
        var form = $("<form>")
            .attr("method", "post")
            .attr("action", "/app/order/product"); // 실제 주문 처리 엔드포인트로 수정

        // 상품 정보를 각각의 hidden input으로 추가
        selectedProducts.forEach(function (product, index) {
            form.append($("<input>")
                .attr("type", "hidden")
                .attr("name", "optionsList[" + index + "].prod_Uid")
                .val(product.prodcode));

            form.append($("<input>")
                .attr("type", "hidden")
                .attr("name", "optionsList[" + index + "].color")
                .val(product.color));
                form.append($("<input>")
                .attr("type", "hidden")
                .attr("name", "optionsList[" + index + "].size")
                .val(product.size));
                form.append($("<input>")
                .attr("type", "hidden")
                .attr("name", "optionsList[" + index + "].cnt")
                .val(product.cnt));
        });

        // 폼을 body에 추가하고 submit
        form.appendTo("body").submit();
    });
});
function updateCartItemOptions(me, index, cartUid) {
    var selectedColor = document.getElementById("color_" + index + "_" + cartUid).value;
    var selectedSize = document.getElementById("size_" + index + "_" + cartUid).value;
    var productUid = me.parents('tr.cart__list__detail').find("input[name=selectedItems]").data('productuid');
   
    $.ajax({
        type: "POST",
        url: "/app/updateCartItemOptions",
        data: {
            index: index,
            cartUid: cartUid,
            productUid: productUid,
            color: selectedColor,
            size: selectedSize
        },
        success: function (response) {
            console.log(response);
            location.reload();
        },
        error: function (error) {
            console.error("업데이트 실패: " + error);
        }
    });
}

function deleteSelectedItems() {
    // 선택된 체크박스의 값을 가져오기
    var selectedItems = [];
    $('input[name="selectedItems"]:checked').each(function () {
        selectedItems.push($(this).val());
        $(this).data("productUid");
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



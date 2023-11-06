// 색상 옵션 버튼 클릭시 버튼 색상 변경 #1
function change_btn(colorOptionPosition) {
	var btns = document.querySelectorAll(".color");	
	btns.forEach(function(btn, i) {
		if(colorOptionPosition.currentTarget == btn) {
			btn.classList.add("active");
		} else {
			btn.classList.remove("active");
		}
	});
	console.log(colorOptionPosition.currentTarget);
}

// 사이즈 옵션 클릭시 버튼 클릭시 버튼 색상 변경 #2
function change_btn2(sizeOptionPosition) {
	var btns2 = document.querySelectorAll(".color");	
	btns2.forEach(function(btn2, i) {
		if(sizeOptionPosition.currentTarget == btn2) {
			btn2.classList.add("active2");
		} else {
			btn2.classList.remove("active2");
		}
	});
	console.log(sizeOptionPosition.currentTarget);
	showOptions();
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

// 삭제 버튼 클릭 시
document.addEventListener("DOMContentLoaded", function() {
    // 모든 삭제 버튼을 선택
    const deleteButtons = document.querySelectorAll(".deleteItem");

    // 각 삭제 버튼에 대한 클릭 이벤트 핸들러 설정
    deleteButtons.forEach(function(button) {
        button.addEventListener("click", function(event) {
            // 클릭된 삭제 버튼의 부모 행(tr 요소)을 찾음
            const row = event.target.closest("tr");

            // 해당 행을 삭제
            if (row) {
                // 해당 행의 색상 옵션과 사이즈 옵션 선택을 초기화
                const colorOption = row.querySelector(".color");
                const sizeOption = row.querySelector(".size");
                colorOption.classList.remove("active");
                sizeOption.classList.remove("active2");

                // 해당 행을 삭제
                row.remove();
            }
        });
    });
});

// 제품의 모든 옵션 선택 시 선택한 제품의 옵션과 가격을 화면에 띄워줌
function showOptions() {
    // 색상 및 사이즈 옵션을 선택하면 displayNone 클래스를 제거하여 해당 영역을 표시
    const displayNone = document.querySelector(".displayNone");
    displayNone.classList.remove("displayNone");
}
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
// 찜하기 버튼	

function Toggle1(button) {
    var heartIcon = button.querySelector('i.fa-heart');
    if (heartIcon.style.color == "brown") {
        heartIcon.style.color = "black";
    } else {
        heartIcon.style.color = "brown";
    }
}
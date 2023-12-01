// function toggleDetails() {
//     var details = document.querySelector('.cons');
//     details.style.display = (details.style.display === 'none' || details.style.display === '') ? 'block' : 'none';
// }

// function toggleDetails() {
//     var details = document.querySelector('.cons');
    
//     // 페이지 로딩 시 초기 상태를 'none'으로 설정
//     if (!details.hasAttribute('data-toggled')) {
//         details.style.display = 'none';
//         details.setAttribute('data-toggled', 'true');
//     }

//     details.style.display = (details.style.display === 'none' || details.style.display === '') ? 'block' : 'none';
// }

// function toggleDetails() {
//     var details = document.querySelector('.cons');

//     if (window.getComputedStyle(details).display === 'none') {
//         details.style.display = 'block';
//     } else {
//         details.style.display = 'none';
//     }
// }
// function toggleDetails() {
//     var details = document.querySelector('.cons');
//     details.classList.toggle('hidden');
// }
document.addEventListener("DOMContentLoaded", function () {
    // 페이지 로딩 시 숨겨진 상태로 시작
    var details = document.querySelector('.cons');
    details.classList.add('hidden');
});

function toggleDetails() {
    var details = document.querySelector('.cons');
    details.classList.toggle('hidden');
}

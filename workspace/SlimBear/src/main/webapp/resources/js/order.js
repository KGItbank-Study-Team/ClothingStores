/*function toggleHiddenContent() {
    var hiddenContent = document.getElementById('hiddenContent03');
    if (hiddenContent.style.display === 'none' || hiddenContent.style.display === '') {
        hiddenContent.style.display = 'block'; // 숨겨진 콘텐츠를 표시
        document.querySelector('.btn').textContent = '주문자 정보 ▲';
    } else {
        hiddenContent.style.display = 'none'; // 숨겨진 콘텐츠를 숨김
        document.querySelector('.btn').textContent = 'ssss'
        }
}
*/
function toggleHiddenContent() {
    var hiddenContent = document.getElementById('hiddenContent03');
    var btn = document.querySelector('.btn');

    if (hiddenContent.style.display === 'none' || hiddenContent.style.display === '') {
        hiddenContent.style.display = 'block'; // 숨겨진 콘텐츠를 표시
        btn.textContent = '주문자 정보 ▽'; // 버튼 텍스트 변경
    } else {
        hiddenContent.style.display = 'none'; // 숨겨진 콘텐츠를 숨김
        btn.textContent = '주문자 정보 ▶'; // 버튼 텍스트 변경
    }
}

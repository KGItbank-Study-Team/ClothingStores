// 체크박스 전체선택 (위시리스트)
function selectAll(selectAll)  {
    const checkboxes 
         = document.getElementsByName('wish_idx');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = selectAll.checked;
    })
  }

// 주소찾기
function searchAddress() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 우편번호와 주소 정보를 가져온 후 폼에 채우기
                document.getElementById('address_zip1').value = data.zonecode;
                document.getElementById('address_addr1').value = data.address;
                document.getElementById('address_addr2').value = '';
            }
        }).open();
    }
    
// insert addr 유효성검사

// HTML에서 필드 요소 가져오기
const nameField = document.querySelector('.ec-member-name');
const telNumberField = document.querySelector('.ma_rcv_phone1-number input[type="text"]');
const addressField = document.querySelector('#address_addr1');
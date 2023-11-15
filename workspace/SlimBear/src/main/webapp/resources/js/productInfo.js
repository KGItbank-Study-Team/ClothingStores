var selectProduct = [];
var selectedColor = null;
var selectedSize = null;

$(function () {

    $(".colorBtn").on("click", function () {
        if ($(this).hasClass("active")) {
            // 이미 선택한 상태라면 해제
            selectedColor = null;
            $(this).removeClass("active");
        } else {
            // 새로 선택한 옵션 처리
            $(".colorBtn").removeClass("active");
            $(this).addClass("active");
            selectedColor = $('.colorBtn').text();
            updateSelection($(this).find(".colorOption").text(), selectedSize);
        }
    });

    $(".sizeBtn").on("click", function () {
        if (selectedColor == null) {
            alert('색상 옵션을 선택해주세요.');
        } else if ($(this).hasClass("active2")) {
            // 이미 선택한 상태라면 해제
            selectedSize = null;
            $(this).removeClass("active2");
        } else {
            // 새로 선택한 옵션 처리
            $(".sizeBtn").removeClass("active2");
            $(this).addClass("active2");
            selectedSize = $('.sizeBtn').text();
            updateSelection(selectedColor, $(this).find(".sizeOption").text());
        }
    });

   

    function addRowToTable(color, size, cnt) {
        // 행을 생성하고 선택한 옵션 값을 설정
        var newRow = $("<tr id=" + makeProductElementID(color,size) + "></tr>");
        newRow.append($('<td class="tdOption"></td>').text(selectedColor));
        newRow.append($('<td class="tdOption"></td>').text(selectedSize));
        newRow.append($("<td></td>").html('<span class="quantity"><input type="text" name="pop_out" value="' + cnt +'" class="inputBox">' 
        +'<a href="' + "javascript:upProductCount(" + makeColorAndSizeText(color,size) + ')"><img alt="수량증가" class="countUp" src="/resources/images/btn_count_up.gif"></a>' 
        +'<a href="' + 'javascript:downProductCount(' + makeColorAndSizeText(color,size) + ')"><img alt="수량감소" class="countDown" src="/resources/images/btn_count_down.gif"></a>' 
        +'</span><a href="' + 'javascript:removeProduct(' + makeColorAndSizeText(color,size) + ')" class="deleteBtn"><img alt="삭제" src="/resources/images/icon_delete.png" style="width:9px;height:9px;"/></a>'));
        newRow.append($('<td><div class="tdCell">${product.price}</div></td>'))
        $(".choiceOption").append(newRow);
    }

    function updateSelection(color, size) {
        beforeColor = selectedColor;
        beforesize = selectedSize;
        selectedColor = color;
        selectedSize = size;

        if (selectedColor != null && selectedSize != null) {
            if (beforeColor != color || beforesize != size){
                var index = findProductIndexByOption(color, size);
                if(index == -1){
                    // 이미 추가한 옵션이 아니면 새로 추가
                    selectProduct.push({ color: selectedColor, size: selectedSize, cnt: 1});
                    addRowToTable(selectedColor, selectedSize, 1);
                }
                else{
                     // 이미 추가한 옵션이면 막음
                     alert("이미 선택한 옵션입니다");
                }
            }
        }
    }
});

function makeProductElementID(color, size){
    return "product_" + color + "_" + size;
}

function makeColorAndSizeText(color, size){

    return "'" + color + "','" + size +"'";
}

function findProductIndexByOption(color, size){
    for (var i = 0; i < selectProduct.length; i++) {
        if (selectProduct[i].color === color && selectProduct[i].size === size) {
            return i;
        }
    }
    return -1;
}

function removeProduct(color, size){
    var index = findProductIndexByOption(color,size);

    if(index < 0 || index >= selectProduct.length)
        return;

        var productElement = $('tr#' + makeProductElementID(color, size));

    selectProduct.splice(index, 1);
    productElement.remove();
 }

 function upProductCount(color, size){

    var index = findProductIndexByOption(color,size);

    if(index < 0 || index >= selectProduct.length)
        return;

   
    var productElement = $('tr#' + makeProductElementID(color, size));

    // 데이터 변경 및 화면 값 변경
    selectProduct[index].cnt += 1;

    productElement.find(".inputBox").val(selectProduct[index].cnt);
 }

 function downProductCount(color, size){
    var index = findProductIndexByOption(color,size);

    if(index < 0 || index >= selectProduct.length || selectProduct[index].cnt <= 1)
        return;

   
    var productElement = $('tr#' + makeProductElementID(color, size));

     // 데이터 변경 및 화면 값 변경
    selectProduct[index].cnt -= 1;
    productElement.find(".inputBox").val(selectProduct[index].cnt);
 }

function buyClick(){
    console.log(selectProduct);
}

// GUIDE 정보 펼치고 접기
$(document).ready(function(){
    $("h2").click(function(){
        var submenu = $(this).next("div");

        // submenu가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if(submenu.is(":visible")) {
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
        // $(this).next("div").toggleClass("guideText");
    });
});
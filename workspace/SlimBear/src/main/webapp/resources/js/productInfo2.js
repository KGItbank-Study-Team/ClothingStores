/*
$(function(){
    var selectedColor = null;
    var selectedSize = null;
	
    $(".colorBtn").on("click", function(){
        if ($(this).hasClass("active")) {	
            // 이미 선택한 상태라면 해제
            selectedColor = null;
            $(this).removeClass("active");
        } else {
            // 새로 선택한 옵션 처리
            $(".colorBtn").removeClass("active");
            $(this).addClass("active");
            selectedColor = $(this).find(".colorOption").text();
            updateSelection();
        }
    });

    $(".sizeBtn").on("click", function(){
        if ($(this).hasClass("active2")) {
            // 이미 선택한 상태라면 해제
            selectedSize = null;
            $(this).removeClass("active2");
        } else {
            // 새로 선택한 옵션 처리
            $(".sizeBtn").removeClass("active2");
            $(this).addClass("active2");
            selectedSize = $(this).find(".sizeOption").text();
            updateSelection();
        }
    });

    var $devareBtn = $(".devareBtn");
    
    	$devareBtn.on("click", function(event) {
        var row = $(event.target).closest("tr");
        
        if (row) {
            row.remove();
            updateSelection(); // 행을 삭제한 후 옵션 선택을 업데이트
            selectedColor = null; // 옵션 선택 초기화
            selectedSize = null; // 옵션 선택 초기화
        }
    });

 function updateSelection(){
 	//기존의 선택된 옵션 행 모두 삭제
 	$(".displayNone").empty();
        if (selectedColor && selectedSize) {
            // 행을 생성하고 선택한 옵션 값을 설정
            var newRow = $("<tr></tr>");
            newRow.append($("<td></td>").text(selectedColor));
            newRow.append($("<td></td>").text(selectedSize));
            newRow.append($("<td></td>").html('<span class="quantity"><input type="text" value="1" class="inputBox"><a href="#none" class=""><img alt="수량증가" class="countUp" src="/resources/images/btn_count_up.gif"></a><a href="#none"><img alt="수량감소" class="countDown" src="/resources/images/btn_count_down.gif"></a></span><a href="#none" class="devareBtn"><img alt="삭제" src="/resources/images/icon_devare.png" style="width:9px;height:9px;"></a>'));
            
            $(".displayNone").append(newRow);
            $(".displayNone").removeClass("displayNone");

        }
    }
});
*/

/*
$(function(){
    var selectedColor = null;
    var selectedSize = null;

    $(".colorBtn").on("click", function(){
        // 선택한 상품 데이터 초기화
        selectedColor = null;
        selectedSize = null;
        
        // 새로운 옵션 선택 또는 해제
        $(this).toggleClass("active");
        selectedColor = $(this).find(".colorOption").text();
        
        // 기존에 선택한 행 모두 삭제
        $(".displayNone").empty();
   
        // 새로운 행 생성 및 선택한 옵션 추가
        updateSelection();
    });

    $(".sizeBtn").on("click", function(){
        // 선택한 상품 데이터 초기화
        selectedColor = null;
        selectedSize = null;
        
        // 새로운 옵션 선택 또는 해제
        $(this).toggleClass("active2");
        selectedSize = $(this).find(".sizeOption").text();
        
        // 기존에 선택한 행 모두 삭제
        $(".displayNone").empty();
        
  
        // 새로운 행 생성 및 선택한 옵션 추가
        updateSelection();
    });

    var $devareBtn = $(".devareBtn");
    
    $devareBtn.on("click", function(event) {
        var row = $(event.target).closest("tr");
        
        if (row) {
            row.remove();
            // 옵션 선택 초기화
            selectedColor = null;
            selectedSize = null;
        }
    });

    function updateSelection(){
        if (selectedColor && selectedSize) {
            // 행을 생성하고 선택한 옵션 값을 설정
            var newRow = $("<tr></tr>");
            newRow.append($("<td></td>").text(selectedColor));
            newRow.append($("<td></td>").text(selectedSize));
            newRow.append($("<td></td>").html('<span class="quantity"><input type="text" value="1" class="inputBox"><a href="#none" class=""><img alt="수량증가" class="countUp" src="/resources/images/btn_count_up.gif"></a><a href="#none"><img alt="수량감소" class="countDown" src="/resources/images/btn_count_down.gif"></a></span><a href="#none" class="devareBtn"><img alt="삭제" src="/resources/images/icon_devare.png" style="width:9px;height:9px;"></a>'));
            $(".displayNone").append(newRow);

        }
    }
});
*/

var selectProduct=[];



$(function(){
    var selectedColor = null;
    var selectedSize = null;
	
    $(".colorBtn").on("click", function(){
        if ($(this).hasClass("active")) {
            // 이미 선택한 상태라면 해제
            selectedColor = null;
            $(this).removeClass("active");
        } else {
            // 새로 선택한 옵션 처리
            $(".colorBtn").removeClass("active");
            $(this).addClass("active");
            updateSelection($(this).find(".colorOption").text(), selectedSize);
        }
    });

    $(".sizeBtn").on("click", function(){
        if ($(this).hasClass("active2")) {
            // 이미 선택한 상태라면 해제
            selectedSize = null;
            $(this).removeClass("active2");
        } else {
            // 새로 선택한 옵션 처리
            $(".sizeBtn").removeClass("active2");
            $(this).addClass("active2");
            updateSelection(selectedColor, $(this).find(".sizeOption").text());
        }
    });

    var $devareBtn = $(".devareBtn");
    
    	$devareBtn.on("click", function(event) {
        var row = $(event.target).closest("tr");
        
        if (row) {
            row.remove();
         
            selectedColor = null; // 옵션 선택 초기화
            selectedSize = null; // 옵션 선택 초기화
        }
    }); 

    function updateSelection(color, size){
    
    	beforeColor = selectedColor;
    	beforesize = selectedSize;
    	selectedColor = color;
	    selectedSize = size;
	    
    	if(selectedColor != null && selectedSize != null){
			if(beforeColor != color || beforesize!=size)    	
    	 	$(".displayNone td:nth-child(1)").text(selectedColor);
            $(".displayNone td:nth-child(2)").text(selectedSize);
            $(".displayNone").css("display", "table-row-group");
          
    	}
    }
});

//좌측 슬라이더 메뉴 펼치기
function pageSliderMenuActive(navID, menuIndex){
	$('#' + navID).find(".collapsed").removeClass("collapsed");
	$('#' + navID).find(".collapse").addClass("show");
	$('#' + navID).find('.collapse-item').eq(menuIndex).addClass("active");
}

$.fn.serializeObject = function() {
  "use strict"
  var result = {}
  var extend = function(i, element) {
    var node = result[element.name]
    if ("undefined" !== typeof node && node !== null) {
      if ($.isArray(node)) {
        node.push(element.value)
      } else {
        result[element.name] = [node, element.value]
      }
    } else {
      result[element.name] = element.value
    }
  }

  $.each(this.serializeArray(), extend)
  return result
}


// 상품 등록====================================================================================================

// 가격 텍스트박스에서 사용항 유효성 체크
function checkPriceTest(evt, me) {

  // 문자 제거
  me.value = me.value.replace(/[^0-9]/g, "");
  
  // 제일 앞에있는0 제거
  me.value = me.value.replace(/\b0+/g, "");

	
  var charCode = (evt.which) ? evt.which : evt.keyCode
  if (charCode > 31 && (charCode < 48 || charCode > 57))
    return false;
  return true;
}

function displaySelectedImage(event, elementId) {
    const selectedImage = document.getElementById(elementId);
    const fileInput = event.target;

    if (fileInput.files && fileInput.files[0]) {
        const reader = new FileReader();

        reader.onload = function(e) {
            selectedImage.src = e.target.result;
        };

        reader.readAsDataURL(fileInput.files[0]);
    }
}

function selectCategory(selectItem){
  var ctg = selectItem.data("ctg");
  var depth = selectItem.data("depth");

  // 선택했으니 텍스트 변경
  selectItem.parents('.category_gorup').find('.dropdown-toggle').html(selectItem.html());

  // 최종 선택 카테고리
  var parentDIV = $('#category-selector');
  parentDIV.find('input[name=category]').val(ctg);
  var groups=parentDIV.find(".category_gorup");

  // 선택카테고리 바뀌었으니 하위 카테고리 지우기
	for(var i=0; i<groups.length ; ++i){
		if(depth < i) groups[i].remove();
  }

  // 하위 카테고리 추가
  addCategoryGroup(ctg, depth + 1);
}

function addCategoryGroup(topCtg, depth){

  $.ajax({
    url: "/admin/category/childs",
    type: "POST",
    data: {
      ctg: topCtg
    },
    success: function(data){

	    var childCtgs = data;

		if(childCtgs.length == 0) return;

	      var parentDIV = $('#category-selector');
	    
	      var newGroup = $('<div>',
	                      {
	                        class : 'btn-group category_gorup',
	                        role : 'group'
	                      });
	      newGroup.append('<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">카테고리-' + (depth + 1) + '</button>')
	      newGroup.data('depth', depth)
	    
	      var newGroupItems=$('<div>',{
	                          class : 'dropdown-menu'
	                        });
	    
	     
	      for(var i=0; i<childCtgs.length; ++i){
	    
	        var uid = childCtgs[i].uid;
	        var name = childCtgs[i].name;
	    
	        var newCtg = $('<a>', {
	                        class : 'dropdown-item',
	                      });
	    
	    
	        newCtg.click(function(){ selectCategory($(this)); });
	        newCtg.html(name);
	        newCtg.data("ctg", uid);
	        newCtg.data("depth", depth);
	        newGroupItems.append(newCtg);
	      }
	      newGroup.append(newGroupItems);
	    
	      $('#category-selector').append(newGroup);
	    },
	    error: function(){
	        alert("err");
	    }
	});
}


$(function(){
	pageSliderMenuActive("accordionSidebar_product_nav", 0);
});

function addOption(){
	var prod_uid =  $('#content').data('product');
	var color = $('#add_color').val().trim();
	var size = $('#add_size').val().trim();
	var cnt = $('#add_cnt').val().trim();
	
	$('#add_color').val('');
	$('#add_size').val('');
	$('#add_cnt').val('');

	var optionListValue = getOptionValueList();
	
	for(var i=0; i<optionListValue.length; ++i){
		if(optionListValue[i].color == color && optionListValue[i].size == size){
			alert('이미 있는 옵션입니다.');
			return;
		}
	}

	$.ajax({
		url: "/admin/add/product/detail",
		type: "POST",
		data: {
		
			prod_uid : prod_uid,
			color: color,
			size: size,
			cnt: cnt
		
		},
		success: function(data){
				alert("옵션 추가 완료");

				var option_list = $('#option_list');
		
				option_list.append("<tr><th class='color'>" + color + "</th><th class='size'>" + size + '</th><th class="cnt"><input name="cnt" min="0" type="number" value="' + cnt +'"></th><th><button type="button" class="btn btn-primary" onclick="removeOption(this);">제거</button> <button type="button" class="btn btn-primary" onclick="updateOption(this);">수정</button></th>');
										
			},
			error: function(){
				alert("옵션 추가 실패");
			}
		});
}

function removeOption(removeBtn){
	var prod_uid =  $('#content').data('product');
	var color = $(removeBtn).parents('tr').find('.color').html();
	var size = $(removeBtn).parents('tr').find('.size').html();

	$.ajax({
		url: "/admin/delete/product/detail",
		type: "POST",
		data: {
			prod_uid : prod_uid,
			color: color,
			size: size,
		},
		success: function(data){
				alert("옵션 삭제 완료");
				$(removeBtn).parents('tr').remove();						
			},
			error: function(){
				alert("옵션 삭제 실패");
			}
		});
}


function updateOption(updateBtn){
	var prod_uid =  $('#content').data('product');
	var color = $(updateBtn).parents('tr').find('.color').html();
	var size = $(updateBtn).parents('tr').find('.size').html();
	var cnt = $(updateBtn).parents('tr').find('input[name=cnt]').val();

	$.ajax({
		url: "/admin/update/product/detail",
		type: "POST",
		data: {
			prod_uid : prod_uid,
			color: color,
			size: size,
			cnt: cnt
		},
		success: function(data){
				alert("옵션 수정 완료");		
			},
			error: function(){
				alert("옵션 수정 실패");
			}
		});
}

function regProduct(){

	var optionList = getOptionValueList();

	var option_list = $('#option_list');

	for(var i=0; i<optionList.length; ++i){
		option_list.append('<input type="hidden" name="colors" value="' + optionList[i].color +'">');
		option_list.append('<input type="hidden" name="sizes" value="' + optionList[i].size +'">');
	}
	

	var formData = $('form').serializeObject();
	
	return true;
}

function getOptionValueList(){
	var form = $('form');
	var option_list = form.find('#option_list').find('tr').get();
	var option_list_value= [];
	for(var i=0; i<option_list.length;++i){
		option_list_value.push({
			color : $(option_list[i]).find('.color').html(),
			size : $(option_list[i]).find('.size').html()
		});
	}
	
	return option_list_value;
}
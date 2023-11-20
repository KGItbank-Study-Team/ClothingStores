$(function(){
	pageSliderMenuActive("accordionSidebar_product_nav", 1);
	addCategoryGroup(0, 0, null);
});

function addOption(){
	var color = $('#add_color').val().trim();
	var size = $('#add_size').val().trim();
	
	$('#add_color').val('');
	$('#add_size').val('');

	var optionListValue = getOptionValueList();
	
	for(var i=0; i<optionListValue.length; ++i){
		if(optionListValue[i].color == color && optionListValue[i].size == size){
			alert('이미 있는 옵션입니다.');
			return;
		}
	}
	
	var option_list = $('#option_list');
	
	option_list.append("<tr><th class='color'>" + color + "</th><th class='size'>" + size + '</th><th><button type="button" class="btn btn-primary" onclick="removeOption(this);" >제거</button></th></tr>');
}

function removeOption(removeBtn){
	$(removeBtn).parents('tr').remove();
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
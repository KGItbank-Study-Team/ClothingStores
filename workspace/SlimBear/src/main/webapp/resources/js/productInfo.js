// 버튼 클릭 유지1
// $('.color').on('click', function(){
//   $('.color').removeClass('selected');
//   $(this).addClass('selected');
// });

// 버튼 클릭 유지2
/*
$('colorOption').each(function(index){
  $(this).attr('colorOption-index', index);
}).click(function(){
  let index = $(this).attr('colorOption-index');
  $('.colorOption[colorOption-index=' + index + ']').addClass('clicked-color');
  $('.colorOption[colorOption-index=' + index + ']').remove('clicked-color');
});
*/

$(document).ready(function(){
		$('.colorOption').each(function(index){
			$(this).attr('colorOption-index', index);
		}).click(function(){
			var index = $(this).attr('colorOption-index');
			$('.colorOption[colorOption-index=' + index + ']').addClass('clicked_color');
			$('.colorOption[colorOption-index!=' + index + ']').removeClass('clicked_color');
		});


});


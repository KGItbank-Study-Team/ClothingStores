$(document).ready(function() {
    $('.star_rating > .star').click(function() {
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
    });
});

// textarea 글자수 제한
$(document).ready(function() {
    $('#test').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 5000)");
 
        if($(this).val().length > 5000) {
            $(this).val($(this).val().substring(0, 5000));
            $('#test_cnt').html("(5000 / 5000)");
        }
    });
});


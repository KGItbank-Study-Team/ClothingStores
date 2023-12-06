$(document).ready(function() {
    $('.star_rating > .star').click(function() {
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
    });
});

$(document).ready(function () {
    $('.star_rating > .star').click(function () {
        // 선택된 별 이하의 모든 별에 'on' 클래스 추가
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');

        // 선택된 별의 data-value 값을 가져와서 input 필드에 설정
        var ratingValue = $(this).data('value');
        $("#rating").val(ratingValue);
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

$(document).ready(function() {
    // 각 파일 입력란에 대한 이벤트 처리
    $('input[type="file"]').change(function() {
        var inputId = $(this).attr('id');
        var previewId = inputId.replace("file", "preview");
        var preview = $('#' + previewId)[0];
        var file = this.files[0];

        if (file) {
            var reader = new FileReader();

            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.style.display = "block";
            };

            reader.readAsDataURL(file);
        } else {
            preview.src = "";
            preview.style.display = "none";
        }
    });
});

// 리뷰 등록 성공 후 창 닫기
function closeWindow() {
    window.close();
}

$(document).ready(function() {
    // 폼이 제출될 때의 이벤트 처리
    $("#reviewForm").submit(function(event) {
        // 폼 제출 기본 동작 막기
        event.preventDefault();

        // Ajax 호출 수행
        $.ajax({
            type: "POST",
            url: "/app/review/upload",  // 컨트롤러 URL
            contentType: false,  //제이쿼리가 자동으로 콘텐츠 유형을 설정하지 않도록 함(formdata 객체에 이미 content-Type 헤더가 포함되어 있기 때문에)
            processData: false,  //데이터를 문자열로 변환하지 않게 함. 기본값은 true, 이 경우 제이쿼리는 데이터를 쿼리 문자열로 직렬화함. 하지만 formdata는 이미 직렬화된 상태이므로 false로 설정
            data: new FormData(this), // HTML 폼 요소의 데이터를 담기 위한 FormDate 객체 생성
            success: function(response) {
                // 성공적으로 처리된 경우의 동작
                console.log(response);
                alert("리뷰가 등록 되었습니다.");
                window.close();

            },
            error: function(error) {
                // 오류가 발생한 경우의 동작
                console.log(error);
                // 여기에 오류 처리 동작 추가
            }
        });
    });

    // 평점을 클릭할 때의 이벤트 처리
    $('.star_rating > .star').click(function() {
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');

        // 선택된 별의 값을 숨겨진 input에 설정
        var value = $(this).attr("value");
        $("#rating").val(value);
    });
});


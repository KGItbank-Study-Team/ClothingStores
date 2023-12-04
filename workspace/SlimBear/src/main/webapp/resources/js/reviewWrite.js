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

// 폼 제출 이벤트 리스너
// $(document).ready(function() {
//     $("#reviewForm").submit(function() {
//         // 여기서 리뷰 등록 로직을 추가할 수 있음

//         // 리뷰 등록 후 창 닫기
//         closeWindow();

//         // 이후 폼이 서버로 제출되도록 false 반환
//         return false;
//     });
// });

// form 태그 데이터 ajax로 보내기
// $(document).ready(function () {
//     $('#reviewForm').submit(function (event) {
//         // 폼 전송을 막기
//         event.preventDefault();

//         // 폼 데이터를 직렬화
//         var formData = new FormData($(this)[0]);

//         // 선택된 별의 값 가져와서 formData에 추가
//         var ratingValue = $('.star.on').data('value');
//         formData.append('rating', ratingValue);

//         // Ajax를 이용해 서버로 데이터 전송
//         $.ajax({
//             url: '/app/review/upload',  // 여기에 실제 서버 URL을 입력하세요.
//             type: 'POST',
//             data: formData,
//             contentType: false,
//             processData: false,
//             success: function (response) {
//                 // 성공 시 동작
//                 console.log('리뷰가 성공적으로 등록되었습니다.');
//                 // 추가로 필요한 동작 수행
//             },
//             error: function (error) {
//                 // 실패 시 동작
//                 console.error('리뷰 등록에 실패했습니다.');
//                 console.error('에러 상태 코드:', error.status);
//                 console.error('에러 응답 내용:', error.responseText);
//                 // 추가로 필요한 동작 수행
//             }
//         });
//     });
// });
$(document).ready(function() {
    // 폼이 제출될 때의 이벤트 처리
    $("#reviewForm").submit(function(event) {
        // 폼 제출 기본 동작 막기
        event.preventDefault();

        // Ajax 호출 수행
        $.ajax({
            type: "POST",
            url: "/app/review/upload",  // 컨트롤러 URL
            data: new FormData(this),
            processData: false,
            contentType: false,
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


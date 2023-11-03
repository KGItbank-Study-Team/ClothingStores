var mySwiper1 = new Swiper ('#slide.swiper-container', {
	loop:false,
	speed:400,	
	autoplay: {
		delay: 2800,          
	  },
	slidesPerView:3.5,
	spaceBetween:14,
	freemode : true,
	scrollbar: {
		el: "#slide .swiper-scrollbar",
		hide: false
	},
	
})

$('.xans-product-headcategory.title').prependTo($('#container'));


$(function(){ 
    if($(".menuCategory > li").length==0){
         $(".menuCategory").hide();
    };
});
/**
 * 조건별 검색 기능 스크립트
 */
$(document).ready(function()
{
    var sParentElement = 'select.SecondSelect';
    $('select.FirstSelect').change(function()
    {
        var iGroupNo = $(this).find('option:selected').val();
        if (iGroupNo > 0) {
            $.ajax({
                url : '/product/provider/selectsearch.xml?GroupNo=' + iGroupNo,
                dataType : 'text',
                success : function(data){
                    if ( window.DOMParser ) {
                        tmp = new DOMParser();
                        xml = tmp.parseFromString( data , "text/xml" );
                    } else {
                        xml = new ActiveXObject( "Microsoft.XMLDOM" );
                        xml.async = "false";
                        xml.loadXML( data );
                    }

                    $(sParentElement).html('');
                    getOptionElement('','-세부항목선택-').appendTo(sParentElement);
                    var nodes = $(xml).find('searchkey');
                    for ( var x = 0 ; x < nodes.length ; x++) {
                        getOptionElement($(nodes[x]).find('search_value').text(),$(nodes[x]).find('search_value').text()).appendTo(sParentElement);
                    }
                }
            });
        }
    });
    $('a.SelectSearch').click(function()
    {
        var sGroup = $('select.FirstSelect').val();
        var sItem = $('select.SecondSelect').val();
        if (!sGroup) {
            alert('조건을 선택해 주세요.');
            return false;
        }
        if (!sItem) {
            alert('세부 항목을 선택해 주세요.');
            return false;
        }
        location.href = document.location.href.split('?')[0].split(document.domain)[1] + '?' + sSSUrl + '&sGroup=' + sGroup + '&sItem=' + sItem;
    });

    function getOptionElement(sVal, sTitle)
    {
        return $("<option value='" + sVal + "'>" + sTitle + "</option>");
    }
});
/**
 * 움직이는 배너 Jquery Plug-in
 * @author  cafe24
 */

(function($){

    $.fn.floatBanner = function(options) {
        options = $.extend({}, $.fn.floatBanner.defaults , options);

        return this.each(function() {
            var aPosition = $(this).position();
            var jbOffset = $(this).offset();
            var node = this;

            $(window).scroll(function() {
                var _top = $(document).scrollTop();
                _top = (aPosition.top < _top) ? _top : aPosition.top;

                setTimeout(function () {
                    var newinit = $(document).scrollTop();

                    if ( newinit > jbOffset.top ) {
                        _top -= jbOffset.top;
                        var container_height = $("#wrap").height();
                        var quick_height = $(node).height();
                        var cul = container_height - quick_height;
                        if(_top > cul){
                            _top = cul;
                        }
                    }else {
                        _top = 0;
                    }

                    $(node).stop().animate({top: _top}, options.animate);
                }, options.delay);
            });
        });
    };

    $.fn.floatBanner.defaults = {
        'animate'  : 500,
        'delay'    : 500
    };

})(jQuery);

/**
 * 문서 구동후 시작
 */
$(document).ready(function(){
    $('#banner:visible, #quick:visible').floatBanner();

    //placeholder
    $(".ePlaceholder input, .ePlaceholder textarea").each(function(i){
        var placeholderName = $(this).parents().attr('title');
        $(this).attr("placeholder", placeholderName);
    });
    /* placeholder ie8, ie9 */
    $.fn.extend({
        placeholder : function() {
            //IE 8 버전에는 hasPlaceholderSupport() 값이 false를 리턴
           if (hasPlaceholderSupport() === true) {
                return this;
            }
            //hasPlaceholderSupport() 값이 false 일 경우 아래 코드를 실행
            return this.each(function(){
                var findThis = $(this);
                var sPlaceholder = findThis.attr('placeholder');
                if ( ! sPlaceholder) {
                   return;
                }
                findThis.wrap('<label class="ePlaceholder" />');
                var sDisplayPlaceHolder = $(this).val() ? ' style="display:none;"' : '';
                findThis.before('<span' + sDisplayPlaceHolder + '>' + sPlaceholder + '</span>');
                this.onpropertychange = function(e){
                    e = event || e;
                    if (e.propertyName == 'value') {
                        $(this).trigger('focusout');
                    }
                };
                //공통 class
                var agent = navigator.userAgent.toLowerCase();
                if (agent.indexOf("msie") != -1) {
                    $(".ePlaceholder").css({"position":"relative"});
                    $(".ePlaceholder span").css({"position":"absolute", "padding":"0 4px", "color":"#878787"});
                    $(".ePlaceholder label").css({"padding":"0"});
                }
            });
        }
    });

    $(':input[placeholder]').placeholder(); //placeholder() 함수를 호출

    //클릭하면 placeholder 숨김
    $('body').delegate('.ePlaceholder span', 'click', function(){
        $(this).hide();
    });

    //input창 포커스 인 일때 placeholder 숨김
    $('body').delegate('.ePlaceholder :input', 'focusin', function(){
        $(this).prev('span').hide();
    });

    //input창 포커스 아웃 일때 value 가 true 이면 숨김, false 이면 보여짐
    $('body').delegate('.ePlaceholder :input', 'focusout', function(){
        if (this.value) {
            $(this).prev('span').hide();
        } else {
            $(this).prev('span').show();
        }
    });

    //input에 placeholder가 지원이 되면 true를 안되면 false를 리턴값으로 던져줌
    function hasPlaceholderSupport() {
        if ('placeholder' in document.createElement('input')) {
            return true;
        } else {
            return false;
        }
    }
});


/**
 *  tooltip
 */
$('.eTooltip').each(function(i){
    $(this).find('.btnClose').attr('tabIndex','-1');
});
//tooltip input focus
$('.eTooltip').find('input').focus(function() {
    var targetName = returnTagetName(this);
    targetName.siblings('.ec-base-tooltip').show();
});
$('.eTooltip').find('input').focusout(function() {
    var targetName = returnTagetName(this);
    targetName.siblings('.ec-base-tooltip').hide();
});
function returnTagetName(_this){
    var ePlacename = $(_this).parent().attr("class");
    var targetName;
    if(ePlacename == "ePlaceholder"){ //ePlaceholder 대응
        targetName = $(_this).parents();
    }else{
        targetName = $(_this);
    }
    return targetName;
}

/**
 *  eTab
 */
 $("body").delegate(".eTab a", "click", function(e){
    // 클릭한 li 에 selected 클래스 추가, 기존 li에 있는 selected 클래스는 삭제.
    var _li = $(this).parent("li").addClass("selected").siblings().removeClass("selected"),
    _target = $(this).attr("href"),
    _siblings = $(_target).attr("class"),
    _arr = _siblings.split(" "),
    _classSiblings = "."+_arr[0];

    //클릭한 탭에 해당하는 요소는 활성화, 기존 요소는 비활성화 함.
    $(_target).show().siblings(_classSiblings).hide();


    //preventDefault 는 a 태그 처럼 클릭 이벤트 외에 별도의 브라우저 행동을 막기 위해 사용됨.
    e.preventDefault();
});



//window popup script
function winPop(url) {
    window.open(url, "popup", "width=300,height=300,left=10,top=10,resizable=no,scrollbars=no");
}
/**
 * document.location.href split
 * return array Param
 */
function getQueryString(sKey)
{
    var sQueryString = document.location.search.substring(1);
    var aParam       = {};

    if (sQueryString) {
        var aFields = sQueryString.split("&");
        var aField  = [];
        for (var i=0; i<aFields.length; i++) {
            aField = aFields[i].split('=');
            aParam[aField[0]] = aField[1];
        }
    }

    aParam.page = aParam.page ? aParam.page : 1;
    return sKey ? aParam[sKey] : aParam;
};

$(document).ready(function(){
    // tab
    $.eTab = function(ul){
        $(ul).find('a').click(function(){
            var _li = $(this).parent('li').addClass('selected').siblings().removeClass('selected'),
                _target = $(this).attr('href'),
                _siblings = '.' + $(_target).attr('class');
            $(_target).show().siblings(_siblings).hide();
            return false
        });
    }
    if ( window.call_eTab ) {
        call_eTab();
    };
});
(function($){
$.fn.extend({
    center: function() {
        this.each(function() {
            var
                $this = $(this),
                $w = $(window);
            $this.css({
                position: "absolute",
                top: ~~(($w.height() - $this.outerHeight()) / 2) + $w.scrollTop() + "px",
                left: ~~(($w.width() - $this.outerWidth()) / 2) + $w.scrollLeft() + "px"
            });
        });
        return this;
    }
});
$(function() {
    var $container = function(){/*
<div id="modalContainer">
    <iframe id="modalContent" scroll="0" scrolling="no" frameBorder="0"></iframe>
</div>');
*/}.toString().slice(14,-3);
    $('body')
    .append($('<div id="modalBackpanel"></div>'))
    .append($($container));
    function closeModal () {
        $('#modalContainer').hide();
        $('#modalBackpanel').hide();
    }
    $('#modalBackpanel').click(closeModal);
    zoom = function ($piProductNo, $piCategoryNo, $piDisplayGroup) {
        var $url = '/product/image_zoom.html?product_no=' + $piProductNo + '&cate_no=' + $piCategoryNo + '&display_group=' + $piDisplayGroup;
        $('#modalContent').attr('src', $url);
        $('#modalContent').bind("load",function(){
            $(".header .close",this.contentWindow.document.body).bind("click", closeModal);
        });
        $('#modalBackpanel').css({width:$("body").width(),height:$("body").height(),opacity:.4}).show();
        $('#modalContainer').center().show();
    }
});
})(jQuery);


// 상품설명 li에 항목명에 따른 클래스값추가
setInterval(function(){


// 상품설명 li에 항목명에 따른 클래스값추가
$(".ec-base-product .spec > li").each(function(){	

	var title = $(this).find("strong.title span").text();

	if (title.match('용량'))	{	
		$(this).addClass("listVol");
	} else if (title.match('할인판매가')){	
		$(this).addClass("listSalePrice");
		$(this).parent().find('.listPrice').addClass('strike');
		if ($(this).find('span span').length > 0){
			var textSale = $(this).find('span span').text();
			$(this).parents('li').find('.thumbnail .salePer').text(textSale);
			$(this).parents('li').find('.thumbnail .salePer').show();
		}
		
	} else if (title.match('판매가')){	
		$(this).addClass("listPrice");
	} else if (title.match('소비자가')){	
		$(this).addClass("listCustomPrice");
	} else if (title.match('요약')){	
		$(this).addClass("listYoyak");
		$(this).hide();
	}  else if (title.match('간략')){	
		$(this).addClass("listSubname");
	} else if (title.match('모델')){	
		$(this).addClass("listModel");
	} else if (title.match('기간')){	
		$(this).addClass("listSaledate");
	} else if (title.match('TIMED')){	
		$(this).addClass("listTime");
	} else if ($(this).find('.title').hasClass('displaynone') === false) {
		$(this).addClass('line');
	}
});


$('.ec-base-product').not("[class*='relation']").find('.spec').each(function(){
	if ($(this).parent().find('.priceLine .listPrice').length == 0){
		$('.ec-base-product .spec li .color').parent('li').addClass('colorchip');
		$(this).before('<div class=priceLine><ul></ul></div>');
		$(this).find($('.listSalePrice,.listPrice,.listCustomPrice')).prependTo($(this).parent().find('.priceLine > ul'));	
		$(this).find('.listSubname').after($(this).parent().find('.priceLine'));
		$(this).find('.priceLine').after($(this).find('.colorchip .color'));
		if ($(this).parent().find('.icon img').length > 0){
			$(this).parent().find('.icon').show();
		}
	}
	
});	

},200);



/* 칼라칩위치, 흰색보더주기 */

$('.ec-base-product .spec li .chips').each(function(){
	var atitle = $(this).attr('title');
	if ( atitle == '#FFFFFF') {
		$(this).addClass('white');
	} 
});

// 가입포인트
function loop() {
	$('#join_box').animate ({ top: '+=2' }, 200) 
		.animate({ top: '-=2' }, 200)
		.animate({ top: '+=2' }, 200)
		.animate({ top: '-=2' }, 200)
		.animate({top:'-30px'}, 1000, function() {
		loop();
	});
}
loop();


$('header .search').click(function(){
	$('#one_right').toggleClass('active');
	$('body').toggleClass('mask');
	$('#one_mask').click(function(){
		$('#one_right').removeClass('active');
		$('body').removeClass('mask');
	});	
});

$('header .search1').click(function(){
	$('header #one_search').addClass('active');
	$('.hotkeyRoll').hide();
	$('header #one_search input').focus();
});

// footer toggle
$('#footer .hidden .more').click(function(){
	$(this).parent().find('.cons').slideToggle(300);
	$(this).toggleClass('xi-flip-vertical');
});

// 최근본상품 scroll

var mySwiper_recent = new Swiper ('#one_right .recent .swiper-container', {
	loop:true,
	 speed:300,
	 slidesPerView:3.5,
	spaceBetween: 10,
	allowTouchMove:false,
	navigation: {
		nextEl: '#one_right .recent .swiper-button-next',
		prevEl: '#one_right .recent .swiper-button-prev',
	  }, 
})



//상단 핫키워드 롤링
function tick(){
    $('.key_Roll li:first').slideUp(function(){$(this).appendTo($('.key_Roll')).slideDown();});
}setInterval(function(){tick()},3000);

//실시간 검색어 팝업
$(".hotkeyRoll > a").click(function() {
	$('.hotkeyRoll > a').toggleClass('on');
	$('.hotall').slideToggle(300);
});


// oneTop 
var mySwiper_oneTop = new Swiper ('#oneTop', {
	loop:true,
	speed:800,
	autoplay: {
		delay: 3500,          
	},
	direction: "vertical",
	pagination: {
		el: "#oneTop .swiper-pagination",
		clickable: true,
	},
})



// 스크롤 내릴때

var didScroll; 
var lastScrollTop = 0; 

$(window).scroll(function(event){ 
	didScroll = true; 
}); 
setInterval(function() { 
	if (didScroll) { 
		hasScrolled(); 
		didScroll = false;
	} 
},300); 

function hasScrolled() { 
	var st = $(this).scrollTop(); 
	if(Math.abs(lastScrollTop - st) <= 0) return; 

	if (st > 156){ 
		$('body').addClass('scroll');
	} else { 
		$('body').removeClass('scroll');        
	}
	lastScrollTop = st;
}





// aside

$('aside .myshop').click(function(){
	$(this).toggleClass('active');
});


/* 칼라칩위치, 흰색보더주기 */
$('.ec-base-product .spec li .color').parent('li').addClass('colorchip');

$('.ec-base-product .spec li .chips').each(function(){
	var atitle = $(this).attr('title');
	if ( atitle == '#FFFFFF') {
		$(this).addClass('white');
	} 
});










/* page */

$('.ec-base-paginate ol > li').find('.this').append('<span></span>');
if($('.ec-base-paginate ol > li').length == 1){
	$('.ec-base-paginate ol > li').find('.this').css('paddingRight','0');
	$('.ec-base-paginate ol > li').find('.this span').remove();
}



/* 페이지 - 회원 정보 수정 */

$('#cp_password').attr('placeholder','비밀번호');




setInterval(function(){
	/* 페이지 - 아이디찾기 */
	$('.xans-member-findid .findId input[type=text], .xans-member-findid .findId input[type=password]').each(function(){
		var name = $(this).parent().find('strong').text();
		$(this).attr('placeholder',name);
	});
	$('.xans-member-findid .findId #mobile1').attr('placeholder','010');
	$('.xans-member-findid .findId #mobile2').attr('placeholder','');
	$('.xans-member-findid .findId #mobile3').attr('placeholder','');

	if ($('#ssn_lable').text().match('등록번호')){
		$('.ssn_no #ssn1').attr('placeholder','외국인 등록번호');
		$('.ssn_no #ssn2').attr('placeholder','');
	} else if ($('#ssn_lable').text().match('법인번호')){
		$('.ssn_no #ssn1').attr('placeholder','법인번호');
		$('.ssn_no #ssn2').attr('placeholder','');
	}
	$('#order_id').attr('placeholder','');

	/* 페이지 - 비밀번호찾기 */

	$('.xans-member-findpasswd .findPw input[type=text], .xans-member-findpasswd .findPw input[type=password]').each(function(){
		var name = $(this).parents('li').find('strong').text();
		$(this).attr('placeholder',name);
	});
	$('.xans-member-findpasswd .findPw #mobile1').attr('placeholder','010');
	$('.xans-member-findpasswd .findPw #mobile2').attr('placeholder','');
	$('.xans-member-findpasswd .findPw #mobile3').attr('placeholder','');

	if ($('#ssn_lable').text().match('등록번호')){
		$('.ssn_no #ssn1').attr('placeholder','외국인 등록번호');
		$('.ssn_no #ssn2').attr('placeholder','');
	} else if ($('#ssn_lable').text().match('법인번호')){
		$('.ssn_no #ssn1').attr('placeholder','법인번호');
		$('.ssn_no #ssn2').attr('placeholder','');
	}
},500);



if ($('#myMenu').length > 0){
	$('#myMenu > ul > li').each(function(){
		var text = $(this).find('span').text();
		var text2 = $('.titleArea h2').text();
		if (text == text2){
			$('#myMenu > ul > li').removeClass('active');
			$(this).addClass('active');
		}
	});
}




//주문서
setInterval(function(){
$('#ec-orderform-payment-head .ec-base-table').addClass('typeWrite');
$('body#userStyle #mCafe24Order .ec-base-fold').addClass('selected');
$('body#userStyle #mCafe24Order .ec-base-fold').removeClass('eToggle');
});






// 페이징 
$('.ec-base-paginate').each(function(){
	if ($(this).find('li').length == 1){
		$(this).find('.this span').remove();
	}
});


$(document).ready(function(){
    if (typeof(EC_SHOP_MULTISHOP_SHIPPING) != "undefined") {
        var sShippingCountryCode4Cookie = 'shippingCountryCode';
        var bShippingCountryProc = false;

        // 배송국가 선택 설정이 사용안함이면 숨김
        if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingCountrySelection === false) {
            $('.xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist').hide();
            $('.xans-layout-multishoplist .xans-layout-multishoplistmultioption .xans-layout-multishoplistmultioptioncountry').hide();
        } else {
            $('.thumb .xans-layout-multishoplistitem').hide();
            var aShippingCountryCode = document.cookie.match('(^|;) ?'+sShippingCountryCode4Cookie+'=([^;]*)(;|$)');
            if (typeof(aShippingCountryCode) != 'undefined' && aShippingCountryCode != null && aShippingCountryCode.length > 2) {
                var sShippingCountryValue = aShippingCountryCode[2];
            }

            // query string으로 넘어 온 배송국가 값이 있다면, 그 값을 적용함
            var aHrefCountryValue = decodeURIComponent(location.href).split("/?country=");

            if (aHrefCountryValue.length == 2) {
                var sShippingCountryValue = aHrefCountryValue[1];
            }

            // 메인 페이지에서 국가선택을 안한 경우, 그 외의 페이지에서 셋팅된 값이 안 나오는 현상 처리
            if (location.href.split("/").length != 4 && $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val()) {
                $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a .ship span").text(" : "+$(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist option:selected").text().split("SHIPPING TO : ").join(""));

                if ($("#f_country").length > 0 && location.href.indexOf("orderform.html") > -1) {
                    $("#f_country").val($(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val());
                }
            }
            if (typeof(sShippingCountryValue) != "undefined" && sShippingCountryValue != "" && sShippingCountryValue != null) {
                sShippingCountryValue = sShippingCountryValue.split("#")[0];
                var bShippingCountryProc = true;

                $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val(sShippingCountryValue);
                $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a .ship span").text(" : "+$(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist option:selected").text().split("SHIPPING TO : ").join(""));
                var expires = new Date();
                expires.setTime(expires.getTime() + (30 * 24 * 60 * 60 * 1000)); // 30일간 쿠키 유지
                document.cookie = sShippingCountryCode4Cookie+'=' + $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val() +';path=/'+ ';expires=' + expires.toUTCString();
                if ($("#f_country").length > 0 && location.href.indexOf("orderform.html") > -1) {
                    $("#f_country").val(sShippingCountryValue).change();;
                }
            }
        }
        // 언어선택 설정이 사용안함이면 숨김
        if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingLanguageSelection === false) {
            $('.xans-layout-multishopshipping .xans-layout-multishopshippinglanguagelist').hide();
            $('.xans-layout-multishoplist .xans-layout-multishoplistmultioption .xans-layout-multishoplistmultioptionlanguage').hide();
        } else {
            $('.thumb .xans-layout-multishoplistitem').hide();
        }

        // 배송국가 및 언어 설정이 둘 다 사용안함이면 숨김
        if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShipping === false) {
            $(".xans-layout-multishopshipping").hide();
            $('.xans-layout-multishoplist .xans-layout-multishoplistmultioption').hide();
        } else if (bShippingCountryProc === false && location.href.split("/").length == 4) { // 배송국가 값을 처리한 적이 없고, 메인화면일 때만 선택 레이어를 띄움
            var sShippingCountryValue = $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val();
            $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val(sShippingCountryValue);
            $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a .ship span").text(" : "+$(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist option:selected").text().split("SHIPPING TO : ").join(""));
            // 배송국가 선택을 사용해야 레이어를 보이게 함
            if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingCountrySelection === true) {
                $(".xans-layout-multishopshipping").show();
            }
        }

        $(".xans-layout-multishopshipping .close").bind("click", function() {
            $(".xans-layout-multishopshipping").hide();
        });

        $(".xans-layout-multishopshipping .ec-base-button a").bind("click", function() {
            var expires = new Date();
            expires.setTime(expires.getTime() + (30 * 24 * 60 * 60 * 1000)); // 30일간 쿠키 유지
            document.cookie = sShippingCountryCode4Cookie+'=' + $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val() +';path=/'+ ';expires=' + expires.toUTCString();

            // 도메인 문제로 쿠키로 배송국가 설정이 안 되는 경우를 위해 query string으로 배송국가 값을 넘김
            var sQuerySting = (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingCountrySelection === false) ? "" : "/?country="+encodeURIComponent($(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val());

            location.href = '//'+$(".xans-layout-multishopshipping .xans-layout-multishopshippinglanguagelist").val()+sQuerySting;
        });
        $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a").bind("click", function() {
            $(".xans-layout-multishopshipping").show();
        });
    }
});
/**
 * 카테고리 마우스 오버 이미지
 * 카테고리 서브 메뉴 출력
 */

$(function(){

    var methods = {
        aCategory    : [],
        aSubCategory : {},

        get: function()
        {
             $.ajax({
                url : '/exec/front/Product/SubCategory',
                dataType: 'json',
                success: function(aData) {

                    if (aData == null || aData == 'undefined') return;
                    for (var i=0; i<aData.length; i++)
                    {
                        var sParentCateNo = aData[i].parent_cate_no;

                        if (!methods.aSubCategory[sParentCateNo]) {
                            methods.aSubCategory[sParentCateNo] = [];
                        }

                        methods.aSubCategory[sParentCateNo].push( aData[i] );
                    }
                }
            });
        },

        getParam: function(sUrl, sKey) {

            var aUrl         = sUrl.split('?');
            var sQueryString = aUrl[1];
            var aParam       = {};

            if (sQueryString) {
                var aFields = sQueryString.split("&");
                var aField  = [];
                for (var i=0; i<aFields.length; i++) {
                    aField = aFields[i].split('=');
                    aParam[aField[0]] = aField[1];
                }
            }
            return sKey ? aParam[sKey] : aParam;
        },

        getParamSeo: function(sUrl) {
            var aUrl         = sUrl.split('/');
            return aUrl[3] ? aUrl[3] : null;
        },

        show: function(overNode, iCateNo) {

            if (methods.aSubCategory.hasOwnProperty(iCateNo) === false) {
                return;
            }

            var aHtml = [];
            aHtml.push('<ul>');
            $(methods.aSubCategory[iCateNo]).each(function() {
                aHtml.push('<li><a href="'+this.link_product_list+'">'+this.name+'</a></li>');
            });
            aHtml.push('</ul>');


            var offset = $(overNode).offset();
            $('<div class="sub-category"></div>')
                .appendTo(overNode)
                .html(aHtml.join(''))
                .find('li').on({
                    mouseover: function(e) {
                        $(this).addClass('over');
                    },
                    mouseout: function(e) {
                        $(this).removeClass('over');
                    }
                });
        },
    };

    methods.get();


    $('.xans-layout-category li').on({
        mouseenter: function () {
            if ($(this).find('.sub-category').length == 0 ){
				var $this = $(this).addClass('on'),
					iCateNo = Number(methods.getParam($this.find('a').attr('href'), 'cate_no'));

				if (!iCateNo) {
					iCateNo = Number(methods.getParamSeo($this.find('a').attr('href')));
				}

				if (!iCateNo) {
					return;
				}
				methods.show($this, iCateNo);
            }
        }
        
    });
});


$('aside .sub #category').each(function(){
	var cate_h = $(this).height();
	$(this).height(cate_h)
});
$('aside #one_cate > ul > li.sub').click(function(){
	$('aside #one_cate > ul > li.sub > div').stop().slideUp(500);
	$(this).find('> div').stop().slideToggle(500);
});


//경로인식

var a = (window.location.href);

if (a.match('/product/list.html')){
	$("aside .cate #category").addClass("active");
}
else if (a.match('/board/')){	
	$("aside .board #category").addClass("active");
}

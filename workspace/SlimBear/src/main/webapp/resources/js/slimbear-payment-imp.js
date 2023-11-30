
	// script src 
	// https://cdn.iamport.kr/js/iamport.payment-1.2.0.js
	// https://code.jquery.com/jquery-1.12.4.min.js

	// class
	// btn-payment-select (payment-pg, payment-method) : 결제 타입 변경   
	// btn-payment : 결제 실행
	// 필수
	// payment-product-name : 제품이름
	// payment-pay-amount : 결제금
	// payment-buyer-name : 구매자 이름
	// payment-buyer-email : 이메일
	// payment-buyer-tel : 구매자 전화번호 (- 포함)
	// payment-buyer-addr1 : 구매자 행정 주소 (서울특별시 강남구 신사동)
	// payment-buyer-addr2 : 구매자 상세 주소
	// payment-buyer-postcode : 구매자 우편번호 (01181)
	// payment-order-request : 주문 요청사항
	


$(function(){
    		 let pg = null;
    	     let payMethod = null;
      
    	     $('.btn-payment-select-html5_inicis').on('click', () => {
				 pg = "html5_inicis";
    	    	 payMethod = "card" ;
    	     });
			 $('.btn-payment-select-danal').on('click', () => {
				pg = "danal";
				payMethod = "phone" ;
			});
			$('.btn-payment-select-tosspay').on('click', () => {
				pg = "tosspay";
				payMethod = "card" ;
			});
			$('.btn-payment-select-kakaopay').on('click', () => {
				pg = "kakaopay";
				payMethod = "card" ;
			});

			$('#select-address').val("0").trigger("change");

  	        $('.btn-payment').on('click', ()=>{
    	    	 
    	    	 if(pg == null || payMethod == null){
    	    		 alert('결제 방법을 선택해주세요.');
    	    		 return;
    	    	 }
    	    	 
				 // Get Required Datas
    	    	 var productname = $('.payment-product-name').text();
				 var payamount = $('.payment-pay-amount').text();
				 var buyername = $('.payment-buyer-name').val();
				 var buyeremail = $('.payment-buyer-email').val();
				 var buyertel = $('.payment-buyer-tel').val();
				 var buyeraddr1 = $('.payment-buyer-addr1').val();
				 var buyeraddr2 = $('.payment-buyer-addr2').val();
				 var buyerpostcode = $('.payment-buyer-postcode').val();

				 // Get Additional Datas
				 var orderrequest = $('.payment-order-request').val();

    	 		 // 가맹점 코드
    	    	 IMP.init("imp46764461"); 
    	    	 IMP.request_pay({
 	                pg: pg,
 	                pay_method: payMethod,
 	                merchant_uid: createOrderNum(), 
					// Required Datas
 	                name: productname,
 	                amount: payamount,                       
 	                buyer_email: buyeremail,
 	                buyer_name: buyername,
 	                buyer_tel: buyertel,
 	                buyer_addr: buyeraddr1,
 	                buyer_postcode: buyerpostcode
					//  m_redirect_url : 'https://example.com/mobile/complete', // 모바일 결제시 사용할 url
					//  digital: true, // 실제 물품인지 무형의 상품인지(핸드폰 결제에서 필수 파라미터)
					//  app_scheme : '' // 돌아올 app scheme
 	            }, function (rsp) { // callback
					if (rsp.success) {
						// 결제 성공
						console.log(rsp);
						$.ajax({
							url: '/app/order/product/payment', // 결제 완료 후 처리
							type: 'POST',
							data: {
								// Additional Datas
								imp_uid : rsp.imp_uid,
								code : rsp.merchant_uid,
								pay_pg: pg,
								type: payMethod,
								price : payamount,
								deliv_recipient : $('.recipient-name').val(),
								deliv_address : buyerpostcode + '|' + buyeraddr1 + '|' + buyeraddr2,
								deliv_tel : $('.recipient-phone').val(),
								deliv_norm_tel : $('.recipient-phone').val(),
								order_request : orderrequest,
							
							}
							,
							success : function(res) {
								console.log(res);
								// 주문 완료
								location = res.url;
							 },
							 error : function(error){
								// 주문 실패
								alert('주문 실패');
							 }
						 })
					}else{
						// 결제 실패
						alert(rsp.error_msg);
					}
 	               
 	            });
 	   		}); 

			
	
	
	});

	 
        
function createOrderNum() {
	const date = new Date();
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, "0");
	const day = String(date.getDate()).padStart(2, "0");
	
	var uuid = crypto.randomUUID().split('-')[0];
	
	let orderNum = year + month + day + '-' + uuid;
 
	return orderNum;		  
}

function reloadRecipient(userUID){
	var postData = {};
	var addrUID = $('#select-address').val();
	if(addrUID <= 0){
		postData['userUID'] = userUID;
	}else{
		postData['addrUID'] = addrUID;
	}
	$.ajax({
		url: '/app/member/addressinfo', // 결제 완료 후 처리
		type: 'POST',
		data : postData,
		success : function(data){
			$('.recipient-name').val(data.recipient);
			$('.recipient-postcode').val(data.postcode);
			$('.recipient-addr1').val(data.defaultAddr);
			$('.recipient-addr2').val(data.remainAddr);
			$('.recipient-phone').val(data.mobile1 + "-" + data.mobile2 + "-" + data.mobile3);
		},
		error : function(error){
			alert('수령인 정보 가져오기 실패')
		}
	});
}

function reloadPayment(){
	$.ajax({

	});					
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--  ////// 인클루드 할 때 CDN 삭제하기 ////// -->
	<!--  jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- bootstrap 4.4 CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" >	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
	<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
	<!-- IMP CDN  -->
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
	<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
	<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
	<!-- Font CDN -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Sunflower:300&display=swap" rel="stylesheet">
	<script type="text/javascript">
	
	var sessionId = null;
	var sessionName = null;
	var sessionMail = null;
	var sessionPhone = null;
	var itemCategory = null;
	var itemName = null;
	var price = null;
	
	$(function() {
		//	IMP init
		IMP.init('imp12736999');
		
		sessionId = "${user.userId}";
		sessionMail = "${user.mail}";
		sessionName = "${user.name}";
		sessionPhone = "${user.phone}";
		price = 100; ///////////////////// controller에서 받은 값으로 변경하기
	})
	
	
		$(document).on("click",".purchaseBtn", function() {
			itemCategory = $(this).val();
			console.log("itemCategory", itemCategory);
			if (itemCategory == "1") {
				itemName = "창";
			} else if(itemCategory == "2"){
				itemName = "방패";
			}
			
		})
	
		$(document).on("click", "#cardBtn", function() {
			var paymentOption = $(this).val();
			console.log("paymentOption", paymentOption);
			console.log("itemName", itemName);
			
			var pureAlert = $.pureAlert.confirm({
				title : "알림",
				content : "포인트 구매를 진행하시겠습니까?",
				okBtn : "구매",
				cancelBtn : "취소",
				autoShow : true,
				closeButton : false
			});
			
			pureAlert.on('ok.pure-alert', function(e) {
				
			IMP.request_pay({
			    pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
			    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
			    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
			    name : itemName,
			    amount : price,
			    buyer_email : sessionMail,
			    buyer_name : sessionName,
			    buyer_tel : sessionPhone, //누락되면 이니시스 결제창에서 오류
			},  function(rsp) {
			    if ( rsp.success ) {
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: "/purchase/rest/addPurchase", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
			    		type: 'POST',
			    		dataType: 'json',
			    		headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
			    		data: JSON.stringify({
			    			userId : sessionId,
			    			paymentOption : paymentOption,
			    			itemCategory : itemCategory,
			    			importId : rsp.imp_uid,
			    			price : price
				    		//기타 필요한 데이터가 있으면 추가 전달
			    		})
			    	}).done(function(data) {
			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			    		if ( rsp.success ) {
			    			var msg = '결제가 완료되었습니다.';
			    			/* msg += '\n고유ID : ' + rsp.imp_uid;
			    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			    			msg += '\결제 금액 : ' + rsp.paid_amount;
			    			msg += '카드 승인번호 : ' + rsp.apply_num; */
							
			    			alert(msg);
			    			$("#purchaseModal").modal("hide");
			    		} else {
			    			//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			    		}
			    	});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        //	msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			        $("#purchaseModal").modal("hide");
			        
			    }
			});
			})
			
			pureAlert.on('cancel.pure-alert', function(e) {
				$("#purchaseModal").modal("hide");
			})
			
		})
		
		$(document).on("click", "#pointBtn", function() {
			var paymentOption = $(this).val();
			console.log("itemName", itemName);
			console.log("paymentOption", paymentOption);
			
			var pureAlert = $.pureAlert.confirm({
				title : "알림",
				content : "포인트 구매를 진행하시겠습니까?",
				okBtn : "구매",
				cancelBtn : "취소",
				autoShow : true,
				closeButton : false
			});
			
			pureAlert.on('ok.pure-alert', function(e) {
			
			$.ajax({
				url: "/purchase/rest/addPurchase", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	    		type: 'POST',
	    		dataType: 'json',
	    		headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
	    		data: JSON.stringify({
	    			userId : sessionId,
	    			paymentOption : paymentOption,
	    			itemCategory : itemCategory,
	    			price : price
				}),
				success : function(data) {
					if (data.success) {
						var msg = '결제가 완료되었습니다.';
						alert(msg);
						$("#purchaseModal").modal("hide");
					} else {
						var msg = '결제에 실패하였습니다.';
						alert(msg);
						$("#purchaseModal").modal("hide");
					}
					}
				})
			})
			pureAlert.on('cancel.pure-alert', function(e) {
				$("#purchaseModal").modal("hide");
			})
			
			})
			
	
	$(document).on("click", "#listPurchase", function() {
		$.redirect("/purchase/getPurchaseList",{userId : sessionId});
	})
	
	
	</script>
	
	<style type="text/css">
	
	#purchaseModal {
	}
	
	.pointTextDiv {
		text-align: center;
		margin-bottom: 30px;
	}
	
	* {
		font-family: 'Nanum Gothic', sans-serif;
		font-weight : 100;
	}
	
	</style>
<title>어울림</title>
</head>
<body>
<!-- Button trigger modal 이 버튼의 value = itemCategory로 등록하기-->
<button type="button" class="btn btn-primary purchaseBtn" data-toggle="modal" data-target="#purchaseModal" value="1">
<input type=hidden class="itemCategory" value="1">
창 구매하기
</button>
<button type="button" class="btn btn-primary purchaseBtn" data-toggle="modal" data-target="#purchaseModal" value="2">
<input type=hidden class="itemCategory" value="2">
방패 구매하기
</button>
<button type="button" id="listPurchase">구매내역</button>

<!-- Modal -->
<div class="modal fade" id="purchaseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <p class="modal-title" id="exampleModalLabel">아이템 구매</p>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="row">
      <div class="col-sm-12 pointTextDiv">
      <p>현재 포인트 : </p> <!-- //////////////////////////// 유저포인트로 수정하기 -->
      </div>
      	<div class="col-sm-6">
        <button type="button" class="btn btn-outline-primary btn-lg btn-block" id="cardBtn" value="1">현금 구매<br/>99,000원</button>
        </div>
      	<div class="col-sm-6">
        <button type="button" class="btn btn-outline-primary btn-lg btn-block" id="pointBtn" value="2">포인트 구매<br/>99,000포인트</button>
      	</div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
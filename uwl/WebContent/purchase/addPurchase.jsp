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
	<script type="text/javascript">
		
	$(function() {
		//	IMP init
		IMP.init('imp12736999');
		
		$("#cardBtn").on("click", function() {
			IMPCard();
		})
	})
	
	
	//	IMP 카드결제
	function IMPCard() {
		var sessionId = "${user.userId}";
		var sessionMail = "${user.mail}";
		var sessionName = "${user.name}";
		var sessionPhone = "${user.phone}";
		console.log("sessionId", sessionId);
		
		IMP.request_pay({
		    pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
		    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
		    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
		    name : "창",
		    amount : "100",
		    buyer_email : sessionMail,
		    buyer_name : sessionName,
		    buyer_tel : sessionPhone, //누락되면 이니시스 결제창에서 오류
		},  function(rsp) {
		    if ( rsp.success ) {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "/purchase/rest/impInfo", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		importId : rsp.imp_uid
			    		//기타 필요한 데이터가 있으면 추가 전달
		    		}
		    	}).done(function(data) {
		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( rsp.success ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;
						
		    			alert(msg);
		    			$("form").attr("method","POST").attr("action","/purchase/addPurchase").submit();
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	});
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
	
		        alert(msg);
		    }
		});
	}

	
	
	</script>
	
	
<title>어울림</title>
</head>
<body>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
창 구매하기
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">창 구매</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="row">
      	<div class="col-sm-6">
        <button type="button" class="btn btn-primary btn-lg btn-block" id="pointBtn">포인트 구매<br/>99,000포인트</button>
      	</div>
      	<div class="col-sm-6">
        <button type="button" class="btn btn-primary btn-lg btn-block" id="cardBtn">현금 구매<br/>99,000원</button>
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
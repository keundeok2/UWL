<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ////// 인클루드 할 때 CDN 삭제하기 ////// -->
<!--  jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- bootstrap 4.4 CDN -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
<script
	src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
<script type="text/javascript">
	var sessionId = "${user.userId}";


	$(document).on("click", "#refundBtn", function() {
		var importId = $(this).val();
		var purchaseNo = $(this).next().val();
		var paymentOption = $(this).next().next().val();
		var itemNo = $(this).next().next().next().val();
		
		var pureAlert = $.pureAlert.confirm({
			title : "알림",
			content : "환불을 진행하시겠습니까?",
			okBtn : "환불",
			cancelBtn : "취소",
			autoShow : true,
			closeButton : false
		});
		pureAlert.on('ok.pure-alert', function(e) {
			console.log("importId", importId);
			console.log("purchaseNo", purchaseNo);
			console.log("sessionId", sessionId);
			console.log("paymentOption", paymentOption);
			console.log("itemNo", itemNo);
			
			
			$.ajax({
					url : "/purchase/rest/cancelPurchase",
					method : "POST",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						importId : importId,
						purchaseNo : purchaseNo,
						paymentOption : paymentOption,
						itemNo : itemNo
					}),
					success : function(d) {	
						console.log(d.code);
						if (d.code == '0') {
							console.log("success!")
							var html = "<button class='btn btn-secondary' type='button'>환불완료</button>";
							$("."+purchaseNo+"").remove();
							$(html).appendTo("#"+purchaseNo+"");
						} else if(d.code == '1'){
							console.log("failed");
						}
					}
				})
		})
	})
</script>


<style type="text/css">
body {
	margin-top: 50px;
}
</style>

<title>어울림</title>
</head>
<body>
	<div class="container">
		<div class="page-header text-info">
			<h3>구매내역</h3>
		</div>
		<br /> <br /> <br />
		<table class="table table-hover">

			<thead>
				<tr>
					<th align="center">주문번호</th>
					<th align="center">상품명</th>
					<th align="center">상품가격</th>
					<th align="center">구매방법</th>
					<th align="center">구매일</th>
					<th align="center">환불</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="p" items="${map.list}">

					<tr class="ct_list_pop">
						<td align="left">${p.purchaseNo}</td>
						<td align="left"><c:if test="${p.itemCategory == 1}">창</c:if>
							<c:if test="${p.itemCategory == 2}">방패</c:if></td>
						<td align="left">${p.price}</td>
						<td align="left"><c:if test="${p.paymentOption == 1}">카드</c:if>
							<c:if test="${p.paymentOption == 2}">포인트</c:if></td>
						<td align="left">
						${p.purchaseDate}
						<fmt:parseNumber value="${p.purchaseDate.time/(1000*60*60*24)}" var="purchaseDate_N" integerOnly="true"/>
						<fmt:parseNumber value="${now.time/(1000*60*60*24)}" var="today_N" integerOnly="true"/>
						</td>
						<td align="left" id="${p.purchaseNo}">
							<c:if test="${p.refundOption == 1}">
								<c:if test="${today_N-purchaseDate_N<8}">
								<button class="btn btn-primary ${p.purchaseNo}" id="refundBtn" value="${p.importId}">환불하기</button>
								</c:if>
							</c:if> 
							<c:if test="${p.refundOption == 2 }">
								<button class="btn btn-secondary">환불완료</button>
							</c:if> 
								<input type="hidden" value="${p.purchaseNo}"/>
								<input type="hidden" value="${p.paymentOption}">
								<input type="hidden" value="${p.itemNo}">
							</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	<!-- Modal -->
	<div class="modal fade" id="purchaseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">구매</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      <div class="row">
	      <div class="col-sm-12">
	      <h3>현재 포인트 : </h3>
	      </div>
	      	<div class="col-sm-6">
	        <button type="button" class="btn btn-primary btn-lg btn-block" id="cardBtn" value="1">현금 구매<br/>99,000원</button>
	        </div>
	      	<div class="col-sm-6">
	        <button type="button" class="btn btn-primary btn-lg btn-block" id="pointBtn" value="2">포인트 구매<br/>99,000포인트</button>
	      	</div>
	      </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>		
		
	</div>

</body>
</html>
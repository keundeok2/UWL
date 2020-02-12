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
<!-- Font CDN -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Sunflower:300&display=swap" rel="stylesheet">
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
* {
	font-family: 'Nanum Gothic', sans-serif;
	font-size:14px;
	text-align: center;
}

body {
	margin-top: 50px;
}

body{font-family:lato,sans-serif}
.container{max-width:1000px;margin-left:auto;margin-right:auto;padding-left:10px;padding-right:10px}
h2{font-size:26px;margin:20px 0;text-align:center}
small{font-size:.5em}
li{border-radius:3px;padding:25px 30px;display:flex;justify-content:space-between;margin-bottom:25px}
.table-header{background-color:#95A5A6;font-size:14px;text-transform:uppercase;letter-spacing:.03em}
.table-row{background-color:#fff;box-shadow:0 0 9px 0 rgba(0,0,0,.1)}
.col-1{flex-basis:17%}
.col-2{flex-basis:17%}
.col-3,.col-4{flex-basis:17%}
.col-5,.col-6{flex-basis:17%}
@media all and (max-width:200px){
.table-header{display:none}
li{display:block}
.col{flex-basis:100%;display:flex;padding:10px 0}
.col:before{color:#6C7A89;padding-right:10px;content:attr(data-label);flex-basis:50%;text-align:right}
}

.itemImg {
	width : 30px;
	height: 30px;
}

tbody {
	line-height: 55px;
}
</style>

<title>어울림</title>
</head>
<body>
	<div class="container">
		<div class="page-header text-info">
			<h2>아이템 구매내역</h2>
		</div>
		<table class="table table-hover">

			<thead>
				<tr class="table-header">
					<th align="center">주문번호</th>
					<th align="center">아이템</th>
					<th align="center">가격</th>
					<th align="center">결제</th>
					<th align="center">구매일</th>
					<th align="center">환불</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="p" items="${map.list}">

					<tr class="ct_list_pop">
						<td align="left">${p.purchaseNo}</td>
						<td align="left">
							<c:if test="${p.itemCategory == 1}">
								<img src="/images/spear.png" class="itemImg"/>
							</c:if>
							<c:if test="${p.itemCategory == 2}">
								<img src="/images/shield.png" class="itemImg"/>
							</c:if></td>
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
								<button class="btn btn-outline-primary ${p.purchaseNo}" id="refundBtn" value="${p.importId}">환불하기</button>
								</c:if>
							</c:if> 
							<c:if test="${p.refundOption == 2 }">
								<button class="btn btn-outline-secondary">환불완료</button>
							</c:if> 
								<input type="hidden" value="${p.purchaseNo}"/>
								<input type="hidden" value="${p.paymentOption}">
								<input type="hidden" value="${p.itemNo}">
							</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>
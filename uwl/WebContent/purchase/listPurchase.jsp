
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="/css/mainMain.css">
<!-- <link rel="stylesheet" href="/css/mainLeft.css"> -->
<link rel="stylesheet" href="/css/mainRight.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
<script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->

<script src="/javascript/common.js"></script>
<script src="/javascript/mainLeft.js"></script>
<script src="/javascript/mainRight.js"></script>

<script type="text/javascript">


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
			console.log("sessionUserId", sessionUserId);
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
						var html = "<button class='btn btn-outline-secondary' type='button'>환불완료</button>";
						$("."+purchaseNo+"").remove();
						$(html).appendTo("#"+purchaseNo+"");
					}
				})
		})
	})

</script>
<style type="text/css">

.itemImg {
	width : 30px;
	height: 30px;
}
tbody {
	line-height: 55px;
}

</style>
</head>

<body>
<div id="wrap">
    <div id="left">
        <jsp:include page="/mainTest/mainLeft.jsp" />
    </div>
    <div id="main">
        <!--여기에 작업-->
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
                            <td align="left"><c:if test="${p.itemCategory == 1}">
                                    <img src="/images/spear.png" class="itemImg" />
                                </c:if> <c:if test="${p.itemCategory == 2}">
                                    <img src="/images/shield.png" class="itemImg" />
                                </c:if></td>
                            <td align="left">${p.price}</td>
                            <td align="left"><c:if test="${p.paymentOption == 1}">카드</c:if>
                                <c:if test="${p.paymentOption == 2}">포인트</c:if></td>
                            <td align="left">${p.purchaseDate} <fmt:parseNumber
                                    value="${p.purchaseDate.time/(1000*60*60*24)}"
                                    var="purchaseDate_N" integerOnly="true" /> <fmt:parseNumber
                                    value="${now.time/(1000*60*60*24)}" var="today_N"
                                    integerOnly="true" />
                            </td>
                            <td align="left" id="${p.purchaseNo}"><c:if
                                    test="${p.refundOption == 1}">
                                    <c:if test="${today_N-purchaseDate_N<8}">
                                        <button class="btn btn-outline-primary ${p.purchaseNo}"
                                            id="refundBtn" value="${p.importId}">환불하기</button>
                                    </c:if>
                                </c:if> <c:if test="${p.refundOption == 2 }">
                                    <button class="btn btn-outline-secondary">환불완료</button>
                                </c:if> <input type="hidden" value="${p.purchaseNo}" /> <input
                                type="hidden" value="${p.paymentOption}"> <input
                                type="hidden" value="${p.itemNo}"></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    
        
    </div>
    <div id="right">
        <jsp:include page="/mainTest/mainRight.jsp" />
    </div>
</div>
</body>

</html>

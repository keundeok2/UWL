<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--  CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>
    <title>Document</title>
    <script type="text/javascript">
        $(document).on("click", "#refundBtn", function() {
            var importId = $(this).val();
            var purchaseNo = $(this).next().val();
            var paymentOption = $(this).next().next().val();
            var itemNo = $(this).next().next().next().val();

            var pureAlert = $.pureAlert.confirm({
                title: "알림",
                content: "환불을 진행하시겠습니까?",
                okBtn: "환불",
                cancelBtn: "취소",
                autoShow: true,
                closeButton: false
            });
            pureAlert.on('ok.pure-alert', function(e) {
                console.log("importId", importId);
                console.log("purchaseNo", purchaseNo);
                console.log("sessionUserId", sessionUserId);
                console.log("paymentOption", paymentOption);
                console.log("itemNo", itemNo);

                $.ajax({
                    url: "/purchase/rest/cancelPurchase",
                    method: "POST",
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json"
                    },
                    data: JSON.stringify({
                        importId: importId,
                        purchaseNo: purchaseNo,
                        paymentOption: paymentOption,
                        itemNo: itemNo
                    }),
                    success: function(d) {
                        var html = "<button class='btn btn-outline-secondary btn-sm' type='button'>환불완료</button>";
                        $("." + purchaseNo + "").remove();
                        $(html).appendTo("#" + purchaseNo + "");
                    }
                })
            })
        })
    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        a:hover {
            text-decoration: none;
            color: inherit;
        }

        body {

            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }





        .itemImg {
            width: 30px;
            height: 30px;
        }

        tbody {
            line-height: 55px;
        }
    </style>

    <style>
        div.layoutWrap {

            width: 100%;
            min-height: 200vh;
            padding: 0 20%;
            position: relative;
        }

        div.leftToolbar {
            width: 20%;
            height: 100vh;

            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            background: #fff;
            border-right: 1px solid #eee;
        }

        div.rightToolbar {
            width: 20%;
            height: 100vh;

            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            background: #fff;
            border-left: 1px solid #eee;
        }
    </style>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;

        }

        a:hover,
        a:focus {
            text-decoration: none;
            color: inherit;
        }

        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }

        div.layoutWrap2 {
            width: 1500px;
            height: 100vh;

            margin: 0 auto;
            overflow: hidden;
        }

        div.leftToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-right: 1px solid #eee;
        }

        div.work2 {

            width: 900px;
            height: 100vh;
            float: left;
            overflow: hidden;
            overflow-y: scroll;

        }

        div.rightToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-left: 1px solid #eee;
        }
    </style>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2">
            <div>
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
                                <td align="left">${p.purchaseNo} ${p.item.secondUserId}</td>
                                <td align="left">
                                    <c:if test="${p.itemCategory == 1}">
                                        <img src="/images/spear.png" class="itemImg" />
                                    </c:if>
                                    <c:if test="${p.itemCategory == 2}">
                                        <img src="/images/shield.png" class="itemImg" />
                                    </c:if>
                                </td>
                                <td align="left">${p.price}</td>
                                <td align="left">
                                    <c:if test="${p.paymentOption == 1}">카드</c:if>
                                    <c:if test="${p.paymentOption == 2}">포인트</c:if>
                                </td>
                                <td align="left">${p.purchaseDate}
                                    <fmt:parseNumber value="${p.purchaseDate.time/(1000*60*60*24)}" var="purchaseDate_N" integerOnly="true" />
                                    <fmt:parseNumber value="${now.time/(1000*60*60*24)}" var="today_N" integerOnly="true" />
                                </td>
                                <td align="left" id="${p.purchaseNo}">
                                    <c:if test="${p.refundOption == 1}">
                                        <c:if test="${today_N-purchaseDate_N<8}">
                                        	<c:if test="${empty p.item.secondUserId }">
                                            <button class="btn btn-outline-primary ${p.purchaseNo} btn-sm" id="refundBtn" value="${p.importId}">환불하기</button>
                                        	</c:if>
                                        </c:if>
                                        <c:if test="${!empty p.item.secondUserId || today_N-purchaseDate_N>=8}">
	                                        <button class="btn btn-outline-danger btn-sm">환불불가</button>
	                                    </c:if>
                                    </c:if>
                                    <c:if test="${p.refundOption == 2 }">
                                        <button class="btn btn-outline-secondary btn-sm">환불완료</button>
                                    </c:if>
                                    <input type="hidden" value="${p.purchaseNo}" />
                                    <input type="hidden" value="${p.paymentOption}">
                                    <input type="hidden" value="${p.itemNo}">
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>
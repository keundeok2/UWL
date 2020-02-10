<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
	var questionPostNo = null;
	var sessionId = "${user.userId}"

	$(document).on("click","button.replyBtn", function() {
		
		questionPostNo = $(this).next().next().val();
		console.log("questionPostNo", questionPostNo);
		$("textarea").remove();
		$(".regBtn").remove();
		$("."+questionPostNo+"").remove();
		var html = "<textarea class='form-control "+questionPostNo+"' rows='3' id='textarea'></textarea>"
					+"<button class='btn btn-primary btn-sm "+questionPostNo+" regBtn'>답변등록</button>"
		$("#"+questionPostNo+"").append(html);

	})
	
	$(document).on("click", ".regBtn", function() {
		var content = $("textarea").val();
		console.log(content)
		console.log(sessionId)
		$.redirect("/social/replyQuestion", {userId : sessionId, questionPostNo : questionPostNo, answerContent : content})
		
	})
	
	$(document).on("click", ".rejectBtn", function() {
		questionPostNo = $(this).next().val();
		console.log("questionPostNo", questionPostNo);
		var pureAlert = $.pureAlert.confirm({
			title : "알림",
			content : "답변을 거절하시겠습니까? <br/> 거절된 질문은 삭제됩니다.",
			okBtn : "거절",
			cancelBtn : "취소",
			autoShow : true,
			closeButton : false
		});
		pureAlert.on('ok.pure-alert', function(e){
			$.redirect('/social/rejectQuestion',{questionPostNo : questionPostNo});
		})
	})
</script>

<style type="text/css">

body {
	margin : 50px;
}


</style>
<title>어울림</title>
</head>
<body>
	<div class="container">
		<div class="col-md-6">
		<p>${map.totalCount}개의 새 질문</p>
		<c:forEach var="ask" items="${map.list}">
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 flex-column position-static" id="${ask.questionPostNo}">
					<strong class="d-inline-block mb-2 text-primary">익명</strong>
					<h4 class="mb-0">${ask.questionTitle}</h4>
					<p class="mb-0">${ask.questionContent}</p>
					<div class="mb-1 text-muted">${ask.questionDate}</div>
					<button class="btn btn-primary btn-sm replyBtn">답변</button>
					<button class="btn btn-secondary btn-sm rejectBtn">거절</button>
					<input type="hidden" value="${ask.questionPostNo}">
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
</body>
</html>
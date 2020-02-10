<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--  jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
<script
	src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
<script type="text/javascript">

var sessionId = "${user.userId}"
	$(function() {

		$("#1").on("click", function() {
			$.redirect("/social/addQuestion/user01",{},"GET")
		})
		
		$("#2").on("click", function() {
			$.redirect("/social/getAskList/user01",{},"GET")
		})
		
		$("#3").on("click", function() {
			$.redirect("/social/getAskQuestionList",{userId : sessionId})
		})
		
		$("#4").on("click", function() {
			$.redirect("/social/getTimelineList/user01", {}, "GET")
		})

	})
</script>
<title>Insert title here</title>
</head>
<body>
	<button id="1">질문등록</button>
	<button id="2">ASK</button>
	<button id="3">질문확인</button>
	<button id="4">타임라인</button>
</body>
</html>
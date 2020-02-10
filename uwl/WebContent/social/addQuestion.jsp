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

$(document).on("click", "#addQuestion", function() {
	$("#addQuestionForm").attr("method","post").attr("action","/social/addQuestion").submit();
})
</script>
<title>어울림</title>
</head>
<body>
	<div class="container">
		<form id="addQuestionForm">
			<label for="exampleFormControlInput1">제목</label>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="questionTitle" placeholder="제목을 입력하세요">
			</div>
			<label for="exampleFormControlInput1">내용</label>
			<div class="input-group">
				<textarea class="form-control" name="questionContent" style="height:150px" placeholder="내용을 입력하세요"></textarea>
			</div>
			<input type="hidden" name="userId" value="${targetUserId}">
			<button class="btn btn-primary btn-rt" id="addQuestion">질문 등록하기</button>
		</form>
	</div>
</body>
</html>
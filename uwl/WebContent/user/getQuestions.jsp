<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
	    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
	    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<title>Insert title here</title>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

// 	$(function() {
// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 		$("button").on("click", function() {
// 			self.location = "/user/updateUser?userId=${user.userId}";
// 		});
// 	});
	
</script>
</head>


<body>
<h1>문의사항 내용</h1>
    <hr>
  <br>
	 아이디 : <div>${user.userId}</div>
	 <br>
<%-- 	 게시글 번호 : <div>${post.postNo}</div> --%>
<!-- 	 <br> -->
	 제목 : <div>${post.postTitle}</div>
	 <br>
	 내용 : <div>${post.postContent}</div>
	 <br>
<%-- 	 날짜 : <div>${post.postDate}</div> --%>
<!-- 	 <br> -->
	 조회수 : <div>${post.hitCount}</div>
	 <br>
	 
	 <c:if test="${post.viewStatus == '1' or post.viewStatus == null}">
							공개여부 : 공개
	</c:if>
	<c:if test="${post.viewStatus == '2'}">
							공개여부 : 비공개
	</c:if>
	 <br>
	 <br>
	 <c:if test="${post.questionStatus == '1' or post.questionStatus == null}">
							답변여부 : 미처리
	</c:if>
	<c:if test="${post.questionStatus == '2'}">
							답변여부 : 처리
	</c:if>
	 <br>
	 
<%-- 	 <input type="hidden"	id="userId" name="userId" value="${user.userId}"/> --%>
<%-- 	 <input type="hidden"	id="postNo" name="postNo" value="${post.postNo}"/> --%>
<%-- 	 <input type="hidden"	 value="${post.postTitle}"/>${post.postTitle} --%>
<br>

<!-- 	<button type="button" id="updateUser">정보수정</button> -->
    <button onclick="location.href='/index.jsp'">확인</button><br>
    <button onclick="location.href='/user/updateQuestions.jsp'">수정</button><br>
    <button onclick="location.href='/user/getUserQuestions'">나의 문의사항</button><br>
    <a href="javascript:history.go(-1)">뒤로</a>
</body>
</html>

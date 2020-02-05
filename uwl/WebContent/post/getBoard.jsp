<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>

<body>
	<form>
		<h1>카테고리 이름</h1>
			<c:if test="${post.gatherCategoryNo eq '201' }">
				진학상담
			</c:if>
			<c:if test="${post.gatherCategoryNo eq '202' }">
				사랑과이별
			</c:if>
			<c:if test="${post.gatherCategoryNo eq '203' }">
				남자끼리
			</c:if>
			<c:if test="${post.gatherCategoryNo eq '204' }">
				여자끼리
			</c:if>
			<c:if test="${post.gatherCategoryNo eq '205' }">
				데이트자랑
			</c:if>
			<c:if test="${post.gatherCategoryNo eq '206' }">
				대나무 숲
			</c:if>
			
	
		<br>
		<div>
			제목
			${post.postTitle}
		</div>
		<br>
		<div>${post.postDate }</div>
		<br>
		<div>
			${post.userId}
		</div>
		<br> 좋아요수${post.likeCount}&emsp;조회수${post.hitCount }&emsp;댓글수${post.commentCount} <br> <br>
		 
		<a href="/post/updateBoard?postNo=${post.postNo }">수정</a> 
		
		<input type="hidden" name="gatherCategoryNo" value="${post.gatherCategoryNo }">
		<a href="/post/deleteBoard?gatherCategoryNo=${post.gatherCategoryNo }&postNo=${post.postNo }">삭제</a>
		<!--if 문으로 본인 게시판일 때만 출력되도록 설정-->
		<input type="button" value="신고">
		<!--신고 버튼 누르면 모달창 출력해야됨-->
		<br>
		<br>
		<hr>
		<div>
			내용
			${post.postContent }
		</div>
		<br> <br> <input type="button" value="좋아요">
		
		<br><br>
		<a href="javascript:history.go(-1)">뒤로</a>
	</form>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        <h1>공지사항 조회</h1>
        <br>
        <div>제목 : ${post.postTitle }</div>
        <br>
        <div>작성날짜 : ${post.postDate }</div>
        <br>
        <div>운영자 아이디 : ${post.userId }</div>
        <br>
        <div>조회수 : ${post.hitCount }</div>
        <br>
        <div>공지 카테고리 : ${post.gatherCategoryNo }</div>
        <br>
        <div>내용 : ${post.postContent }</div>
        <br>
        <br>
        <hr>
        <a href="/post/updateNotice?postNo=${post.postNo }">수정</a>
        <a href="/post/deleteNotice?postNo=${post.postNo }">삭제</a>
        <a href="javascript:history.go(-1)">뒤로</a>
        <br><br>
    </form>
</body>
</html>
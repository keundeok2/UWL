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
	<h1>게시판 수정</h1>
 <!-- 썸네일 등록-->
  <form  action="/post/updateBoard" method="POST" enctype="multipart/form-data">   <!--if문 넣어서 selected 지정해주기-->
    <select name="gatherCategoryNo">
        <option value="201" ${post.gatherCategoryNo eq '201' ? "selected" : "" }>진학/진로 상담</option>
        <option value="202" ${post.gatherCategoryNo eq '202' ? "selected" : "" }>시랑과 이별</option>
        <option value="203" ${post.gatherCategoryNo eq '203' ? "selected" : "" }>남자들끼리만</option>
        <option value="204" ${post.gatherCategoryNo eq '204' ? "selected" : "" }>여자들끼리만</option>
        <option value="205" ${post.gatherCategoryNo eq '205' ? "selected" : "" }>데이트 자랑</option>
        <option value="206" ${post.gatherCategoryNo eq '206' ? "selected" : "" }>대나무 숲</option>        
    </select>
    <hr>
    <input type="hidden" name="postNo" value="${post.postNo }">
    제목 : <input type="text" name="postTitle" value="${post.postTitle}">
    <!--기존 제목 출력-->
    <br>
    <br>
    <textarea cols="50" rows="10" name="postContent">${post.postContent }</textarea>
    <!-- 기존 내용 출력-->
    <br>
    썸네일 : <input type="file" name="fileName" value="${post.uploadFileName}">
    <br>
    <input type="submit" value="수정"><br>
    <a href="javascript:history.go(-1)">뒤로</a>
   </form>
</body>
</html>
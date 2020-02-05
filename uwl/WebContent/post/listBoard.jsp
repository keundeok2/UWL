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
    <c:if test="${gatherCategoryNo eq '201' }">
    	<h1>진학상담</h1>
    </c:if>
    <c:if test="${gatherCategoryNo eq '202' }">
    	<h1>사랑과 이별</h1>
    </c:if>
    <c:if test="${gatherCategoryNo eq '203' }">
    	<h1>남자끼리</h1>
    </c:if>
    <c:if test="${gatherCategoryNo eq '204' }">
    	<h1>여자끼리</h1>
    </c:if>
    <c:if test="${gatherCategoryNo eq '205' }">
    	<h1>데이트</h1>
    </c:if>
    <c:if test="${gatherCategoryNo eq '206' }">
    	<h1>대나무 숲</h1>
    </c:if>
        <br> 
       <button type="button" value="1">조회수 ↑</button>
       <button type="button" value="2">좋아요 ↑</button>
       <button type="button" value="3">작성일 ↑</button>
       

       <select name="searchCondition">
        <option value="1">제목</option>
        <option value="2">제목 + 내용</option>
        <option value="3">작성자</option>
    </select>
    <input type="text" name="searchKeyword" placeholder="검색어 입력">
    <input type="button" value="검색">
    <br><br><br>
    <!--for문 돌릴것-->
    <c:forEach var="post" items="${list }">
    	<img src="../../images/imgdemo.jpg"><br>	<!-- 여기에 파일이름 넣기 ㅋㅋ${post.uploadFileName} -->
    	제목 : <a href="/post/getBoard?postNo=${post.postNo }">${post.postTitle }</a><br>
    	닉네임 : ${post.userId }<br>
    	카테고리이 이름 : ${post.gatherCategoryNo }<br>
    	작성일 : ${post.postDate }<br>
    	내용미리보기..? : ${post.postContent }<br>
    	좋아요 수 : ${post.likeCount }<br>
    	조회 수 : ${post.hitCount }<br>
    	댓글 수 : ${post.commentCount }<br>
    	<br><br><br>
    </c:forEach>
    <br><br>
    <a href="/post/addBoard?gatherCategoryNo=${gatherCategoryNo }">글작성</a>
    </form>
</body>
</html>
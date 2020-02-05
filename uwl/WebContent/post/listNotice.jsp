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
    <h1>공지사항</h1>
        <br> 
    <!--카테고리 검색 조금더 고민해봅시다-->
    <!--for문 돌릴것-->
    <c:forEach var="notice" items="${list }">
    	&emsp;<span>카테고리:${notice.gatherCategoryNo }</span>
	    &emsp;<a href="/post/getNotice?postNo=${notice.postNo }">${notice.postTitle }</a>
	    &emsp;<span>닉네임:${notice.userId }</span>
	    &emsp;<span>작성일:${notice.postDate }</span>
	    &emsp;<span>조회수:${notice.hitCount }</span>
	    <br>
    </c:forEach>
    
    <br><br>
    <a href="/post/addNotice">공지사항 등록</a>
    <a href="javascript:history.go(-1)">뒤로</a>
    </form>
</body>
</html>
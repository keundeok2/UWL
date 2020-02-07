<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form action="">
    
    	
        <h3>커플 타임라인 댓글 목록</h3>
        <input type="text" name="userId" value="${userId }"><br>
        
        <c:forEach var="comment" items="${list }">
	        <input type="text" name="commentNo" value="${comment.commentNo }">
	        <input type="text" name="userId2" value="${comment.userId }">
	        <input type="text" name="commentContent" value="${comment.commentContent }">
	        <input type="text" name="postDate" value="${comment.postDate }">
	        <a href="/couple/deleteCoupleTimelineComment?commentNo=${comment.commentNo }">삭제</a><br>
    	</c:forEach>
        
        
        
    </form>
</body>
</html>
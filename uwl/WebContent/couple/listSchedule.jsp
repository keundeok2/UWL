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
        <h3>������ ���</h3>
        <input type="text" name="userId" value="${userId }"><br>
        
        <c:forEach var="post" items="${list }">
	        postNo : <input type="text" name="postNo" value="${post.postNo }"><br>
	        userId2 : <input type="text" name="userId2" value="${post.userId }"><br>
	        postDate : <input type="text" name="postDate" value="${post.postDate }"><br>
	        postTitle : <input type="text" name="postTitle" value="${post.postTitle }"><br>
	        <a href="/couple/getScheduleList?postNo=${postNo }">����</a>
        </c:forEach>
        
        
    </form>
</body>
</html>
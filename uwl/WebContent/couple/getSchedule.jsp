<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form action="">
        <h3>������ ����</h3>
        <input type="text" name="userId" value="${userId }"><br>
        postNo : <input type="text" name="postNo" value="${postNo }"><br>
        postTitle : <input type="text" name="postTitle" value="${postTitle }"><br>
        postDate : <input type="text" name="postDate" value="${postDate }"><br>
        place : <input type="text" name="place" value="${place }"><br>
        postContent : <input type="text" name="postContent" value="${postContent }"><br>
        <a href="/couple/updateSchedule?postNo=${postNo }">����</a>
        <a href="/couple/deleteSchedule?postNo=${postNo }">����</a>
    </form>
</body>
</html>
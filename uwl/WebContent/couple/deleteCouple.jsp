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
        <h3>매칭 끊기</h3>
        
        <input type="text" name="userId"><br>
        
        <a href="/couple/deleteCouple2?userId=${userId }">매칭끊기</a>
    </form>
</body>
</html>
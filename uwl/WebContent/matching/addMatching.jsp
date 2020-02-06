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
        <input type="text" name="userId">
        <input type="text" name="secondUserId"><br><br>
        <a href="/matching/addMatching?userId=${userId}&secondUserId=${secondUserId}">꽃보내기</a>
    </form>
</body>
</html>
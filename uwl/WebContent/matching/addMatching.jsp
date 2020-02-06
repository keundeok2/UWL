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
        <h3>사람들 프로필</h3>
        <input type="text" name="userId">
        <input type="text" name="secondUserId"><br><br>
        <input type="text" name="secondUserId" value="secondUserId">
        <a href="/matching/addMatching2?userId=${userId}&secondUserId=${secondUserId}">
        	꽃보내기
        </a>
        <a href="/matching/deleteMatching?userId=${userId }&secondUserId=${secondUserId}">
        	꽃보내기취소
        </a>
        <a href="/matching/updateItem?userId=${userId}&secondUserId=${secondUserId}">
        	찔러보기
        </a><br>
        받은 꽃 개수 : <input type="text" name="totalMatching" value="${totalMatching}">
    </form>
</body>
</html>
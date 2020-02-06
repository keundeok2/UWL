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
       <h3>내 프로필</h3>
        <input type="text" name="userId" value="${userId }">
        <input type="text" name="secondUserId" value="${secondUserId }"><br><br>
        <input type="text" name="secondUserId" value="${secondUserId}"><br>
        받은 꽃 개수 : <input type="text" name="totalMatching" value="${totalMatching}"><br>
        창 개수 : <input type="text" name="totalItem1" value="${totalItem}"><br>
        방패 개수 : <input type="text" name="totalItem2" value="${totalItem2}">
    </form>
</body>
</html>
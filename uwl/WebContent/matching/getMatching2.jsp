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
       <h3>�� ������</h3>
        <input type="text" name="userId">
        <input type="text" name="secondUserId"><br><br>
        <input type="text" name="secondUserId" value="${secondUserId}"><br>
        ���� �� ���� : <input type="text" name="totalMatching" value="${totalMatching}"><br>
        â ���� : <input type="text" name="totalItem1" value="${totalItem}"><br>
        ���� ���� : <input type="text" name="totalItem2" value="${totalItem2}">
    </form>
</body>
</html>
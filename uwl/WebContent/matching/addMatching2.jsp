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
       <h3>�� �����°� Ȯ��</h3>
        <input type="text" name="userId" value="${userId }">
        <input type="text" name="secondUserId" value="${secondUserId }"><br><br>
        <input type="text" name="secondUserId" value="${secondUserId}">�Կ��� ���� �����ðڽ��ϱ�? 30�� �� ��Ұ� �����մϴ�.<br>
        <a href="/matching/addMatching3?userId=${userId}&secondUserId=${secondUserId}">Ȯ��</a>
    </form>
</body>
</html>
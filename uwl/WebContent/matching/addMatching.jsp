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
        <h3>����� ������</h3>
        <input type="text" name="userId">
        <input type="text" name="secondUserId"><br><br>
        <input type="text" name="secondUserId" value="secondUserId">
        <a href="/matching/addMatching2?userId=${userId}&secondUserId=${secondUserId}">
        	�ɺ�����
        </a>
        <a href="/matching/deleteMatching?userId=${userId }&secondUserId=${secondUserId}">
        	�ɺ��������
        </a>
        <a href="/matching/updateItem?userId=${userId}&secondUserId=${secondUserId}">
        	�񷯺���
        </a><br>
        ���� �� ���� : <input type="text" name="totalMatching" value="${totalMatching}">
    </form>
</body>
</html>
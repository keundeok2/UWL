<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form action="/couple/addCoupleTimelineComment" method="post">
        <h3>커플 타임라인 댓글 등록</h3>
        
        <input type="text" name="userId" value="${userId }"><br>
        
        <input type="text" name="commentContent">
        
        <button type="submit">등록</button>
    </form>
</body>
</html>
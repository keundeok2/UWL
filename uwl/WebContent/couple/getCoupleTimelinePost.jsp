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
        <h3>커플 타임라인 게시글 보기</h3>
        <input type="text" name="userId" value="${userId }"><br>
        
        postNo : <input type="text" name="postNo" value="${post.postNo }"><br>
        userId : <input type="text" name="userId" value="${post.userId }"><br>
        postDate : <input type="text" name="postDate" value="${post.postDate }"><br>
        uploadFileName : <input type="text" name="uploadFileName" value="${post.uploadFileName }"><br>
        postTitle : <input type="text" name="postTitle" value="${post.postTitle }"><br>
        place : <input type="text" name="place" value="${post.place }"><br>
        postContent : <input type="text" name="postContent" value="${post.postContent }"><br>
        
        <a href="/couple/updateCoupleTimelinePost?userId=${userId }&postNo=${post.postNo }">수정</a>
        <a href="/couple/deleteCoupleTimelinePost?userId=${userId }&postNo=${post.postNo }">삭제</a>
    </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>

<body>
   <input type="hidden" id="sessionUserId" name="sessionUserId" value="${user.userId}">
    <div class="search2">
        <i class="fas fa-search"></i><input type="text" placeholder="어울림 검색">
    </div>
    <div class="friendList">
        <ul>
            <li>친구 목록<i class="fas fa-cog"></i></li>
        </ul>
    </div>
</body>

</html>

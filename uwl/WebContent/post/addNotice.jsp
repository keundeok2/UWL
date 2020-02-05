<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
	    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
	    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<title>Insert title here</title>
</head>
<body>
 <!-- 썸네일 등록-->
  <form method="post" action="/post/addNotice">   <!--if문 넣어서 selected 지정해주기-->
  <h1>공지사항 등록</h1>
   <!--	//	101 : 매칭
		//	102 : 아이템
		//	103 : 도전과제
		//	104 : 결제
		//	105 : 친구
		//	106 : 타임라인
		//	107 : ASK
		//	108 : 계정
		//	109 : 알림
		//	110 : 위치
		//	111 : 기타-->
    <select name="gatherCategoryNo">
        <option value="101">매칭</option>
        <option value="102">아이템</option>
        <option value="103">도전과제</option>
        <option value="104">결제</option>
        <option value="105">친구</option>
        <option value="106">타임라인</option>        
        <option value="107">ASK</option>        
        <option value="108">계정</option>        
        <option value="109">알림</option>        
        <option value="110">위치</option>        
        <option value="111">기타</option>        
    </select>
    <hr>
    <input type="hidden" name="userId" value="user13">
    제목 : <input type="text" name="postTitle"/>
    <br>
    <br>
    <textarea cols="50" rows="10" placeholder="내용입력" name="postContent"></textarea>
    <br>
    <button>등록</button>
    </form>
</body>
</html>
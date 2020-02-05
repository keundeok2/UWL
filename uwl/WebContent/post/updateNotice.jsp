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
  <form method="POST" action="/post/updateNotice">  
  <input type="hidden" name="postNo" value="${post.postNo }">
  <h1>공지사항 수정</h1>
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
        <option value="101" ${post.gatherCategoryNo eq '101' ? "selected" : "" }>매칭</option>
        <option value="102" ${post.gatherCategoryNo eq '102' ? "selected" : "" }>아이템</option>
        <option value="103" ${post.gatherCategoryNo eq '103' ? "selected" : "" }>도전과제</option>
        <option value="104" ${post.gatherCategoryNo eq '104' ? "selected" : "" }>결제</option>
        <option value="105" ${post.gatherCategoryNo eq '105' ? "selected" : "" }>친구</option>
        <option value="106" ${post.gatherCategoryNo eq '106' ? "selected" : "" }>타임라인</option>        
        <option value="107" ${post.gatherCategoryNo eq '107' ? "selected" : "" }>ASK</option>        
        <option value="108" ${post.gatherCategoryNo eq '108' ? "selected" : "" }>계정</option>        
        <option value="109" ${post.gatherCategoryNo eq '109' ? "selected" : "" }>알림</option>        
        <option value="110" ${post.gatherCategoryNo eq '110' ? "selected" : "" }>위치</option>        
        <option value="111" ${post.gatherCategoryNo eq '111' ? "selected" : "" }>기타</option> 
        <!-- 기존 카테고리 selected-->       
    </select>
    <hr>
    제목 : <input type="text" name="postTitle" value="${post.postTitle }"/>
    <br>
    <br>
    <textarea cols="50" rows="10" name="postContent">${post.postContent }</textarea>
    <br>
    <input type="submit" value="등록">
    <a href="javascript:history.go(-1)">뒤로</a>
   </form>
</body>
</html>
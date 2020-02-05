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
    <form>
       <h1>신고 목록</h1>
        <br>
        <a href="/report/listReport?searchCondition=1">미처리 신고목록</a>
        &emsp;&emsp;&emsp;&emsp;
        <a href="/report/listReport?searchCondition=2">처리 완료된 신고목록</a>
        <br><br>
    <!--for문 돌릴것-->
    <c:set var="i" value="0" />
    <c:forEach var="report" items="${list }">
    	<c:set var="i" value="${ i+1 }" />
    	<span><a href="/report/getReport?reportNo=${report.reportNo }">넘버링 : ${i }</a></span>&emsp;
	    <span>신고자 : ${report.userId01 }</span>&emsp;
	    <span>신고받은자 : ${report.userId02 }</span>&emsp;
	    <c:if test="${report.reportCategoryNo == '1' }">
        	<span>신고 카테고리 : 부적적한 게시글</span>
        </c:if>
        <c:if test="${report.reportCategoryNo == '2' }">
        	<span>신고 카테고리 : 음란성 게시글</span>
        </c:if>
        <c:if test="${report.reportCategoryNo == '3' }">
        	<span>신고 카테고리 : 명예훼손 / 저작권 침해</span>
        </c:if>
        <c:if test="${report.reportCategoryNo == '4' }">
        	<span>신고 카테고리 : 기타</span>	
        </c:if>
        &emsp;
        <c:if test="${report.reportStatus == '1' }">
		    <span>처리상태 : 미처리</span>&emsp;
        </c:if>
        <c:if test="${report.reportStatus == '2' }">
        	<span>처리상태 : 처리완료</span>&emsp;
        </c:if>
	    <span>신고날짜 : ${report.reportDate }</span>&emsp;
	    <c:if test="${report.stopDate != '0' }">
		    <span>정지날짜 : ${report.stopDate }</span>
	    </c:if>
	    <c:if test="${report.reportWhat == '1' }">
	    	<span>신고종류 : 게시글</span>
	    </c:if>
	    <c:if test="${report.reportWhat == '2' }">
	    	<span>신고종류 : 댓글</span>
	    </c:if>
	    <br><br>
    </c:forEach>
     <a href="javascript:history.go(-1)">뒤로</a>
    </form>
    
    
    
    
    
    
    
    	
 	
 	
 	
 	
</body>
</html>
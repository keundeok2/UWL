<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <style>
        
        div.challDate{
        	text-align: right;
        }
    </style>
</head>
<body>
	<div class="container-md">
                   <br>
                    <h2>주간 도전과제 목록 (관리자용) </h2>
                     <br>
                     <div class="alert alert-secondary" role="alert">
					 	관리자라면 등록자 상관없이 내용을 수정할 수 있습니다. <br>
					</div>
                     
                     	
						  <div class="list-group">
                     	<c:forEach var="challenge" items="${list}">
							  <a href="#" class="list-group-item list-group-item-action">
							    <div class="d-flex w-100 justify-content-between">
							      <h5 class="mb-1">${challenge.challTitle}</h5>
							      <small class="text-muted">${challenge.challDate}</small>
							    </div>
							    <p class="mb-1">${challenge.challContent}</p>
							    <small class="text-muted">
							    	<c:if test="${challenge.challCategory == '1'}">
										Map
									</c:if>
									<c:if test="${challenge.challCategory == '2'}">
										Vision
									</c:if>
									<c:if test="${challenge.challCategory == '3'}">
										게시판활동
									</c:if>
							    </small>
							  </a>
							  <br>
                     	</c:forEach>
							</div>
							
							<br>
							<br>
						<!-- PageNavigation Start... -->
						<jsp:include page="../common/pageNavigator_new.jsp"/>
						<!-- PageNavigation End... -->
										

						
						
	</div>		
</body>
</html>
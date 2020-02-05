<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

// function loadEvent(){
// 	$("title").on("click", function(){
// 		var userId = $(this).next().val();
		
// 		$.ajax(
// 				{
// 					url : "/user/rest/getUser/"+userId,
// 					method : "GET",
// 					dataType : "json",
// 					headers : {
// 						"Accept" : "application/json",
// 						"Content=Type" : "application/json",
// 					},
// 					success : function(JSONData, status){
// 						var displayValue = "<h6>"
// 						+" 아이디 "+JSONData.userId+"<br/>"
// 						+" 이름 "+JSONData.name+"<br/>"
// 						+"</h6>";
// 					$("h6").remove();
// 					$("#"+userId+"").html(displayValue);
// 					}
						
// 				});
// 	});
	
// 	$("#userId").on("click", function(){
// 		self.location="/user/getUser?userId="+$(this).text().trim();
// 	});
// 	$("#userId").css("color","red");
	
// }





</script>
</head>


<body>
<h1>전체 회원 목록</h1>
    <hr>
  <br>
  
<c:set var="i" value="0"/>
 <div> <c:forEach var="user" items="${ list }">
 		
<c:set var ="i" value="${i}"/>
<!-- 	<title="Click"> -->
	<a href="/user/getUser?userId=${user.userId}">${user.userId}</a>
	
	
  	${user.name}
<!--   	</title> -->
  	<hr>
  </c:forEach>
  </div>
  
<br>

<!--     <button onclick="location.href='/user/addQuestions.jsp'">등록가기</button><br> -->
    <a href="javascript:history.go(-1)">뒤로</a>
</body>
</html>

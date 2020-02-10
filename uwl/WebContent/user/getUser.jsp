<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  ///////////////////////// Bootstrap 4.4, jQuery 3.1.1 CDN ////////////////////////// -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
			rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
			crossorigin="anonymous">
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	
	<!--  ///////////////////////// CSS, JS 4.4 CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

	//============= 회원정보수정 Event  처리 =============	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button#updateUser").on("click", function() {
			self.location = "/user/updateUser?userId=${user.userId}";
		});
	});
	
	
	
</script>
</head>




<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default" id="top">
        	<a class="navbar-brand" ><h2>회원정보</h2></a>
   	</div>	
   	<!-- ToolBar End /////////////////////////////////////-->	
	
			
 	<div class="container">
 		<br/>
 		<hr style="background-color:black; height:4px;">
 		
 		<div class="row" style="text-align:center;">
							<div class="col-md-1" style="text-align:center;">
										아 이 디
							</div>
							<div class="col-md-1" style="text-align:right;">
										비밀번호
							</div>
							<div class="col-md-1" style="text-align:right;">
										이     름
							</div>
							<div class="col-md-1" style="text-align:center;">
										닉 네 임
							</div>
							<div class="col-md-1" style="text-align:center;">
										학     교
							</div>
							<div class="col-md-1" style="text-align:center;">
										전화번호
							</div>
							<div class="col-md-2" style="text-align:center;">
										생     일
							</div>
							<div class="col-md-1" style="text-align:center;">
										성     별
							</div>
							<div class="col-md-1" style="text-align:center;">
										메     일
							</div>
							<div class="col-md-1" style="text-align:center;">
										사     진
							</div>
							
							
							
							<br><hr>
		</div>
	
		
		
		
 	</div>
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
<br>
	아 이 디  <div>${user.userId}</div>
<br>
	비밀번호  <div>${user.password}</div>
<br>
	이     름  <div>${user.name}</div>
<br>
	닉 네 임  <div>${user.nickname}</div>
<br>
	학     교  <div>${user.schoolNo}</div>
<br>
	전화번호  <div>${user.phone}</div>
<br>
	생      일  <div>${user.birth}</div>
<br>
<%-- 	성      별  <div>${user.gender}</div> --%>
	<c:if test="${user.gender == '1' }">
							성      별 <br>
							여자
	</c:if>
	<c:if test="${user.gender == '2'}">
							성      별  <br>
							남자
	</c:if>
	 <br>
	
	
	
	
	
<br>
	메      일  <div>${user.mail}</div>
<br>
	사      진 : <div>${user.profileName}</div>	
<br>
<br>

	<button type="button" id="updateUser">정보수정</button>
	<br><br>
	<button onclick="location.href='/index.jsp'">확인</button><br>
	<br><br>
	<a href="javascript:history.go(-1)">뒤로</a>

</body>




</html>
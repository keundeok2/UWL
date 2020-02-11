<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">


<!--  ///////////////////////// Bootstrap 4.4, jQuery 3.1.1 CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!--  ///////////////////////// CSS, JS 4.4 CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<script type="text/javascript">

	//============= 회원정보수정 Event  처리 =============	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button#updateUser").on("click", function() {
			self.location = "/user/updateUser?userId=${user.userId}";
		});
	});
</script>

<style>
body {
	margin: 50px;
	padding: 30px;
}

</style>
</head>


<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default" id="top">
		<a class="navbar-brand"><h2>회원정보</h2></a>
	</div>
	<!-- ToolBar End /////////////////////////////////////-->


		<table class="table table-hover text-center">

			<tr>
				<td> 아 이 디 </td>
				<td> ${user.userId} </td>
			</tr>
			<tr>
				<td> 비밀번호 </td>
				<td> ${user.password} </td>
			</tr>
			<tr>
				<td> 이     름 </td>
				<td> ${user.name} </td>
			</tr>
			<tr>
				<td> 닉 네 임 </td>
				<td> ${user.nickname} </td>
			</tr>
			<tr>
				<td> 학     교 </td>
				<td> ${user.schoolNo} </td>
			</tr>
			<tr>
				<td> 전화번호 </td>
				<td> ${user.phone} </td>
			</tr>
			<tr>
				<td> 생      일 </td>
				<td> ${user.birth} </td>
			</tr>
			<tr>
				<td> 성      별  </td>
				<td> <c:if test="${user.gender == '1' }">
								여자
					</c:if>
					<c:if test="${user.gender == '2'}">
											남자
					</c:if> 
					</td>
			</tr>
			<tr>
				<td> 메      일 </td>
				<td> ${user.mail} </td>
			</tr>
			<tr>
				<td> 사      진 </td>
				<td> ${user.profileName} </td>
			</tr>

		</table>
<br><br>





<!-- 	<div class="container" style="display: inline-block;text-align: center;">> -->
<%-- 		<br> <a class = "text-left">아 이 디</a>	 <a class="text-center">${user.userId}</a>  --%>
<%-- 		<br> 비밀번호	 <div>${user.password}</div> --%>
<%-- 		<br> 이 름	 <a>${user.name}</a>  --%>
<%-- 		<br> 닉 네 임 	<a>${user.nickname}</a> --%>
<%-- 		<br> 학 교	 <a>${user.schoolNo}</a>  --%>
<%-- 		<br> 전화번호	 <a>${user.phone}</a> --%>
<%-- 		<br> 생 일 	<a>${user.birth}</a>  --%>
<!-- 		<br> -->
<%-- 		<c:if test="${user.gender == '1' }"> --%>
<!-- 							성      별 <br> -->
<!-- 							여자 -->
<%-- 	</c:if> --%>
<%-- 		<c:if test="${user.gender == '2'}"> --%>
<!-- 							성      별  <br> -->
<!-- 							남자 -->
<%-- 	</c:if> --%>
<%-- 		<br> 메 일 <a>${user.mail}</a>  --%>
<%-- 		<br> 사 진 <a>${user.profileName}</a> --%>
<!-- 		<br> <br> -->




		<div class="text-center">
			<button type="button" id="updateUser"
				class="btn btn-outline-info btn-lg">정보수정</button>
				
			<button onclick="location.href='/index.jsp'"
				class="btn btn-outline-info btn-lg">확인</button>
			<br> <br>
			<!-- 	<a href="javascript:history.go(-1)" class="btn btn-outline-info btn-lg">뒤로</a> -->
		</div>
</body>

</html>
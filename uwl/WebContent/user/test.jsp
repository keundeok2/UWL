<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// Bootstrap 4.4, jQuery 3.1.1 CDN ////////////////////////// -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<!--  ///////////////////////// CSS, JS 4.4 CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
	//============= 회원정보수정 Event  처리 =============	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click", function() {
// 			self.location = "/user/getUser?userId=${user.userId}"
			$("table").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
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
		<a class="navbar-brand"><h2>회원정보수정</h2></a>
	</div>
	<!-- ToolBar End /////////////////////////////////////-->
	
	<table class="table table-hover text-center">

			<tr>
				<td> 이     름 </td>
				<td>  <input type="hidden"	name="name"	 value="${user.name}" readonly>${user.name} </td>
			</tr>
			<tr>
				<td> 아 이 디 </td>
				<td> <input type="hidden" 	name="userId" value="${user.userId}" readonly>${user.userId} </td>
			</tr>
			<tr>
				<td> 비밀번호 </td>
				<td> <input type="text" 	name="password"	 value="${user.password}"> </td>
			</tr>
			<tr>
				<td> 닉 네 임 </td>
				<td> <input type="text" 	name="nickname"	 value="${user.nickname}"> </td>
			</tr>
			<tr>
				<td> 학     교 </td>
				<td> <input type="text" 	name="schoolNo"	 value="${user.schoolNo}"> </td>
			</tr>
			<tr>
				<td> 전화번호 </td>
				<td> <input type="text" 	name="phone"	 value="${user.phone}"> </td>
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
				<td> <input type="text" 	name="mail"	 value="${user.mail}"> </td>
			</tr>
			<tr>
				<td> 사      진 </td>
				<td> <input type="file" 	name="profileName"	 value="${user.profileName}"> </td>
			</tr>
			<tr>
				<td> 공개설정 </td>
				<td> <input type="radio" name="publicStatus" value="1" checked> 공개 &nbsp;
		    <input type="radio" name="publicStatus" value="2"> 비공개
								
<%-- 				<input type="text" name="publicStatus" value="${user.publicStatus}"> --%>
<%-- 						<c:if test="${user.publicStatus == '1' }">공개</c:if> --%>
<%-- 						<c:if test="${user.publicStatus == '2'}">비공개</c:if>  --%>
				</td>
			</tr>
		</table>
<br><br>
	
	
<!-- 	사진 수정 안됨 -->
	<div class="text-center">
	<button type="button" id="updateUser" class="btn btn-outline-info btn-lg">완료</button>
	</div>
</body>


</html>
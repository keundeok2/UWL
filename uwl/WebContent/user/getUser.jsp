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
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
			rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
			crossorigin="anonymous">
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!--  ///////////////////////// CSS, JS 4.4 CDN ////////////////////////// -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<style>
body {
	margin: 50px;
	padding: 30px;
}

</style>

<script type="text/javascript">

	//============= 회원정보수정 Event  처리 =============	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button#updateUser").on("click", function() {
			$('#message').remove();
			var password = $('#password').val();
			if(password == "${user.password}"){
				self.location = "/user/updateUser?userId=${user.userId}";
			}else{
				var view = "<span id='message'>비밀번호를 확인해주세요!</span>";
				$('#password').after(view)
			}
		});
	});
</script>

</head>


<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default" id="top">
		<a class="navbar-brand"><h2>회원정보</h2></a> <img src="/images/${user.profileName }" width="100px" height="100px">
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
<!-- 			<tr> -->
<!-- 				<td> 사      진 </td> -->
<%-- 				<td> ${user.profileName} </td> --%>
<!-- 					//프로필에서 수정? -->
<!-- 			</tr> -->

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
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#updateModal">정보수정</button>
				
			<button onclick="location.href='/index.jsp'"
				class="btn btn-outline-info btn-lg">확인</button>
		</div>
		<div class="text-right">
			<button onclick="location.href='/user/logout'"
				class="btn btn-outline-info btn-lg">로그아웃</button>
		</div>	
		
			<!-- 	<a href="javascript:history.go(-1)" class="btn btn-outline-info btn-lg">뒤로</a> -->
		

<!-- Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="form-group">
			<label for="userId">ID</label>
				<input type="text" name="userId" id="userId" class="form-control" readonly="readonly" value="${user.userId }">
		</div>					
		<div class="form-group">
			<label for="password">PW</label>
				<input name="password" id="password" class="form-control" type="password">
		</div>					
	</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="updateUser">확인</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>




</body>

</html>
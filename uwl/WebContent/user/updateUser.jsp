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
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!--  ///////////////////////// CSS, JS 4.4 CDN ////////////////////////// -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<style>
body {
	margin: 50px;
	padding: 30px;
}

</style>

<script type="text/javascript">

// 	//============= 회원정보수정 Event  처리 =============	
// 	$(function() {
// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 		$('#updateUserButton').on("click", function() {
// 			console.log("5");
// // 			self.location = "/user/getUser?userId=${user.userId}"
// 			$('#table').attr("method" , "POST").attr("action" , "/user/updateUser").submit();
// 			console.log("6");
// 		});
// 	});
	
	
	//============= "수정"  Event 연결 =============
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( '#updateUserButton' ).on("click" , function() {
			fncUpdateUser();
		});
	});	
	
	// 비번 확인 모달창 test
	
// 	$('#contact').on('shown.bs.modal', function () {
// 		 var i = $('#contact').trigger('focus')
// 		 console.log(i);
// 		})
	
// 	$(document).ready(function(){	
// 		$("#contactForm").submit(function(event){
// 			submitForm();
// 			console.log(submit);
// 			return false;
// 		});
// 	});
	
// 	$(document).ready(function(){
// 		$("#submit").click(function(){
// 			$("#contact-modal").modal();
// 		});
// 	});
	
// 	function submit(){
// 		 $.ajax({
// 			type: "POST",
// 			url: "/user/updateUser",
// 			cache:false,
// 			data: $('form#contactForm').serialize(),
// 			success: function(response){
// 				$("#contact").html(response)
// 				$("#contact-modal").modal('hide');
// 			},
// 			error: function(){
// 				alert("Error");
// 			}
// 		});
// 	}
// 	<?php
// 			if (isset($_POST['password'])) {
// 				$userId = strip_tags($_POST['userId']);
// 				$password = strip_tags($_POST['password']);
// 			}
// 			?>
	// 비번 확인 모달창 test
	
	
	
	///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			console.log("3");
			var name=$("input[name='name']").val();
			console.log(name);
			
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
				
// 			Debug...
// 			alert("phone : "+value);
			$("#user").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
			console.log("submit 다음")
		}
	
</script>


</head>

<body>
<!-- 비번 확인 모달창 test -->
<div id="contact"><button type="button" class="btn btn-info btn" data-toggle="modal" data-target="#contact-modal">Show Contact Form</button></div>
<div id="contact-modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>Contact Form</h3>
			</div>
			<form id="contactForm" name="contact" role="form">
				<div class="modal-body">	
					<div class="form-group">
						<label for="userId">ID</label>
						<input type="text" name="userId" class="form-control">
					</div>					
					<div class="form-group">
						<label for="password">PW</label>
						<input type="text" name="password" class="form-control">
					</div>					
				</div>
				<div class="modal-footer">					
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="submit" class="btn btn-success" id="submit">
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 비번 확인 모달창 test -->


	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default" id="top">
		<a class="navbar-brand"><h2>회원정보수정</h2></a>
	</div>
	<!-- ToolBar End /////////////////////////////////////-->
	<form id="user">
	<table class="table table-hover text-center" id="table">
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
	<button type="button" id="updateUserButton" class="btn btn-outline-info btn-lg">완료</button>
	</div>
	</form>
</body>


</html>
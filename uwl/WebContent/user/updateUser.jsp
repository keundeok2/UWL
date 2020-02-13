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
	background-color:#eee;
/* 	position: fixed; */
/*   	overflow: hidden;   */
/*    	data-backdrop: static;   */
/*   	data-keyboard: false;   */
}

.toggle {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
 	transform: translate(-50%,-50%);
/*  	overflow: hidden;  */
/*  	data-backdrop: static;  */
/*  	data-keyboard: false;  */
}

.toggle.on {
	display: block;
}

</style>


<script type="text/javascript">

	
	//============= "수정"  Event 연결 =============
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( '#updateUserButton' ).on("click" , function() {
			fncUpdateUser();
		});
	});	
	
		function fncUpdateUser() {
			var name=$("input[name='name']").val();
			
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
				
//			Debug...
//			alert("phone : "+value);
			$("#user").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
///////////////////////////////////////////////////////////////////////
	
	
	
	// 비번 확인 모달창 
		
		$(function(){
			$('button[type=hidden]').click();
			console.log("1");
		});
	// 비번 확인 모달창 
	
	
	// 비번 확인 모달창 test
	
		$( function() {
			console.log("2");
			$("#userId").focus();
			console.log("3");
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#submit").on("click" , function() {
// 				var userId=$("input:text").val();
// 				var password=$("input:text").val();
				
// 				if(userId == null || userId.length <1) {
// 					alert('ID 를 입력하지 않으셨습니다.');
// 					$("#userId").focus();
// 					return;
// 				}
// // 				else{
// // 					alert('패스워드를 입력하지 않으셨습니다.');
// // 				}
// 				console.log("4");
				
// 				if(password == null || password.length <1) {
// 					alert('패스워드를 입력하지 않으셨습니다.');
// 					$("#password").focus();
// 					return;
// 				}
				console.log("5");
// 				$("#user").attr("method","GET").attr("action","/user/updateUser?userId=${user.userId}").submit();
				$("#user").attr("method","GET").attr("action","/user/updateUser").attr("target","_parent").submit();
			});
		});	
	
	
	
	
	
// 	$(function() {
// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 		$("#submit").on("click", function() {
// 			console.log("2");
// 			self.location = "/user/updateUser?userId=${user.userId}";
// 			console.log("3");
// 		});
// 	});
	
	
// 	function submit(){
// 		console.log("2");
// 		 $.ajax({
// 			type: "POST",
// 			url: "/user/updateUser",
// 			cache:false,
// 			data: $('.modal-body').serialize(),
// 			success: function(response){
// 				$(".modal fade").html(response)
// 				$(".modal fade").modal('hide');
// 				console.log("3");
// 			},
// 			error: function(){
// 				alert("Error");
// 			}
// 		});
// 	}
	
	// 비번 확인 모달창 test
	
	
	
	
</script>
</head>

<body>

<!-- 비번 확인 모달창 test -->

<!-- Button trigger modal -->
<button type="hidden" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop" style="display: none">
  Launch static backdrop modal
</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"> 보안 </h5>
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
      </div>
      <div class="modal-body">
       <div class="form-group">
			<label for="userId">ID</label>
				<input type="text" name="userId" id="userId" class="form-control">
		</div>					
		<div class="form-group">
			<label for="password">PW</label>
				<input type="text" name="password" id="password" class="form-control">
		</div>					
	</div>
      <div class="modal-footer">
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
        <button type="button" class="btn btn-primary" id="submit">확인</button>
      </div>
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
				<td> 아 이 디 </td>
				<td> <input type="hidden" 	name="userId" value="${user.userId}" readonly>${user.userId} </td>
			</tr>
			<tr>
				<td> 이     름 </td>
				<td>  <input type="hidden"	name="name"	 value="${user.name}" readonly>${user.name} </td>
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
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

	//============= 회원정보수정 Event  처리 =============	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click", function() {
			self.location = "/user/updateUser?userId=${user.userId}";
		});
	});
	
	
	
</script>
</head>




<body>
	
	getUser.jsp
			
	<hr>
	아 이 디  <div>${user.userId}</div>
	<hr>
	비밀번호  <div>${user.password}</div>
	<hr>
	이     름  <div>${user.name}</div>
	<hr>
	닉 네 임  <div>${user.nickname}</div>
	<hr>
	학     교  <div>${user.schoolNo}</div>
	<hr>
	전화번호  <div>${user.phone}</div>
	<hr>
	생      일  <div>${user.birth}</div>
	<hr>
	성      별  <div>${user.gender}</div>
	<hr>
	메      일  <div>${user.mail}</div>
	<hr>

	<button type="button" id="updateUser">정보수정</button>

</body>




</html>
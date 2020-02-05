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
	성      별  <div>${user.gender}</div>
<br>
	메      일  <div>${user.mail}</div>
<br>

	<button type="button" id="updateUser">정보수정</button>
	<br><br>
	<a href="javascript:history.go(-1)">뒤로</a>

</body>




</html>
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
// 			self.location = "/user/getUser?userId=${user.userId}"
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		});
	});
</script>
</head>


<body>
	
	updateUser.jsp
	<hr>
	
	<form>
	이     름   <input type="text"	name="name"	 value="${user.name}">
	<hr>
	아 이 디  <input type="hidden" 	name="userId" value="${user.userId}" readonly>${user.userId}
	<hr>
	비밀번호   <input type="text" 	name="password"	 value="${user.password}">
	<hr>
	닉 네 임   <input type="text" 	name="nickname"	 value="${user.nickname}">
	<hr>
	학     교   <input type="text" 	name="schoolNo"	 value="${user.schoolNo}">
	<hr>
	전화번호 <input type="text" 	name="phone"	 value="${user.phone}">
	<hr>
	메      일  <input type="text" 	name="mail"	 value="${user.mail}">
	<hr>
	공개설정  <input type="text" 	name="publicStatus"	 value="${user.publicStatus}">
	
</form>
	<button type="button" id="updateUser">완료</button>

</body>


</html>
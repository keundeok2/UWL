<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<script type="text/javascript">
	

$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click", function() {
			self.location = "/user/findId?userId=${user.userId}"
		});
	});
</script>
</head>




<body>
	
	findId.jsp
			
	<hr>
	이     름  <div>${user.name}</div>
	<hr>
	전화번호  <div>${user.phone}</div>
	<hr>
	메      일  <div>${user.mail}</div>
	<hr>

	<button type="button" id="findId">아이디 찾기</button>

</body>




</html>
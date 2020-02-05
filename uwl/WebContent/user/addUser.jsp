<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<script type="text/javascript">
	//============= 회원정보수정 Event  처리 =============	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click", function() {
			self.location = "/user/updateUser?userId=${user.userId}"
		});
	});
</script>
</head>




<body>
	
	
			<div class="col-xs-8 col-md-4">${user.userName}</div>
	
	아이디 <div>${user.userId}</div>
	이름 ${user.name}
	<button type="button" id="updateUser">정보수정</button>

</body>




</html>
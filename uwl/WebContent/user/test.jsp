<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<script type="text/javascript">
	

$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click", function() {
			self.location = "/user/findId?userId=${user.userId}"
		});
	});
</script>
</head>




<body>
	
	findId.jsp
			
	<hr>
	��     ��  <div>${user.name}</div>
	<hr>
	��ȭ��ȣ  <div>${user.phone}</div>
	<hr>
	��      ��  <div>${user.mail}</div>
	<hr>

	<button type="button" id="findId">���̵� ã��</button>

</body>




</html>
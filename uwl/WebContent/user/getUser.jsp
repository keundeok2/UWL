<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

	//============= ȸ���������� Event  ó�� =============	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click", function() {
			self.location = "/user/updateUser?userId=${user.userId}";
		});
	});
	
	
	
</script>
</head>




<body>
	
	getUser.jsp
			
	<hr>
	�� �� ��  <div>${user.userId}</div>
	<hr>
	��й�ȣ  <div>${user.password}</div>
	<hr>
	��     ��  <div>${user.name}</div>
	<hr>
	�� �� ��  <div>${user.nickname}</div>
	<hr>
	��     ��  <div>${user.schoolNo}</div>
	<hr>
	��ȭ��ȣ  <div>${user.phone}</div>
	<hr>
	��      ��  <div>${user.birth}</div>
	<hr>
	��      ��  <div>${user.gender}</div>
	<hr>
	��      ��  <div>${user.mail}</div>
	<hr>

	<button type="button" id="updateUser">��������</button>

</body>




</html>
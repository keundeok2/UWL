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
			
<br>
	�� �� ��  <div>${user.userId}</div>
<br>
	��й�ȣ  <div>${user.password}</div>
<br>
	��     ��  <div>${user.name}</div>
<br>
	�� �� ��  <div>${user.nickname}</div>
<br>
	��     ��  <div>${user.schoolNo}</div>
<br>
	��ȭ��ȣ  <div>${user.phone}</div>
<br>
	��      ��  <div>${user.birth}</div>
<br>
	��      ��  <div>${user.gender}</div>
<br>
	��      ��  <div>${user.mail}</div>
<br>

	<button type="button" id="updateUser">��������</button>
	<br><br>
	<a href="javascript:history.go(-1)">�ڷ�</a>

</body>




</html>
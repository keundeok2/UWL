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
	��     ��   <input type="text"	name="name"	 value="${user.name}">
	<hr>
	�� �� ��  <input type="hidden" 	name="userId" value="${user.userId}" readonly>${user.userId}
	<hr>
	��й�ȣ   <input type="text" 	name="password"	 value="${user.password}">
	<hr>
	�� �� ��   <input type="text" 	name="nickname"	 value="${user.nickname}">
	<hr>
	��     ��   <input type="text" 	name="schoolNo"	 value="${user.schoolNo}">
	<hr>
	��ȭ��ȣ <input type="text" 	name="phone"	 value="${user.phone}">
	<hr>
	��      ��  <input type="text" 	name="mail"	 value="${user.mail}">
	<hr>
	��������  <input type="text" 	name="publicStatus"	 value="${user.publicStatus}">
	
</form>
	<button type="button" id="updateUser">�Ϸ�</button>

</body>


</html>
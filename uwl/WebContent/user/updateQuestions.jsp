<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click", function() {
// 			self.location = "/user/getUser?userId=${user.userId}"
			$("form").attr("method" , "POST").attr("action" , "/user/updateQuestions").submit();
		});
	});
</script>
</head>


<body>
	
	updateQuestions.jsp
	<hr>
	
	<form>
<%-- 	���̵�  : <input type="text"	name="userId"		 value="${user.userId}"		readonly> --%>
	���̵�  :${user.userId}
	<hr>
	����  : <input type="text"		name="postTitle"	 value="${post.postTitle}">
	<hr>
	����  : <input type="text" 	name="postContent"	 value="${post.postContent}">
	<hr>
	
	  �������� :    <input type= "radio" id="viewStatus"	name="viewStatus"	value="1"	checked/> ����
    <input type= "radio" id="viewStatus"	name="viewStatus"	value="2"/> �����
  
  
    <br> 
    <br> 
    <br> 
	
	
	
</form>
	<button type="button" id="updateQuestions">�Ϸ�</button>

</body>


</html>
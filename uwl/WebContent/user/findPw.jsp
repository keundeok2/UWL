<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	// $(function() {
	// 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	// 		$("button").on("click", function() {
	// 			self.location = "/user/findId?userId=${user.userId}"
	// 		});
	// 	});


	$(function() {

		// 	$("#userId").focus();

		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button#findPw").on(
				"click",
				function() {

					$("form").attr("method", "POST").attr("action",
							"/user/getUser").submit();
				});
	});

</script>
</head>


<body>



	<form>
		<div id=findPw>
			<hr>
			�� �� �� <input type="text" id="userId" name="userId" placeholder="ID">
			<hr>
			�� �� <input type="text" id="name" name="name" placeholder="�̸�">
			<button type="button" id="findPw">��й�ȣ ã��</button>
		</div>
	</form>




</body>


</html>
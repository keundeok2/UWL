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
		$("button#findId").on(
				"click",
				function() {

					$("form").attr("method", "POST").attr("action",
							"/user/getUser").submit();
				});
	});


	// //==>"������ȣ �ޱ�" Event ó�� �� ����
	// $(function() {
	// 	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	// 	 $("button#checkMail").on("click" , function() {
	// 		popWin 
	// 		= window.open("/user/checkDuplicationMail.jsp",
	// 									"popWin", 
	// 									"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
	// 									"scrollbars=no,scrolling=no,menubar=no,resizable=no");
	// 	});
	// });
</script>
</head>


<body>


	<form>
		<div id=findId>
			<hr>
			�� �� <input type="text" id="name" name="name" placeholder="�̸�">

			<hr>
			<!-- 	��ȭ��ȣ   -->
			<!-- 	<input type="text" id="phone" name="phone" placeholder="��ȭ��ȣ"> -->
			<!-- 	  <div><button type="button" class="btn btn-info" id="checkNick">������ȣ</button></div> -->
			<!-- 	<hr> -->
			�� �� <input type="text" id="mail" name="mail" placeholder="����">
			<button type="button" id="findId">���̵� ã��</button>
		</div>
	</form>




</body>


</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- ===================================================== test ========================= -->
<html lang="ko">

<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
	// $(function() {
	// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	// 		$("button").on("click", function() {
	// 			self.location = "/user/findId?userId=${user.userId}"
	// 		});
	// 	});


// 	$(function() {
// 		// 	$("#userId").focus();
// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 		$("button#findPw").on(
// 				"click",
// 				function() {

// 					$("form").attr("method", "POST").attr("action",
// 							"/user/rest/findPw").submit();
// 				});
// 	});
	
	
	
	
	
	$(document).on("click", "#findPw", function() {
		var userId = $('#userId').val();
// 		var name = $('#name').val();
// 		var mail = $('#mail').val();
console.log(userId);
		var postData = {'userId' : userId};
// 		var postData = {'userId' : userId , 'name' : name , 'mail' : mail};
// 	$(function() {
// 		userId = $("input#userId").val();
// 		name = $("input#name").val();
// 		mail = $("input#mail").val();
// 	});
	
	
	$.ajax({
		url: "/user/rest/findPw", 
		type: 'POST',
		dataType: 'json',
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data: JSON.stringify({
			postData,
		}),
		success : function(data) {
		console.log(data);
        	var userLists = data.password;
        	var userLength = userLists.length;
        	var userfind = userLength.substring(1, userLength-1);
       	 		 $("#mail").append("<h1>"+"회원님의 정보 : "+userfind+" 입니다.</h1>");
       	 		 $("#mail").after(userfind);
        },
			
			
			
			
			
			
			
			
// 			if (data.success) {
// 				var msg = '성공';
// 				alert(msg);
// // 				$.redirect("/user/getProfile/"+sessionId,{}, "get");
// 			} else {
// 				var msg = '실패';
// 				alert(msg);
// // 				$("#purchaseModal").modal("hide");
// 			}
		})
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</script>
</head>


<body>



	<form>
		<div id=findPw>
			<hr>
			아 이 디 <input type="text" id="userId" name="userId" placeholder="ID">
<!-- 			이 름 <input type="text" id="name" name="name" placeholder="이름"> -->
<!-- 			메 일 <input type="text" id="mail" name="mail" placeholder="이름"> -->
			
			<button type="button" id="findPw" name="findPw">비밀번호 찾기</button>
		</div>
	</form>




</body>


</html>